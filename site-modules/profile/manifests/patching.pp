# Class: profile::patching
#
# @summary Wrapper class for pe_patch, reads hiera for the following hashes
# @param patch_groups_as_a_hash
#   Feeds patch_group as hashes to pe_patch.
# @param patching_options_as_a_hash
#   Feeds host_patch_options hashes to pe_patch.
#
# lint:ignore:variables_not_enclosed
#
class profile::patching {
  $patch_groups = lookup('patch_groups_as_a_hash', { 'default_value' => {} })
  $patch_options = lookup('patching_options_as_a_hash', { 'default_value' => {} })

  # Set noop false
  noop(false)

  $result = $patch_groups.filter | $key, $value | {
    if $value =~ Array {
      $value.member($trusted['certname'])
    }
  }

  if $result.length == 1 {
    # check if the host has options defined. Otherwise return empty hash
    $host_patch_options = $patch_options.dig($trusted['certname']) ? {
      undef   => {},
      default => $patch_options[$trusted['certname']],
    }
    # node is a member of a single patch group, classify it with PE_patch.
    class { 'pe_patch':
      patch_group => $result.keys['0'],
      *           => $host_patch_options,
    }
    # Create fact status
    $file_content = @("EOT")
      patching_group=${result.keys['0']}
      patching_status=okay
      patching_description="okay, passing settings to pe_patch"
      | EOT
    file { '/etc/puppetlabs/facter/facts.d/patching.txt':
      ensure  => file,
      content => $file_content,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      noop    => false,
    }
  } elsif $result.length == 0 {
    $file_content = @("EOT")
      patching_status=no_patch_group
      patching_description="No patch group defined for host"
      | EOT
    file { '/etc/puppetlabs/facter/facts.d/patching.txt':
      ensure  => file,
      content => $file_content,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      noop    => false,
    }
  } else {
    $file_content = @("EOT")
      patching_status=multiple_patch_groups
      patching_description="Host is a member of multiple patch groups; failing safely."
      | EOT
    file { '/etc/puppetlabs/facter/facts.d/patching.txt':
      ensure  => file,
      content => $file_content,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      noop    => false,
    }
  }
}
# lint:endignore
