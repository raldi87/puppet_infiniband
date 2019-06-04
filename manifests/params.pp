class infiniband::params {
    case $::osfamily {
    "RedHat" : {
       $service_rdma = true
       $config_rdma = '/etc/rdma/rdma.conf'
       $rdma_config = { 'load_ipoiv' => 'no', 'load_srp' => 'no', 'load_srpt' => 'no', 'load_iser' => 'no', 'load_isert' => 'no', 'load_rds' => 'no', 'load_nfsordma_server' => 'no', 'load_nfsordma_client' => 'no', 'tech_preview' => 'no' }
    } 
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
   }




}
