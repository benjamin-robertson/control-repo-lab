# Class: profile::hash_sensitive
#
# @param big_hash
#
class profile::hash_sensitive (
  Sensitive[Hash] $big_hash,
) {
  # resources
  notify { "Big has is: ${big_hash.unwrap}:":
  }
}
