---
title: IPAM Provider (OpenStack)
layout: layout171
---
Avi Vantage communicates with OpenStack Neutron via APIs to provide IPAM functionality. Currently, DNS services from OpenStack are not supported in this configuration.

Note:

* If you are using OpenStack Cloud in Avi Vantage, then this configuration does not apply, as this is to provide support for other cloud providers who host their VMs/instances in OpenStack (for example, Mesos nodes running on OpenStack instances). 

### IPAM

Select OpenStack, and enter the following information:

* **Username:** Username for logging onto the Keystone host.
* **Password:** Password for logging onto the Keystone host.
* **Tenant:** Name of the OpenStack tenant.
* **Keystone Host:** IP address or hostname of the Keystone host.
* **Network**: Network to use for VIP allocation (OpenStack network name or the network subnet IP can be used here).
* **Region**: OpenStack region. 

<a href="img/openstack-network-name.png"><img class="aligncenter wp-image-10289" src="img/openstack-network-name.png" alt="openstack-network-name Avi Vantage OpenStack IPAM" width="515" height="553"></a>

