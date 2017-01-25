---
title: Server Requires Original Client Source IP Address
layout: layout171
---
By default, Avi Service Engines (SE) perform Network Address Translation (SNAT) of the client source address. This means application servers will see the Avi SE's IP address as the source IP of the traffic.

For HTTP traffic, consider enabling the X-Forward-For header, which inserts the original client IP into the HTTP header of client requests. A number of articles cover the XFF header in further detail.

For the stateless UDP protocols, such as DNS or Syslog, the TCP / UDP network profile may be set to disable Source NAT.

For other protocols, SNAT is currently required. Avi is tracking this and will enhance functionality in a future release. Please contact support for updates on this issue.
