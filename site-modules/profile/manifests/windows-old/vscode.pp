class profile::windows::vscode {
  package { 'vscode':
    ensure   => 'latest',
    provider => 'chocolatey',
  }
}
