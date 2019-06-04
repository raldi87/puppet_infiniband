########
##configure interface IPoIB
#######


define infiniband::interface 
(
  $enable                = true,
  $ensure                = 'present',
  $template              = "infiniband/interface/interface_ib.erb",
  $options               = undef,
  $interface             = $name,
  $restart_all_nic       = false,
  $ipaddress             = '',
  $manage_ipaddr         = undef,
  $netmask               = undef,
  $network               = undef,
  $broadcast             = undef,
  $gateway               = undef,
  $hwaddr                = undef,
  $mtu                   = undef,
  $ipaddr                = '',
  $bootproto             = 'none',
  $type                  = 'Ethernet',
  $ipv6init              = undef,
  $ipv6addr              = undef,
  $ipv6_defaultgw        = undef,
  $onboot                = '',
  $defroute              = undef,
  $hotplug               = undef,
  $connected_mode        = undef,
)
{
 if $restart_all_nic == false {
    exec { "restart_${interface}":
            command => "ifdown ${interface}; ifup ${interface}",
            path => "/sbin",
            refreshonly => true,
    }
    $interface_notify = "Exec[restart_${interface}]"
 }
 else 
 {
    exec { "restart_all_interface":
            command => "systemctl network restart",
            refreshonly => true,
         }

 }
 file { "/etc/sysconfig/network-scripts/ifcfg-${name}" :
        ensure  => $ensure,
        content => template($template),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => $interface_notify,
 }
}
