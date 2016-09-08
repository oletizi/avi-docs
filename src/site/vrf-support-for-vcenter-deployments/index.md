---
title: VRF Support for vCenter Deployments
layout: default
---
Virtual Routing Framework, or VRF, is a method of isolating traffic within a system. This is also referred to as a "Route Domain" within the load balancer community.

In Avi Vantage deployments with VMware vCenter, all port groups discovered from vCenter are placed into a single VRF context, called "global", by default. Vantage 16.1 adds support for multiple VRF contexts. VRF contexts simplify virtual service deployment, by organizing the port groups discovered from vCenter into subsets.

Beginning in 16.1, ***if multiple VRF contexts are configured***, the workflow for creating a virtual service begins with selecting the VRF in which to place the virtual service. The web interface presents only the networks in the selected VRF context as valid targets for placing that virtual service.
Note: Support in vCenter-managed clouds for multiple VRF contexts requires Vantage version 16.1 (or later).

Note: In 16.1 and earlier, Vantage must be deployed in "provider mode". This is explained below.

## Global VRF and Admin Tenant

When a VMware cloud is created on the Controller, Vantage adds all of the port groups learned from vCenter into a VRF named "global", in the admin tenant.

<img src="img/vmware-single-vrf-1.png" alt="vmware-single-vrf" width="525" height="534">

In 16.1, additional VRF contexts can be created in the admin tenant, and individual port groups can be moved from the global VRF into the other VRF contexts. The VRF contexts and their port groups remain in the admin tenant but are available for selection by other tenants when they create virtual services, as shown in the following example:

<img src="img/vmware-multi-vrf.png" alt="vmware-multi-vrf" width="525" height="534">

## Vantage Provider Mode

When integrated with a vCenter-managed cloud, Vantage operates in *provider* mode. This is not the same as a virtual routing context. Provider mode is a Vantage deployment mode wherein all the cloud's network resources--the packet plumbing--remain in the admin tenant and cannot be moved. To configure VRF contexts and move port groups into them the Vantage user must have write privileges for the admin tenant.

In 16.1 and in previous versions, Vantage deployment into a vCenter-managed cloud is supported only in provider mode. In provider mode, other tenants can use the network infrastructure for their virtual services but the infrastructure is managed by the service provider, from the admin tenant.

## VRF Configuration

This section gives steps for creating VRF contexts on the Vantage Controller, moving port groups to the VRF contexts, and creating virtual services in those contexts.

### Notes

* This section assumes that the Controller has already been installed, and that initial configuration of the Controller has been performed using the setup wizard.
* The Vantage user must have write privileges for the admin tenant. These steps can be performed only from the admin tenant.
* The Vantage version must be 16.1 (or later).

### Creating VRF Contexts

1. Navigate to Infrastructure > Clouds.
1. Click on the cloud name. 
Note: If the VMware vCenter cloud is the only one configured, or was the first one configured, the cloud name is "Default-Cloud".
1. Click VRF Context, then click the Create VRF Context button.

<a href="img/vrf1.png"><img src="img/vrf1.png" alt="vrf1" width="1237" height="331"></a>
1. Enter the name of the VRF context and click Save.

<a href="img/vrf2.png"><img src="img/vrf2.png" alt="vrf2" width="752" height="562"></a>

### Assigning Networks to the VRF Contexts

1. Navigate to Infrastructure > Clouds, and click on the cloud name.
1. Click on Network.
1. Select DHCP, if not already selected.
1. Select the VRF context for the network from the Routing Context pull-down list, and click Save.

<a href="img/vrf4.png"><img src="img/vrf4.png" alt="vrf4" width="880" height="549"></a>

## Creating Virtual Services

Note: These steps can be performed from the admin tenant or from another tenant.

1. Navigate to Applications > Dashboard, and click New Virtual Service.
1. Select the VRF context from the list, and click Next.

<a href="img/vrf5.png"><img src="img/vrf5.png" alt="vrf5" width="760" height="569"></a>
1. Enter a name for the virtual service.
1. Enter the virtual IP address (VIP) on which Vantage will listen for requests to the virtual service.
1. In the Select Servers by Network section, select the network in which to place the virtual service. *Only the networks within the selected VRF context are listed.*

<a href="img/vrf6.png"><img src="img/vrf6.png" alt="vrf6" width="747" height="558"></a>

After a network is selected, a list of the servers in that network appears.

<a href="img/vrf7.png"><img src="img/vrf7.png" alt="vrf7" width="893" height="556"></a>
1. Click to select individual servers, then click Add Servers.
1. Click Save.