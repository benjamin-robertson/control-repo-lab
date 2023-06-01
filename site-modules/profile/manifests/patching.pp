# Class: profile::patching
#
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash')

  $result = $patch_groups.filter | $key, $value | {
    $value.member($trusted['certname'])
  }

  if $result.length == 1 {
    # node is a member of a single patch group, classify it with PE_patch
    class { 'pe_patch':
      patch_group => $result.keys['0'],
    }
  } elsif $result.length == 0 {
    notify { 'No patch group defined for host': }
  } else {
    notify { 'Host is a member of multiple patch groups; failing safely.': }
  }
}
