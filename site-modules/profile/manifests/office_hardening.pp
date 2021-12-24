# Class: profile::office_hardening
#
#
class profile::office_hardening (
  Enum['all_macros_disabled','macros_from_trusted_locations','signed_macros_only','clear_macro_settings'] $macro_setting = 'all_macros_disabled',
  Hash $trusted_locations = {}
){
  class {'acsc_e8_office_hardening':
    macro_setting       => $macro_setting,
    trusted_locations   => $trusted_locations,
    set_ntuser_interval => 1,
  }
}
