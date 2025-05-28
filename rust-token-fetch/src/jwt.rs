use chrono::{Duration, Utc};
use jsonwebtoken::{encode, Algorithm, EncodingKey, Header};
use crate::config::Config;

#[derive(Debug, serde::Serialize)]
struct Claims {
    iat: usize,
    exp: usize,
    iss: String,
}

pub fn generate_jwt(config: &Config) -> String {
    let private_key_path = config.resolved_private_key_path();

    

    let private_key_bytes = std::fs::read(&private_key_path)
        .expect("❌ Failed to read private key");

    let encoding_key = EncodingKey::from_rsa_pem(&private_key_bytes)
        .expect("❌ Invalid private key format");

    let now = Utc::now();
    let claims = Claims {
        iat: now.timestamp() as usize,
        exp: (now + Duration::minutes(10)).timestamp() as usize,
        iss: config.app_id.clone(),
    };

    encode(&Header::new(Algorithm::RS256), &claims, &encoding_key)
        .expect("❌ Failed to create JWT")
}
