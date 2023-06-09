# Class: profile::patching
#
# Wrapper class for pe_patch, reads hiera for the following hashes
#  - patch_groups_as_a_hash
#  - patching_options_as_a_hash
# Feeds these hashes to pe_patch.
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash', { 'default_value' => {} })
  $patch_options = lookup('patching_options_as_a_hash', { 'default_value' => {} })

  $result = $patch_groups.filter | $key, $value | {
    $value.member($trusted['certname'])
  }

  if $result.length == 1 {
    # node is a member of a single patch group, classify it with PE_patch
    class { 'pe_patch':
      patch_group => $result.keys['0'],
      *           => $patch_options[$trusted['certname']],
    }
  } elsif $result.length == 0 {
    notify { 'No patch group defined for host': }
  } else {
    notify { 'Host is a member of multiple patch groups; failing safely.': }
  }
}