# Class: profile::patching
#
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash')

  $result = $patch_groups.filter | $key, $value | {
    $value.member($trusted['certname'])
  }

  # notify { "patch groups are ${patch_groups}": }
  # notify { "result is ${result}": }
  # notify { "result length ${result.length}": }
  notify { "group is ${result.keys['0']}": }

  if $result.length == 1 {
    class { 'pe_patch':
      patch_group => $result.keys['0'],
    }
  } else {
    fail('No patch node group defined for host')
    notify { "I have failed length is ${result.length}": }
  }
}
