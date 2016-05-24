# == Class nginx::params
#
# This class is meant to be called from nginx.
# It sets variables according to platform.
#
class nginx::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'nginx'
      $service_name = 'nginx'
    }
    'RedHat', 'Amazon': {
      $package_name = 'nginx'
      $service_name = 'nginx'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
