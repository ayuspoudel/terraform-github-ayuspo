mod jwt;
mod fetch_token;
mod config;

use crate::config::Config;
use crate::fetch_token::fetch_and_store_tokens;

fn main() {
    let config = Config::load("github-token-gen/config.toml");
    fetch_and_store_tokens(&config);
}


// curl -s -X GET https://api.github.com/app/installations \
//   -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NDg0NDIwMjMsImV4cCI6MTc0ODQ0MjYyMywiaXNzIjoiMTMzMTc3NCJ9.YSoRThv1CzSjBLK4SIuiqtbgojiLW3QQBMSVnSepNv5Jk0zEI-fh-zwP9ydpmP4t6UTTJ-k7_9CDFVY5viSPLxG-eM82V5ajRzeCUyxHber-EWEzrsfkdvuaFtOoJ11HURxkohayObqWGcL14rG2hxeHlMoOYHxE1agSX25kWpUyKLBOB7uOybNrfLvS2YkfhNzXrYEAuyXo-3nqSzvMTm9aqU9J4nCfzytbmCDaMyLPa2IbNL6oQkmVxVPgKoAgcFkrxnrmXGRD5Qm1Xu-pmPeT5bwxby0GuUInqlb9gyyj6qQL1zATWsd2MiN66_fekomTITRRZMmRAEr_-4vfiA" \
//   -H "Accept: application/vnd.github+json"
