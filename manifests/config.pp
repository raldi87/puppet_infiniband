class infiniband::config inherits infiniband
{

file { $infiniband::config_rdma:
       ensure => file,
       owner => root,
       group => root,
       mode => '0644',
       content => template("infiniband/rdma.conf.erb"),
}
}
