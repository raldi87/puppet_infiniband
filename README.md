
# infiniband module for puppet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)


## Overview

This module is used for managing RDMA devices and configuration with puppet .

## Module Description

Download this module and copy to your puppetserver module path

/etc/puppetlabs/modules

## Setup

### What infiniband affects

* Manages the IB devices in /etc/sysconfig/network-scripts
* Manages the rdma.conf file
* Integrated with HIERA

## Usage
infiniband::rdma_config:
            load_ipoiv: 'yes'
            load_srp: 'no'
            load_srpt: 'no'
            tech_preview: 'yes'
            load_nfsordma_client: 'no'
            load_nfsordma_server: 'no'
            load_rds: 'no'
            load_isert: 'no'
            load_iser: 'no'
           
  infiniband::interfaces_hash:
    ib0: 
      ipaddress: 192.168.15.11
      netmask: 255.255.255.0
      type: "Infiniband"
      connected_mode: "yes"
      manage_ipaddr: "true"
      onboot: "yes"
      bootproto: "none"
      mtu: 65520
    ib1:
      ipaddress: 192.168.25.21
      netmask: 255.255.255.0
      type: "Infiniband"
      connected_mode: "yes"
      manage_ipaddr: "true"
      onboot: "yes"
      bootproto: "none"
      mtu: 65520
  
## Limitations

Tested on RHEL7 with puppet3/4/5


