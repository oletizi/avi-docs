---
title: GSLB Integration with F5 GTM
layout: default
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

1. From within the GTM GUI, navigate to DNS > GSLB > Server.
1. Configure the following information:

* Create Server Object: Generic Load balancer
* Name: Unique Avi Service Engine (SE), for example "Avi_DC1"
* Address: Avi Controller’s cluster IP address
* Translation: Firewall/NAT public routable IP address of the Controller cluster IP
* Data Center: configured GTM data center object, for example "DC1"
* Health Monitor: Gateway_icmp
* Click on Create to finish.

### Create Avi Virtual Service as GTM VS Object

1. Click Add. Enter the following information:

* Name: Avi Controller
* Address: Avi virtual service IP (VIP) address
* Service Port: 80
* Health Monitor: HTTP or TCP
* Dependency List: Select Avi_Controller virtual server object

Note: For HTTP virtual services, HTTP health checks are recommended. To be successful, an HTTP health check must include sending a valid HTTP request to the server, and receiving a valid HTTP response. For other types of virtual services, TCP health checks are recommended.
* Add to Dependency List.
* Click on Create to finish.
* *(Optional)* Create additional Avi virtual services from different data center, if needed.

### Create GTM Pool

1. Navigate to DNS > GSLB > Pool.
1. Click on Create. Enter the following information:

* Name: enter a name for the GTM pool.
* Health check: leave empty (none).
* Member list: select Avi Virtual Service Objects from the list and click Add.
* Click on Finish.

### Create GTM WideIP for Load Balancing

1. Navigate to DNS > GSLB > WideIP.
1. Click on Create. Add the following information:

* Name: enter the FQDN of the application.
* LB Selection Log: select Pool and Member selection log.
* LB Method: select desired load balancing method.
* Pool List: add the GTM pool to the list.
* Click on Finish to complete the integration.