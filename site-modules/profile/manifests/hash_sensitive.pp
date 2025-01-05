# Class: profile::hash_sensitive
#
# @param big_hash
# @param sen_hash
# @param lil_hash
#
class profile::hash_sensitive (
  Sensitive[Hash] $big_hash,
  Hash $sen_hash,
  Hash $lil_hash,
) {
  # resources
  notify { "Big hash is: ${big_hash}:":
  }
  notify { "Big hash private is: ${big_hash.unwrap['private']}:":
  }
  notify { "sen hash is: ${sen_hash}:":
  }
  notify { "lil hash is: ${lil_hash}:":
  }
  notify { "lil sen ${lil_hash['private']}":
  }
  notify { "lil unwrap ${lil_hash.unwrap['private']}":
  }
}
