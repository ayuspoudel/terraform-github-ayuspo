use std::{collections::HashMap, fs, path::Path};
use reqwest::blocking::Client;
use serde::{Deserialize, Serialize};
use std::fs::File;
use std::io::Write;

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

#[derive(Debug, Deserialize)]
struct InstallationTokenResponse {
    token: String,
    expires_at: String,
}

pub fn fetch_and_store_tokens(config: &Config) {
    let repo_groups_path = Path::new("github-token-gen/repo-groups.toml");
    let repo_groups_str = fs::read_to_string(repo_groups_path).expect("Failed to read repo-groups.toml");
    let groups: toml::Value = toml::from_str(&repo_groups_str).expect("Invalid repo-groups format");

    let jwt = generate_jwt(&config);
    let client = Client::new();

    // Open or create .env file to write exports
    let mut env_file = fs::OpenOptions::new()
        .create(true)
        .write(true)
        .truncate(true)
        .open(".env")
        .expect("Failed to open .env");

    for (group_name, install_id) in &config.group_installations {
        let url = format!(
            "https://api.github.com/app/installations/{}/access_tokens",
            install_id
        );

        let res = client
            .post(&url)
            .header("Authorization", format!("Bearer {}", jwt))
            .header("Accept", "application/vnd.github+json")
            .header("User-Agent", "github-token-gen")
            .send()
            .expect("Failed to send request");

        if !res.status().is_success() {
            panic!("GitHub API returned error: {}", res.status());
        }

        let token_res: InstallationTokenResponse = res
            .json()
            .expect("Failed to deserialize token response");

        // Save token JSON in folder
        let folder_path = Path::new(group_name);
        fs::create_dir_all(folder_path).expect("Failed to create folder");

        let token_path = folder_path.join("token.json");
        let mut file = File::create(token_path).expect("Failed to create token.json");
        let json_data = serde_json::to_string_pretty(&token_res).expect("Failed to serialize token");
        file.write_all(json_data.as_bytes()).expect("Failed to write token");

        println!(" Token saved for group '{}', expires at {}", group_name, token_res.expires_at);

        // 🌱 Also generate TF_VAR_* export line
        let export_line = format!("export TF_VAR_{}_token=\"{}\"", group_name.replace('-', "_"), token_res.token);
        println!("{}", export_line);
        writeln!(env_file, "{}", export_line).expect("Failed to write to .env");
    }
}
