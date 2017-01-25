---
title: Virtual Service Creation&#58; VMware
layout: 16.3
---
In Avi Vantage, a virtual service is the combination of an IP address and a TCP/UDP port number. Each virtual service is associated with a pool of servers. Vantage load balances web requests from end-users among the servers in the virtual service's pool.

Virtual services can be configured using Basic Setup for quick provisioning or Advanced Setup for additional options. A virtual service's policies and options can be added when the service is created, and also can be modified later.

To create a virtual service for a VMware cloud using Basic Setup:
<ol> 
 <li> <p>Log into the Avi Controller through a browser.</p> </li> 
 <li> <p>Select Applications from the menu on the top left corner.</p> </li> 
 <li> <p>Select Virtual Services on the top menu bar.</p> </li> 
 <li> <p>Click New -&gt; Basic Setup.</p> </li> 
 <li> <p>Select the cloud and click New.</p> </li> 
 <li> <p>Enter a user-friendly virtual service name.</p> </li> 
 <li> <p>Enter an IP address or DNS hostname for the virtual service.</p> </li> 
 <li> <p>Click Select Servers by Network and choose a port group to list candidate servers for the pool members.</p> <p>Note: This step is not applicable in No Access Mode.</p> </li> 
 <li> <p>Select pool members from the list.</p> </li> 
 <li> <p>Click Add Servers.</p> </li> 
 <li> <p>Click Save.</p> </li> 
</ol> 

<a href="img/vmware-create-vs.png"><img src="img/vmware-create-vs.png" alt="vmware-create-vs" width="504" height="327" class="alignnone size-full wp-image-3901"></a>

