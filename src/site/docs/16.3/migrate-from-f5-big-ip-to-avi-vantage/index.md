---
title: Migrate from F5 BIG-IP to Avi Vantage
layout: default
---
When deploying Avi Vantage into existing environments, it is often required to migrate application workloads from other load balancers to Avi Vantage.  Avi recognizes the stringent requirements of customers and the need to maintain up-time during a live migration.  This document provides insight into the process of migrating from F5's BIG-IP LTM to Avi Vantage.

Avi's professional services engineers are available to perform or assist with gracefully migrating live traffic from BIG-IP to Vantage, as well as provide training on operationalizing and supporting this critical infrastructure.

### Avi Vantage

Avi Vantage provides a wide ranging breadth of functionality common in competitive application delivery controllers, or load balancers.  But it also extends the load balancer's capabilities and value by incorporating extensive analytics data, a centralized control plane and modern distributed data plane architecture.  Ultimately this creates an extremely intuitive load balancer fabric which is highly automated to reduce operational complexity and time to deploy, learn, and manage.

### Concepts

While F5 and Avi provide many similar high level features, there are important differences architecturally, in the operations of various features, and even in the names of features and concepts.  To successfully migrate from F5, an Avi engineer will walk you through the differences to ensure the optimal deployment of Avi Vantage.  Some customers choose to recreate the F5 configuration as exactly as possible.  Other customers have room to re-architect and modernize their load balancing infrastructure.

<table class=" table table-bordered table-hover">  
<tbody>          
<tr>    
<td><span style="color: white; font-size: medium;">Concept</span></td>
<td><span style="color: white; font-size: medium;">F5 Term</span></td>
<td><span style="color: white; font-size: medium;">Avi Term</span></td>
</tr>
<tr>    
<td>application proxy</td>
<td>virtual server</td>
<td><a href="/docs/16.3/architectural-overview/applications/virtual-services/create-virtual-service/">virtual service</a></td>
</tr>
<tr>    
<td>group of servers</td>
<td>pool</td>
<td><a href="/docs/architectural-overview/applications/pools/">pool</a></td>
</tr>
<tr>    
<td>Data plane scripting</td>
<td>iRules™</td>
<td><a href="/docs/datascript-guide/">DataScript</a></td>
</tr>
<tr>    
<td>API</td>
<td>iControl™</td>
<td><a href="/docs/latest/api-guide/overview.html">REST API</a></td>
</tr>
<tr>    
<td>Load balancer</td>
<td>BIG-IP™ LTM™ + GTM™</td>
<td><a href="/docs/architectural-overview/">Service Engine</a></td>
</tr>
<tr>    
<td>Connection aggregation</td>
<td>OneConnect ™</td>
<td><a href="/docs/16.3/connection-multiplex/">multiplex</a></td>
</tr>
<tr>    
<td>Central config manager</td>
<td>Enterprise Manager™ / BIG-IQ™</td>
<td><a href="/docs/architectural-overview/">Controller</a></td>
</tr>
<tr>    
<td>Orchestrator</td>
<td>none</td>
<td><a href="/docs/architectural-overview/">Controller</a></td>
</tr>
</tbody>
</table> 

### Control Plane

Architecturally, Avi Vantage is managed by a Controller or a redundant cluster of Controllers.  Rather than logging into and managing each pair of load balancer appliances, the Vantage fabric is managed by the Controller cluster.  A single Controller cluster may manage hundreds of Service Engines, even if they are deployed in different clouds such as VMware or OpenStack.  Customers may also choose to deploy more than one Controller cluster, though this is usually done for geographically separate data centers.  One cluster could manage both test and production environments separated by different tenants, or each could have their own cluster created.

### Data Plane

Vantage load balancers, called Service Engines (SEs), may be deployed similar to BIG-IP in active / standby pairs (using Avi's Legacy HA mode), or they may preferably be deployed in elastic HA mode, with fully active groups.  There are a number of configuration options to carve out separate groups via tenants, VRFs, clouds, and SE groups.  Each application may have its own load balancer, or all applications may share a group of Service Engines.  When migrating from BIG-IP, the appliance-pair versus fabric choice is one of the first architectural questions that should be answered to determine how to best consolidate and minimize unused load balancer capacity.

### Migration

Migration from existing, live environments is a delicate process.  Avi provides migration services, with a combination of migration tools and engineers with decades of experience in load balancing.

### Automated

BIG-IP LTM configurations can be automatically imported into Avi Vantage's JSON config format.  The BIG-IP to Vantage configuration migration tool imports virtual services, pools, and most adjacent functionality configured in the bigip.conf file.  Additional configuration objects that can be automatically imported include groups, SSL keys and certificates.  This eliminates the potential of errors when converting BIG-IP configuration files that are often tens of thousands of lines long.  The configuration utility provides a complete output, showing every configuration setting that has been converted.

### Manual

Some functionality from BIG-IP LTM cannot be automatically converted.  For instance, F5's iRules are not migrated.  Avi's experience is that about 75% of all iRules can be converted to native point-and-click features, though a professional services engineer will manually inspect the iRule to make that determination.  iRules that cannot be performed as native features will be rewritten in Avi's <a href="/docs/datascript-guide/">DataScript</a> format, which is similar in logic and function, but based on the more modern Lua language.

Only LTM configuration is migrated; other modules must be done manually.  If a feature or functionality cannot be converted directly, the Avi engineer will work with the customer to provide a workaround or determine the best course of action.

### Cutover

Once the configuration is migrated to the Avi Vantage deployment, it is time to begin testing.  All virtual services are migrated and left in a disabled state so they do not cause an ARP conflict.  There are various methods for testing the configuration prior to cutting over.  Most often, the virtual service is given a new IP address and marked as enabled.  The VS is deployed onto a Service Engine and is available for testing.  This may involve accessing the VS directly, by using an alternate name in DNS, or by altering a client host file.  In this test scenario, SNAT is typically recommended to ensure no changes are required on the servers, yet traffic will synchronously return through the Vantage load balancers rather than the server's default gateway.

Once the virtual service is ready to go live, the VS is disabled on the BIG-IP and enabled on Vantage.  If additional IP addresses are available, Vantage may be configured to use a unique IP for the VS.  The cutover is performed by changing the IP address advertised via DNS.  Traffic will gracefully bleed off the BIG-IP as new traffic is processed through Vantage with no disruption to live traffic.

This process can be repeated as necessary for all applications.

 

 
