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
    /// Loads the configuration from a given TOML file path.
    pub fn load(path: &str) -> Self {
        let config_path = Path::new(path);
        let config_str = fs::read_to_string(config_path)
            .unwrap_or_else(|_| panic!("❌ Failed to read config file at: {}", path));
        toml::from_str(&config_str)
            .unwrap_or_else(|_| panic!("❌ Invalid config format in: {}", path))
    }

    /// Resolves the private key path relative to the config path.
    pub fn resolved_private_key_path(&self) -> PathBuf {
        Path::new("rust-token-fetch").join(&self.private_key_path)
}   

}
