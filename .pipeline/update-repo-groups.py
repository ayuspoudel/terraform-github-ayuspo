import os
import hcl2
from pathlib import Path
import tomli_w as toml


ROOT = Path(__file__).resolve().parent.parent
OUTPUT = ROOT / "rust-token-fetch" / "repo-groups.toml"

def find_repo_hcl_files(root):
    for entry in root.iterdir():
        if entry.is_dir():
            repo_file = entry / "repos.hcl"
            if repo_file.exists():
                yield entry.name, repo_file

def extract_repo_names(hcl_file):
    with hcl_file.open("r") as f:
        parsed = hcl2.load(f)
    names = []
    locals_block = parsed.get("locals", [])
    for block in locals_block:
        for repo_group, repos in block.items():
            for _, repo_data in repos.items():
                repo_name = repo_data.get("name")
                if repo_name:
                    names.append(repo_name)
    return names

def main():
    groups = {}
    for folder_name, repo_file in find_repo_hcl_files(ROOT):
        repos = extract_repo_names(repo_file)
        if repos:
            groups[f"groups.{folder_name}"] = {"repos": repos}

    with OUTPUT.open("w", encoding="utf-8") as f:
        f.write(toml.dumps(groups))


    print(f"Updated: {OUTPUT}")

if __name__ == "__main__":
    main()
