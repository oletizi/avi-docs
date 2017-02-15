---
title: CLI&#58; Virtual Service and Pool Creation
layout: layout171
---
During virtual service creation, the virtual service will need to point to a pool, which the system expects to exist already.

From the CLI, this configuration can be performed as two tasks:
<ol> 
 <li> <p>Create the pool.</p> </li> 
 <li> <p>Create the virtual service.</p> </li> 
</ol> 

### Pool Creation

<pre>: &gt; configure pool Test
: pool&gt; servers ip 10.1.1.100 port 80
: pool:servers&gt; save
: pool&gt; servers ip 10.1.1.101 port 80
: pool:servers&gt; save
: pool&gt; where
Tenant: admin
+------------+------------+
| Field      | Value      |
+------------+------------+
| name       | Test       |
| servers[1] |            |
| ip         | 10.1.1.100 |
| port       | 80         |
| servers[2] |            |
| ip         | 10.1.1.101 |
| port       | 80         |
+------------+------------+
: pool&gt; save</pre> 

 

### Virtual Service Creation

Once the pool is created, the next step is to create the virtual service:

<pre>: &gt; configure virtualservice Test_VS
: virtualservice&gt; address 10.10.10.10
: virtualservice&gt; services port 80
: virtualservice&gt; pool_ref Test</pre> 

     

Note: The example in this article shows only the minimum configuration required to successfully deploy a new application. Many additional options are available for customizing virtual services and pools.
