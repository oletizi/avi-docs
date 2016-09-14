---
title: Assign/Update VIP Using DNS
layout: default
---
During configuration, a virtual service's virtual IP (VIP) address can be specified by IP address or by DNS domain name.

To be able to assign VIPs using DNS, the Controller must be configured to use a valid DNS server:

1. Navigate to Administration > Settings > DNS / NTP.
1. Enter the domain name in the VIP Address field.

* If DNS cannot resolve the name, it will change to red.
* If DNS resolves the name to an IP address, the address will be listed.  
* If DNS resolves to multiple IP addresses, the list below the VIP field will include a pull-down menu, requiring the selection of the IP address to use.

The Controller will periodically recheck with DNS to see whether the name resolution has changed. If the resolution comes back with a different address, the Controller will update/change the VIP address.

The default DNS refresh time is 60 minutes. This may be changed using the following CLI command:
<pre class="">: &gt; configure controller properties dns_refresh_period 50

: &gt; save</pre>