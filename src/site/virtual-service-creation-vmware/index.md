---
title: Virtual Service Creation&#58; VMware
layout: default
---
In Avi Vantage, a virtual service is the combination of an IP address and a TCP/UDP port number. Each virtual service is associated with a pool of servers. Vantage load balances web requests from end-users among the servers in the virtual service's pool.

Virtual services can be configured using Basic Setup for quick provisioning or Advanced Setup for additional options. A virtual service's policies and options can be added when the service is created, and also can be modified later.

To create a virtual service for a VMware cloud using Basic Setup:

1. Log into the Avi Controller through a browser.
1. Select Applications from the menu on the top left corner.
1. Select Virtual Services on the top menu bar.
1. Click New -> Basic Setup.
1. Select the cloud and click New.
1. Enter a user-friendly virtual service name.
1. Enter an IP address or DNS hostname for the virtual service.
1. Click Select Servers by Network and choose a port group to list candidate servers for the pool members.

Note: This step is not applicable in No Access Mode.
1. Select pool members from the list.
1. Click Add Servers.
1. Click Save.

<a href="img/vmware-create-vs.png"><img src="img/vmware-create-vs.png" alt="vmware-create-vs" width="504" height="327"></a>