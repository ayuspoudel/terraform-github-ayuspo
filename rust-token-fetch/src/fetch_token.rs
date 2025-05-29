use std::{collections::HashMap, fs, path::Path};

use reqwest::blocking::Client;
use serde::{Deserialize, Serialize};

use crate::config::Config;
use crate::jwt::generate_jwt;

#[derive(Debug, Deserialize)]
struct RepoGroupsToml {
    groups: HashMap<String, GroupRepos>,
}

#[derive(Debug, Deserialize)]
struct GroupRepos {
    repos: Vec<String>,
}

#[derive(Debug, Deserialize, Serialize)]
struct InstallationTokenResponse {
    token: String,
    expires_at: String,
}

pub fn fetch_and_store_tokens(config: &Config, target_group: Option<&str>) {
    let repo_groups_path = Path::new("rust-token-fetch/repo-groups.toml");
    let repo_groups_str = fs::read_to_string(repo_groups_path)
        .expect("Failed to read repo-groups.toml");
    let _groups: toml::Value =
        toml::from_str(&repo_groups_str).expect("Invalid repo-groups format");

    let jwt = generate_jwt(config);
    let client = Client::new();

    for (group_name, install_id) in &config.group_installations {
        if let Some(target) = target_group {
            if group_name != target {
                continue;
            }
        }

        let url = format!(
            "https://api.github.com/app/installations/{}/access_tokens",
            install_id
        );

        let res = client
            .post(&url)
            .header("Authorization", format!("Bearer {}", jwt))
            .header("Accept", "application/vnd.github+json")
            .header("User-Agent", "rust-token-fetch")
            .send()
            .expect("Failed to send request");

        if !res.status().is_success() {
            panic!("GitHub API returned error: {}", res.status());
        }

        let token_res: InstallationTokenResponse =
            res.json().expect("Failed to deserialize token response");

        let tfvars_path = format!("./{}/github.auto.tfvars.json", group_name);
        let tfvars_content = json!({ "gh_token": token_res.token });
        fs::write(&tfvars_path, tfvars_content.to_string()).expect("Failed to write .auto.tfvars.json");

    }
}
