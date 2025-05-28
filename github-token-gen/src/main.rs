use chrono::{Duration, Utc};
use jsonwebtoken::{encode, Algorithm, EncodingKey, Header};
use serde::Deserialize;
use std::{fs, path::Path};

#[derive(Debug, Deserialize)]
struct Config {
    app_id: String,
    private_key_path: String,
}

#[derive(Debug, serde::Serialize)]
struct Claims {
    iat: usize,
    exp: usize,
    iss: String,
}

fn main() {
    let config_path = Path::new("github-token-gen/config.toml");
    let config_str = fs::read_to_string(config_path).expect("Failed to read config.toml");
    let config: Config = toml::from_str(&config_str).expect("Invalid config format");

    let private_key = fs::read_to_string(&config.private_key_path)
        .expect("Failed to read private key");

    let now = Utc::now();
    let claims = Claims {
        iat: now.timestamp() as usize,
        exp: (now + Duration::minutes(10)).timestamp() as usize,
        iss: config.app_id,
    };

    let encoding_key = EncodingKey::from_rsa_pem(private_key.as_bytes())
        .expect("Invalid private key");

    let jwt = encode(&Header::new(Algorithm::RS256), &claims, &encoding_key)
        .expect("Failed to create JWT");

    println!("JWT:\n{}", jwt);
}
