# Class: profile::patching
#
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash')

  $result = $patch_groups.filter | $key, $value | {
    $value.dig($trusted['certname'])
  }

  notify { "patch groups is ${result}": }
  notify { "result is ${result}": }
}
