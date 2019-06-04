class infiniband::service inherits infiniband
{

service { 'rdma':
           ensure  => running,
           enable => 'true',
           require => Package['rdma-core'],
        }

}
