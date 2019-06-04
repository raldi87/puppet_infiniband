

class infiniband::install inherits infiniband
{

package { 'libibverbs':
         ensure => installed,
        }
package { 'rdma-core':
         ensure => installed,
        }
Package['rdma-core']->Package['libibverbs']

package { 'ibutils':
         ensure => installed,
        }
package { 'infiniband-diags':
         ensure => installed,
        }
package { 'perftest':
         ensure => installed,
        }
package { 'qperf':
         ensure => installed,
        }
#for iproute bug on oldstyle interfaces eth/ib
package { 'iproute':
         ensure => '3.10.0-87.el7',
        }
}
