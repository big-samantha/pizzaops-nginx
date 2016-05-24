# Class: nginx
# ===========================
#
# Full description of class nginx here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class nginx (
  $package_name = $::nginx::params::package_name,
  $service_name = $::nginx::params::service_name,
) inherits ::nginx::params {

  # validate parameters here

  class { '::nginx::install': } ->
  class { '::nginx::config': } ~>
  class { '::nginx::service': } ->
  Class['::nginx']
}
