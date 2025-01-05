# Class: profile::hash_sensitive
#
# @param big_hash
# @param lil_hash
#
class profile::hash_sensitive (
  Sensitive[Hash] $big_hash,
  Hash $lil_hash,
) {
  # resources
  notify { "Big has is: ${big_hash}:":
  }
  notify { "lil has is: ${lil_hash}:":
  }
  notify { "lil sen ${lil_hash['private']}":
  }
  notify { "lil unwrap ${lil_hash['private'].unwrap}":
  }
}
