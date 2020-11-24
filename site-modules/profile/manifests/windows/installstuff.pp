class profile::windows::installstuff (
  Array $stuff = []
) {
  package { $stuff:
    ensure   => 'latest',
    provider => 'chocolatey'
  }
}
