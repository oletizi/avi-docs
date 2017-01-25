---
title: OpenStack VIP Modes&#58; Allowed Address Pairs and Interface Secondary IPs
layout: layout163
---
Avi Vantage supports two OpenStack virtual IP modes, <a href="http://specs.openstack.org/openstack/neutron-specs/specs/api/allowed_address_pairs.html">allowed-address pairs</a> and interface-secondary IPs.

## Option 1. Using Allowed-Address Pairs

This is the default mode of for VIP placement and VIP traffic. In this mode ...

* An unbound VIP port is created.
* The VIP address is added as an AAP entry on the SE's DATA-vnic
* The floating IP is associated to the unbound VIP port. 

This mode works well for non-DVR Neutron OVS+IPTables. It is not supported for DVR with floating IPs, Contrail, NVP, ACI OpFlex (< v0.9.14). There is a limit of 10 AAPs on a vNIC by default.

## Option 2. Using Interface-Secondary IPs

In this mode ...

* The VIP address is added as a secondary IP on the SE DATA-vnic.
* The floating IP is associated to the secondary IP on the SE DATA-vnic.  

This mode works well for most implementations (except Contrail). It overcomes limitations of AAP.

The CLI commands to configure this mode are shown below.

<code>:&gt; configure cloud </code>
<code>:cloud&gt; openstack_configuration</code>
<code>:cloud:openstack_configuration&gt; intf_sec_ips'</code>
<code>:cloud:openstack_configuration&gt; save</code>
<code>:cloud&gt; save</code>
