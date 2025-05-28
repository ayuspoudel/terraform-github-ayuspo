use serde::Deserialize;
use std::collections::HashMap;
use std::fs;
use std::path::{Path, PathBuf};

#[derive(Debug, Deserialize)]
pub struct Config {
    pub app_id: String,
    pub private_key_path: String,
    pub group_installations: HashMap<String, u64>,
}

impl Config {
    pub fn load(path: &str) -> Self {
        let config_str = fs::read_to_string(path).expect("Failed to read config.toml");
        toml::from_str(&config_str).expect("Invalid config format")
    }

    pub fn resolved_private_key_path(&self) -> Option<PathBuf> {
        let base = Path::new("github-token-gen");
        Some(base.join(&self.private_key_path))
    }
}
