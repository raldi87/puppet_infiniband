# == Class: infiniband
#
# Full description of class infiniband here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'infiniband':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class infiniband (
       $service_rdma = $infiniband::params::service_rdma,
       $config_rdma = $infiniband::params::config_rdma,
       $rdma_config = $infiniband::params::rdma_config,
       $interfaces_hash = undef,
) inherits infiniband::params
{
      validate_hash($rdma_config)
      validate_hash($interfaces_hash)
      include infiniband::install
      include infiniband::service
      include infiniband::config
      $hiera_interfaces_hash = hiera_hash("${module_name}::interfaces_hash",undef)
      $real_interfaces_hash = $hiera_interfaces_hash ? {
      undef   => $interfaces_hash,
      default => $hiera_interfaces_hash,
      }
      create_resources('infiniband::interface', $real_interfaces_hash)
      
}
