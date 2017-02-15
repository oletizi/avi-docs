---
title: Troubleshooting Avi Vantage Deployment into VMware
layout: layout171
---
/*/*This article provides troubleshooting tips for Avi Vantage deployment into a VMware vCenter-managed cloud.

## All Deployment Modes (write, read, or no access)

The following issues can occur in any deployment mode (write, read, or no access).

### Cannot Access Web Interface—Blank Page or 503 Status Code

The Avi Controller is still booting up. Wait for 5-10 minutes.

### Cannot See SEs from Avi Controller

* Ensure that the SE's management interface is connected to the correct port group.
* Verify that an IP address is assigned to the SE's management interface. 

### Virtual Service Creation Fails

* Verify whether the SEs are visible in the Avi Controller's web management interface: Infrastructure > Cloud > Default Cloud >Service Engine
* If DHCP is used for assigning IP addresses to the SE interfaces, verify that the DHCP service is running correctly. 

## Write Access Mode

### Avi Controller Cannot Connect To vCenter

* Verify the network connectivity between the Avi Controller and the vCenter.
* Verify the vCenter credentials.
* Verify no intervening infrastructure prevents Avi Controllers from accessing the desired ESXi hosts over port 443. 

### Avi Controller Does Not Spin Up an SE

* Verify the network connectivity between the Avi Controller and the vCenter.
* If vCenter cannot return an ESX host's DNS name instead of its IP address to the Avi Controller, ensure that the Avi Controller is configured to use the correct DNS server.
* Verify that the ESX hosts have adequate resources. 

### Virtual Service Creation Fails

* Verify that the vCcenter account specified in Vantage for the cloud has privileges to create new folders in vCenter. This is required for virtual service creation.
* Verify that the virtual service and server networks (port groups) are discovered with subnets: Infrastructure > Cloud > Default-Cloud > Network
* If static IP addresses are used for SE interfaces, verify the IP address pool: Infrastructure > Cloud > Default-Cloud > Network 

## Read Access Mode

### Avi Controller Cannot Connect To vCenter

* Verify the vCenter credentials.
* Verify the network connectivity between the Avi Controller and the vCenter.
* Verify no intervening infrastructure prevents Avi Controllers from accessing the desired ESXi hosts over port 443. 

### Virtual Service Creation Fails

* Verify that the virtual service and server networks (port groups) are discovered with subnets: Infrastructure > Cloud > Default-Cloud > Network
* If static IP addresses are used for SE interfaces, verify the IP address pool: Infrastructure > Cloud > Default-Cloud > Network
* In vCenter, ensure that the interfaces are correctly connected to port groups. 

## No Access Mode

### Virtual Service Creation Fails

* Verify SE interface configuration. Navigate to Infrastructure > Cloud > Default Cloud >Service Engine, select an SE, and click Edit. Verify that either DHCP is enabled or an IP address is assigned to the correct vNIC, by matching its MAC address to that of a connected network adapter on the SE VM.
* In vCenter, ensure that the interfaces are correctly connected to port groups. 