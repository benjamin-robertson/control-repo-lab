# TODO: Once again verbs are used here, see my comment on profile::create_file
class profile::windows_classes::maintain_7zip {
  class { 'archive':
    seven_zip_name     => '7-Zip 19.00 (x64 edition)',
    seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
    seven_zip_provider => 'windows',
  }
}
