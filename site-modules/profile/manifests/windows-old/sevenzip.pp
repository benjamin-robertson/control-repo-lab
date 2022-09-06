# TODO: Maintain is still a verb, why not just "7zip"?
class profile::windows::sevenzip {
  package { '7zip':
    ensure   => installed,
    provider => 'chocolatey',
    #notify   => Reboot['after'],
  }
}
