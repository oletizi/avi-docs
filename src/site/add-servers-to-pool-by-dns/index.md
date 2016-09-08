---
title: Add Servers to Pool by DNS
layout: default
---
Servers may be added to a pool in any of the following ways:

* By IP address or address ranges
* By a list retrieved from the cloud orchestrator (Select By Network)
* IP group
* DNS domain name

This article covers adding servers to a pool based on DNS domain name.

To add servers by domain name:

1. Configure valid DNS servers on the Avi Controller. In the web interface, navigate to Administration > Settings > DNS / NTP.<img src="img/DNS.png" alt="DNS" width="359" height="173">
1. Create or edit an existing pool, or create a new virtual service in basic mode. From the Servers tab, select servers using the IP Address, Range, or DNS Name option. In the Server IP Address field, rather than inputting IP addresses, enter a valid domain name.

* If DNS cannot resolve the name, it is displayed in red. If DNS resolves the name to an IP address, it will be listed below the field.
* If DNS resolves to multiple IP addresses, the list will be shown below, though potentially truncated.
* Click the green Add Server button to add the server(s) to the pool.

### DNS Overrides Manual IP Changes

For servers added by domain name, manual changes to the resolved server's IP addresses are overwritten automatically.

### Periodic Address Verification and Refresh

The Avi Controller will periodically refresh the server IP information by rechecking with DNS, in case the IP has changed. (A single name may return multiple IP addresses.)

If the DNS server returns the IP address that is already assigned to the server, there is no change.

However, pool is updated in the following cases:

* If DNS resolution of a server hostname results in a different set of IP addresses than the set received previously, the pool members corresponding to this hostname are updated with the new set of IP addresses, and the older IP addresses are removed.

* If DNS resolution results in a timeout, the old set of IP addresses is preserved in case the failure is due to a temporary outage of the DNS server.

* If DNS resolution results in an error (for example, non-existent domain or no answer from the server) the hostname is mapped to IP address "0.0.0.0."

In either case, where there is a timeout or error, Vantage will seek to resolve the hostname in the next resolution interval.

### Changing the DNS Refresh Interval

The default DNS refresh time is 60 minutes. This may be changed using the CLI:
<pre crayon="false" class="">: &gt; configure controller properties dns_refresh_period 50
: &gt; save</pre>