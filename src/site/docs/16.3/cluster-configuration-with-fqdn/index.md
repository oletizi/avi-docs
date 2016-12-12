---
title: Cluster Configuration with DNS Hostnames
layout: default
---
As of Avi Vantage release 16.3, an Avi Controller cluster can be configured with FQDNs instead of IP addresses. Simply replace IP-addresses in the Cluster configuration with FQDNs and the configuration process will update all nodes to use FQDN.

The Cluster configuration process takes the leader node's DNS information and updates it in the follower nodes. It is expected that the Controller nodes can reach the DNS hostname of the leader.

The Service Engines see the Controller IP addresses replaced with corresponding hostnames. Controller DNS hostnames must be reachable from the Service Engines.

All references to the original IP address are removed from the Controller database and every component only sees DNS hostname of the node henceforth.
