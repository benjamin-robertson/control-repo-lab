# Class: profile::strict
#
#
class profile::strict {
  # resources
  # $dog = '1' + 1
  # notify { "dog is ${dog}": }

  # notify { "Poodle is ${poodle}": }

  notify { "osfamily is: ${facts['osfamily']}": }
}
