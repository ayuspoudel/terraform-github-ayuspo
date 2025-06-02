import os
import csv
import hcl2
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CSV_PATH = ROOT / ".artifacts" / "repos.csv"

def find_repo_hcl_files(root):
    for entry in root.iterdir():
        if entry.is_dir() and entry.name.startswith("repo-"):
            repo_file = entry / "repos.hcl"
            if repo_file.exists():
                yield entry.name, repo_file

def generate_repo_csv():
    rows = []
    for folder_name, repo_file in find_repo_hcl_files(ROOT):
        with repo_file.open("r") as f:
            parsed = hcl2.load(f)

        locals_block = parsed.get("locals", [])
        for block in locals_block:
            for repo_group, repos in block.items():
                for tf_state_name, repo_data in repos.items():
                    repo_name = repo_data.get("name")
                    if repo_name:
                        rows.append((folder_name, repo_name, tf_state_name))

    CSV_PATH.parent.mkdir(parents=True, exist_ok=True)
    with CSV_PATH.open("w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["folder_name", "repository_name", "state_name"])
        writer.writerows(rows)

    print(f"CSV written to: {CSV_PATH}")

if __name__ == "__main__":
    generate_repo_csv()
