---
title: Cluster Configuration with DNS Hostnames
layout: layout171
---
As of Avi Vantage release 16.3, an Avi Controller cluster can be configured with DNS hostnames instead of IP addresses.

Cluster configuration can be changed to use DNS hostnames instead of IP addresses by editing node management IP/hostname in Administration->Controller->nodes page. This will trigger a new Cluster configuration process and update all nodes to use DNS hostnames.

DNS is resolved when secure connection is established between Controllers, which is usually when Cluster is configured or any of the node is rebooted. Service Engines resolve DNS hostname of the Controller when establishing secure connection to the Controller, which is usually when Service Engine is first created and when either a Service Engine or a Controller reboots. 

The Cluster configuration process takes the Leader node's DNS information and updates it in the new Follower nodes. It is expected that all nodes can reach the DNS server configured in the Leader's Administration->Settings->DNS/NTP page.

Service Engines can initiate connection using IP address from the VM metadata but are automatically switched to use DNS hostname for the Controller nodes. Hence, it is important for Service Engines to use the correct DNS server to resolve Controller DNS hostname.
