# Class: profile::patching
#
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash')

  $result = $patch_groups.filter | $key, $value | {
    $value.member($trusted['certname'])
  }

  notify { "patch groups are ${patch_groups}": }
  notify { "result is ${result}": }
  notify { "result length ${result.length}": }
}
