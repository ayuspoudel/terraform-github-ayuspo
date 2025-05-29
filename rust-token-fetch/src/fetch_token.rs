use std::{collections::HashMap, fs, path::Path};

use reqwest::blocking::Client;
use serde::{Deserialize, Serialize};
use serde_json::json;

use crate::config::Config;
use crate::jwt::generate_jwt;

#[derive(Debug, Deserialize, Serialize)]
struct InstallationTokenResponse {
    token: String,
    expires_at: String,
}

pub fn fetch_and_store_tokens(config: &Config, target_group: Option<&str>) {
    println!("Starting token fetch logic...");

    let repo_groups_path = Path::new("rust-token-fetch/repo-groups.toml");
    println!("Loading group config from {:?}", repo_groups_path);

    let repo_groups_str = fs::read_to_string(repo_groups_path)
        .expect("Failed to read repo-groups.toml");
    let _groups: toml::Value = toml::from_str(&repo_groups_str)
        .expect("Invalid repo-groups format");

    let jwt = generate_jwt(config);
    let client = Client::new();

    for (group_name, install_id) in &config.group_installations {
        println!("Checking group: {}", group_name);

        if let Some(target) = target_group {
            println!("Target group specified: {}", target);
            if group_name != target {
                println!("Skipping group: {}", group_name);
                continue;
            }
        }

        let url = format!(
            "https://api.github.com/app/installations/{}/access_tokens",
            install_id
        );

        println!("Requesting token from: {}", url);

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

        println!("Token received for group: {}", group_name);

        let tfvars_path = format!("./{}/github.auto.tfvars.json", group_name);
        let tfvars_dir = Path::new(&tfvars_path).parent().unwrap();

        if !tfvars_dir.exists() {
            panic!("❌ Target directory does not exist: {}", tfvars_dir.display());
        }

        println!("Writing token to: {}", tfvars_path);

        let tfvars_content = json!({ "github_token": token_res.token });
        fs::write(&tfvars_path, tfvars_content.to_string())
            .expect("❌ Failed to write .auto.tfvars.json");

        println!("✅ Successfully wrote token to file.");
    }
}
