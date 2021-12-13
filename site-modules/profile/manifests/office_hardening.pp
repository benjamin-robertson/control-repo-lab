# Class: profile::office_hardening
#
#
class profile::office_hardening (
  Enum['all_macros_disabled','macros_from_trused_locations','signed_macros_only','clear_macro_settings'] $macro_setting = 'clear_macro_settings'
){
  class {'acsc_e8_office_hardening':
    macro_setting => $macro_setting,
  }
}
