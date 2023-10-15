# Class: profile::patching
#
# @summary Wrapper class for pe_patch, reads hiera for the following hashes
# @param patch_groups_and_options
#   Hash containing the patch groups and servers along with the patch groups options.
# @param node_options_override
#   Hash containing patch options overrides per node. These options will override the options set in the patch group.
#
# lint:ignore:variables_not_enclosed
#
class profile::patching {
  $patch_groups_and_options = lookup('patch_groups_as_a_hash', { 'default_value' => {} })
  $node_options_override = lookup('patching_options_node_override', { 'default_value' => {} })

  # Set varible to {} if its undef.
  $final_patch_groups_and_options = $patch_groups_and_options ? {
    undef   => {},
    default => $patch_groups_and_options,
  }

  # Set noop false
  noop(false)

  # Get patch groups for host
  $result_patch_groups = $final_patch_groups_and_options.reduce({}) | $memo, $value | {
    # Confirm we have the correct data types
    if $value['1'] =~ Hash and $value['1'].dig('hosts') =~ Array {
      # Confirm if the host is a member of this patch group
      if $value['1']['hosts'].member($trusted['certname']) {
        $memo + { $value['0'] => $trusted['certname'] }
      } else {
        $memo
      }
    } else {
      $memo
    }
  }

  $default_options = {
    'reboot_override' => 'never',
  }

  # Get patch group options
  $patch_group_options = $final_patch_groups_and_options.reduce({}) | $memo, $value | {
    # Confirm we have the correct data types
    if $value['1'] =~ Hash and $value['1'].dig('options') =~ Hash {
      # Confirm if the host is a member of this patch group
      $memo + { $value['0'] => $value['1']['options'] }
    } else {
      $memo
    }
  }

  # Create fact directory, only req in lab
  file { ['/etc/puppetlabs/facter', '/etc/puppetlabs/facter/facts.d']:
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0700',
  }

  if $result_patch_groups.length == 1 {
    # check if the host has options defined. Otherwise return empty hash
    $host_patch_options = $node_options_override.dig($trusted['certname']) ? {
      undef   => {},
      default => $node_options_override[$trusted['certname']],
    }
    $final_patch_group_options = $patch_group_options[$result_patch_groups.keys['0']] ? {
      undef   => {},
      default => $patch_group_options[$result_patch_groups.keys['0']]
    }
    $combined_patch_options = $default_options + $final_patch_group_options + $host_patch_options
    # node is a member of a single patch group, classify it with PE_patch.
    class { 'pe_patch':
      patch_group => $result_patch_groups.keys['0'],
      *           => $combined_patch_options,
    }
    # Create fact status
    $file_content = @("EOT")
      patching_group=${result_patch_groups.keys['0']}
      patching_status=okay
      patching_description="okay, passing settings to pe_patch"
      patching_group_options=${patch_group_options}
      patching_host_options=${host_patch_options}
      patching_combined_options=${combined_patch_options}
      | EOT
    file { '/etc/puppetlabs/facter/facts.d/patching.txt':
      ensure  => file,
      content => $file_content,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      noop    => false,
    }
  } elsif $result_patch_groups.length == 0 {
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
