---
title: GSLB Integration with F5 GTM
layout: 16.2
---
To ensure high availability across geographic regions or data centers, Avi Networks recommends use of multiple data centers to distribute risk and reduce failure domains. Avi recognizes that many customers already own Global Server Load Balancers from other vendors, which provide DNS-based load balancing across geographies. Avi Vantage is able to work with most Global Server Load Balancing (GSLB) solutions, though the level of integration depends on the vendor used.

The procedure in this article works with Avi Vantage version 15.x and higher, and F5 Networks Global Traffic Manager (GTM) version 10.x and higher. Other versions also may work but are not covered or tested under the scope of this article.

## Assumptions

This scope of this document covers integration of Avi Vantage with F5 GTM. Installation of either product is not covered.

This document assumes that:

* Avi Vantage is installed in two or more data centers. 
* F5’s BIG-IP GTM is installed.  

GTM may or may not be installed in the same data centers where Vantage will be providing local application delivery services.

## Configuration of Avi Vantage

No special configuration is required for virtual services advertised by Vantage to be load balanced through global server load balancers. The virtual services may exist on a single Avi Controller cluster or they may exist across multiple Controller clusters.

### Add Avi Service Engine to GTM

<ol> 
 <li> <p>From within the GTM GUI, navigate to DNS &gt; GSLB &gt; Server.</p> </li> 
 <li> <p>Configure the following information:</p> 
  <ul> 
   <li> <p>Create Server Object: Generic Load balancer</p> </li> 
   <li> <p>Name: Unique Avi Service Engine (SE), for example "Avi_DC1"</p> </li> 
   <li> <p>Address: Avi Controller’s cluster IP address</p> </li> 
   <li> <p>Translation: Firewall/NAT public routable IP address of the Controller cluster IP</p> </li> 
   <li> <p>Data Center: configured GTM data center object, for example "DC1"</p> </li> 
   <li> <p>Health Monitor: Gateway_icmp</p> </li> 
  </ul> </li> 
 <li> <p>Click on Create to finish.</p> </li> 
</ol> 

### Create Avi Virtual Service as GTM VS Object

<ol> 
 <li> <p>Click Add. Enter the following information:</p> 
  <ul> 
   <li> <p>Name: Avi Controller</p> </li> 
   <li> <p>Address: Avi virtual service IP (VIP) address</p> </li> 
   <li> <p>Service Port: 80</p> </li> 
   <li> <p>Health Monitor: HTTP or TCP</p> </li> 
   <li> <p>Dependency List: Select Avi_Controller virtual server object</p> <p>Note: For HTTP virtual services, HTTP health checks are recommended. To be successful, an HTTP health check must include sending a valid HTTP request to the server, and receiving a valid HTTP response. For other types of virtual services, TCP health checks are recommended.</p> </li> 
  </ul> </li> 
 <li> <p>Add to Dependency List.</p> </li> 
 <li> <p>Click on Create to finish.</p> </li> 
 <li> <p><em>(Optional)</em> Create additional Avi virtual services from different data center, if needed.</p> </li> 
</ol> 

### Create GTM Pool

<ol> 
 <li> <p>Navigate to DNS &gt; GSLB &gt; Pool.</p> </li> 
 <li> <p>Click on Create. Enter the following information:</p> 
  <ul> 
   <li> <p>Name: enter a name for the GTM pool.</p> </li> 
   <li> <p>Health check: leave empty (none).</p> </li> 
   <li> <p>Member list: select Avi Virtual Service Objects from the list and click Add.</p> </li> 
  </ul> </li> 
 <li> <p>Click on Finish.</p> </li> 
</ol> 

### Create GTM WideIP for Load Balancing

<ol> 
 <li> <p>Navigate to DNS &gt; GSLB &gt; WideIP.</p> </li> 
 <li> <p>Click on Create. Add the following information:</p> 
  <ul> 
   <li> <p>Name: enter the FQDN of the application.</p> </li> 
   <li> <p>LB Selection Log: select Pool and Member selection log.</p> </li> 
   <li> <p>LB Method: select desired load balancing method.</p> </li> 
   <li> <p>Pool List: add the GTM pool to the list.</p> </li> 
  </ul> </li> 
 <li> <p>Click on Finish to complete the integration.</p> </li> 
</ol> 