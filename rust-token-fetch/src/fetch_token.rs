use std::{collections::HashMap, fs, io::Write, path::Path};

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

pub fn fetch_and_store_tokens(config: &Config, target_group: Option<&str>)
 {
    let repo_groups_path = Path::new("rust-token-fetch/repo-groups.toml");
    let repo_groups_str =
        fs::read_to_string(repo_groups_path).expect("Failed to read repo-groups.toml");
    let _groups: toml::Value =
        toml::from_str(&repo_groups_str).expect("Invalid repo-groups format");

    let jwt = generate_jwt(&config);
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

        // Save to token.json inside the group folder
        let folder_path = Path::new(group_name);
        fs::create_dir_all(folder_path).expect("Failed to create folder");

        let token_path = folder_path.join("token.json");
        let json_data =
            serde_json::to_string_pretty(&token_res).expect("Failed to serialize token");

        fs::write(token_path, json_data).expect("Failed to write token");

        // Also print TF_VAR_* export line
        // let export_line = format!(
        //     "export TF_VAR_{}_token=\"{}\"",
        //     group_name.replace('-', "_"),
        //     token_res.token
        // );
        println!("{}", token_res.token);


        // let mut env_file = fs::OpenOptions::new()
        //     .create(true)
        //     .append(true)
        //     .open(".env")
        //     .expect("Failed to open .env");
        // writeln!(env_file, "{}", export_line).expect("Failed to write to .env");

        
    }
}
