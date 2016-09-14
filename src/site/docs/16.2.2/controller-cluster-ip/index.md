---
title: Controller Cluster IP
layout: default
---
The Avi Controller cluster IP address is a single IP address shared by multiple Avi Controllers within a cluster. This is the address to which the web interface, CLI commands and REST API calls are directed. As a best practice, to access the Avi Controller, one logs onto the cluster IP address instead of the IP addresses of individual Avi Controller nodes.

Note: If the IP address of an Avi Controller node has changed, a <a href="/docs/latest/ctlr-cfg-update-after-ip-change">script </a>must be run to update the configuration.

### Cluster IP Advertisement

The Avi Controller cluster IP is ARPed by whichever Avi Controller is the primary (or leader, depending on the infrastructure type) within the cluster. When another Avi Controller becomes the primary, it will send out a gratuitous ARP to claim ownership of the cluster IP.

Administrators may manage any of the Avi Controllers within the cluster by directly accessing the cluster IP address. The Avi Controllers will handle all replication, so there is no requirement to make changes specifically on the primary Avi Controller.

Note: In Avi Vantage terminology, the cluster IP is not the same as a "floating IP". <a href="/docs/configuration-guide/applications/virtual-services/create-virtual-service#openstack-floatingip">In Vantage, the term "floating IP" applies only to OpenStack.</a>

## Configuring the Cluster IP

### Web Interface

To add the cluster IP within the web interface, navigate to Administration &gt; Controller &gt; Edit. Add the new address to the Controller Cluster IP field. This change takes effect immediately upon saving.

<a href="img/cluster-config-example.png"><img src="img/cluster-config-example.png" alt="cluster-config-example" width="1140" height="456"></a>