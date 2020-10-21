# TODO: Maintain is still a verb, why not just "7zip"?
class profile::windows::7zip {
  class { 'archive':
    seven_zip_name     => '7-Zip 19.00 (x64 edition)',
    seven_zip_source   => 'https://www.7-zip.org/a/7z1900-x64.msi',
    seven_zip_provider => 'windows',
  }
}
