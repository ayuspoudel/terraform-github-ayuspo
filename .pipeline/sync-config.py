import os
import hcl2
from pathlib import Path
import tomli
import tomli_w as toml
import yaml
from ruamel.yaml import YAML

ROOT = Path(__file__).resolve().parent.parent
CONFIG_PATH = ROOT / "rust-token-fetch" / "config.toml"
WORKFLOW_PATH = ROOT / ".github" / "workflows" / "create-secrets.yaml"
DEFAULT_INSTALLATION_ID = 68637543

def find_repo_group_folders(root):
    groups = set()
    for entry in root.iterdir():
        if entry.is_dir() and (entry / "repos.hcl").exists():
            groups.add(entry.name)
    return groups

def load_existing_config(path):
    if not path.exists():
        return {}, {}
    with path.open("rb") as f:
        parsed = tomli.load(f)
    return parsed, parsed.get("group_installations", {})

def sync_groups(existing_groups, detected_groups, default_id):
    updated_groups = {}
    for group in sorted(detected_groups):
        updated_groups[group] = existing_groups.get(group, default_id)
    return updated_groups



def update_workflow_yaml(workflow_path, new_options):
    yaml = YAML()
    yaml.preserve_quotes = True

    with workflow_path.open("r") as f:
        data = yaml.load(f)

    data["on"]["workflow_dispatch"]["inputs"]["target_directory"]["options"] = sorted(new_options)

    with workflow_path.open("w") as f:
        yaml.dump(data, f)

    print(f"Updated: {workflow_path}")

def main():
    detected_groups = find_repo_group_folders(ROOT)

    # Update config.toml
    config_data, existing_groups = load_existing_config(CONFIG_PATH)
    config_data["group_installations"] = sync_groups(existing_groups, detected_groups, DEFAULT_INSTALLATION_ID)
    with CONFIG_PATH.open("wb") as f:
        f.write(toml.dumps(config_data).encode("utf-8"))
    print(f"Synced config: {CONFIG_PATH}")

    # Update workflow
    update_workflow_yaml(WORKFLOW_PATH, detected_groups)

if __name__ == "__main__":
    main()
