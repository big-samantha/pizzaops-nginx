# == Class nginx::service
#
# This class is meant to be called from nginx.
# It ensure the service is running.
#
class nginx::service {

  service { $::nginx::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
