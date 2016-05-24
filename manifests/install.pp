# == Class nginx::install
#
# This class is called from nginx for install.
#
class nginx::install {

  package { $::nginx::package_name:
    ensure => present,
  }
}
