mod config;
mod jwt;
mod fetch_token;

use config::Config;
use fetch_token::fetch_and_store_tokens;
use std::env;

fn main() {
    // Path to the config file
    let config_path = "rust-token-fetch/config.toml";

    // Load configuration
    let config = Config::load(config_path);

    // Resolve private key path (optional debug print, remove if not needed)
    let private_key_path = config.resolved_private_key_path();

    // Get CLI argument for group name, if any
    let args: Vec<String> = env::args().collect();
    let target_group = args.get(1).map(String::as_str);

    // Fetch token(s) for either a single group or all
    fetch_and_store_tokens(&config, target_group);
}




// curl -s -X GET https://api.github.com/app/installations \
//   -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NDg0NDIwMjMsImV4cCI6MTc0ODQ0MjYyMywiaXNzIjoiMTMzMTc3NCJ9.YSoRThv1CzSjBLK4SIuiqtbgojiLW3QQBMSVnSepNv5Jk0zEI-fh-zwP9ydpmP4t6UTTJ-k7_9CDFVY5viSPLxG-eM82V5ajRzeCUyxHber-EWEzrsfkdvuaFtOoJ11HURxkohayObqWGcL14rG2hxeHlMoOYHxE1agSX25kWpUyKLBOB7uOybNrfLvS2YkfhNzXrYEAuyXo-3nqSzvMTm9aqU9J4nCfzytbmCDaMyLPa2IbNL6oQkmVxVPgKoAgcFkrxnrmXGRD5Qm1Xu-pmPeT5bwxby0GuUInqlb9gyyj6qQL1zATWsd2MiN66_fekomTITRRZMmRAEr_-4vfiA" \
//   -H "Accept: application/vnd.github+json"
