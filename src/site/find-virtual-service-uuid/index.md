---
title: Find Virtual Service UUID
layout: default
---
Each object within Avi Vantage configuration is assigned a unique identity.  Multiple objects in different tenants may have the same name.  For instance, multiple tenants may have a virtual service named "web".  For automated interaction with Avi Vantage, particularly via the API, it is useful to know how to obtain the UUID of objects such as a virtual service.  For the example mentioned, it is recommended to have Tenant Header (X-Avi-Tenant) set in the API calls so the Controller can resolve the name to the correct tenant. The details for the header insertion are in the SDK and API guide.

 

### Find UUID via the API

<pre>https://10.1.1.1/api/virtualservice?name=FTP-VS&amp;fields=uuid</pre>

 

### Find UUID via the GUI

Click into the virtual service.  Since the GUI is executing API calls on the Avi Controller, the UUID is reflected in the URL.
<pre>https://10.1.1.1/#/authenticated/applications/virtualservice/<strong>virtualservice-0523452d-c301-4817-a5e0-ee66b95bd287</strong>/analytics?timeframe=6h</pre>

 

### Find UUID via the CLI

<pre>: &gt; show virtualservice FTP-VS
+---------------------------+-----------------------------------------------------+
| Field&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
+---------------------------+-----------------------------------------------------+
| uuid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | <strong>virtualservice-0523452d-c301-4817-a5e0-ee66b95bd287</strong> |
| name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FTP-VS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | swapnil2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| ip_address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10.130.129.14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</pre>

 

### Reference Objects by Name

For objects created within Avi Vantage, it is possible to reference objects by name rather than by UUID.  However, there are objects, such as subnets, that are created outside of Avi and pushed down to the Controller, such as through OpenStack.  For these objects, they must be referenced by API calls via their UUID, not via their name.  Therefore, it is generally considered best practice to have API calls reference object's UUIDs rather than names.

 