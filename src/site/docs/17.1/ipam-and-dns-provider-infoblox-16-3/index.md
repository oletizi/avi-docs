---
title: IPAM and DNS Provider (Infoblox) (16&#46;3+)
layout: default
---
See also: <a href="/docs/17.1/service-discovery-using-ipam-and-dns-16-3/">Service Discovery Using IPAM and DNS</a>

## IPAM and DNS Configuration

The Avi Controller integrates with Infoblox for both IPAM and DNS services together (Note: neither DNS-only nor IPAM-only is supported with Infoblox).

Navigate to Templates -> IPAM/DNS Profiles -> Create. Select "Infoblox IPAM and DNS" as IPAM/DNS type and enter credentials as shown below:

* IP address: address of the Infoblox appliance
* Username and password: credentials to access Infoblox
* API Version: as supported by the Infoblox server (default: 2.0)
* DNS view: as configured in Infoblox (default: “default”)
* Network view: as configured in Infoblox (default: “default”)
* Optionally, select a subset of IP subnets and DNS domains to choose from Infoblox:  
    * Usable subnet: Pick all or a subset of subnets configured in Infoblox to be used for VIP allocation. If none is specified, Vantage looks at all subnets.
    * Usable domain: Pick all or a subset of the domains configured in Infoblox to be used for DNS purposes. If none is specified, all domains are available during virtual service creation. 

<a href="img/infoblox-profile.png"><img class=" wp-image-16429 aligncenter" src="img/infoblox-profile.png" alt="infoblox-profile" width="663" height="820"></a>

### IPAM and DNS filters (Optional)

It is assumed that all interested subnets and domain names (zones) have been configured in Infoblox server for consumption by Avi Vantage.

Selecting a subset of subnets from Infoblox for IPAM:

<a href="img/infoblox-profile-s.png"><img class=" wp-image-16431 aligncenter" src="img/infoblox-profile-s.png" alt="infoblox-profile-s" width="665" height="823"></a>

Selecting a subset of domains/zones from Infoblox for DNS:

<a href="img/infoblox-profile-d.png"><img class="wp-image-16433 aligncenter" src="img/infoblox-profile-d.png" alt="infoblox-profile-d" width="664" height="820"></a>

 
