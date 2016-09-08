---
title: IPAM and DNS (16.2.x)
layout: default
---
The Avi Controller can be configured to provide automatic IP address allocation for virtual services and to provide authoritative DNS resolution for their virtual IP addresses.

To enable auto-allocation of VIPs, configure an IP address management (IPAM) profile and add it to the configuration of the cloud on the Avi Controller. IPAM profiles can be configured to use the following IP providers:

* Avi Vantage
* Infoblox
* Amazon Web Services (AWS)
* OpenStack

To enable authoritative DNS resolution of queries for the VIP addresses, configure a DNS profile and add it to the configuration of the cloud on the Avi Controller.

### Notes

These procedures assume the cloud configuration has already been created on the Avi Controller.

## Providers of IPAM and DNS Support

Here is the list of providers and supported functionalities for IPAM and DNS:
<table class="table"> 
 <tbody> 
  <tr> 
   <th width="60%">Support / Provider Profile</th> 
   <th>Infoblox</th> 
   <th>Internal</th> 
   <th>&nbsp;AWS/OpenStack</th> 
  </tr> 
  <tr> 
   <td>IPAM only</td> 
   <td>No (not currently supported)</td> 
   <td>Yes</td> 
   <td>Yes</td> 
  </tr> 
  <tr> 
   <td>DNS only</td> 
   <td>No (not currently supported)</td> 
   <td>Yes</td> 
   <td>No</td> 
  </tr> 
  <tr> 
   <td>IPAM + DNS</td> 
   <td>Yes</td> 
   <td>Yes</td> 
   <td>No</td> 
  </tr> 
 </tbody> 
</table>

For example, if Infoblox is the chosen provider, both IPAM and DNS profiles should be pointing to Infoblox. If Vantage is the chosen provider, the Vantage user has an option to use IPAM, DNS, or both.

## IPAM / DNS Support for Cloud Infrastructure

This table lists the IPAM and DNS provider support available for each type of cloud (infrastructure) configured in Vantage. For example, when creating VirtualServices in OpenStack or AWS cloud, a separate configuration for IPAM is not needed/allowed as the cloud configuration has support for IPAM natively in Avi. However, Vantage DNS service can be still be used with these Clouds.

 
<table style="height: 296px" width="913"> 
 <tbody> 
  <tr> 
   <td><b>Cloud / Provider Profile</b></td> 
   <td><b>Infoblox</b></td> 
   <td colspan="2"><b>Internal</b></td> 
   <td colspan="2"><b>AWS/OpenStack</b></td> 
  </tr> 
  <tr> 
   <td></td> 
   <td><b>IPAM+DNS</b></td> 
   <td><b>IPAM</b></td> 
   <td><b>DNS</b></td> 
   <td><b>IPAM</b></td> 
   <td><b>DNS</b></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">VMware (Read Access)</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">N/A</span></td> 
   <td><span style="font-weight: 400">N/A</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">VMware (Write Access)</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">N/A</span></td> 
   <td><span style="font-weight: 400">N/A</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">OpenStack</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">N/A (default, native)</span></td> 
   <td><span style="font-weight: 400">N/A (default, not used)</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">AWS</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">N/A (default, native)</span></td> 
   <td><span style="font-weight: 400">N/A (default, native)</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">Containers (Mesos/Rancher/Docker UCP)</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">Linux Server</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
  </tr> 
  <tr> 
   <td><span style="font-weight: 400">No access</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">Yes</span></td> 
   <td><span style="font-weight: 400">No</span></td> 
  </tr> 
 </tbody> 
</table>

 

## Cloud Configuration Workflow

This section lists the steps for configuring IPAM and DNS support. The configuration fields differ among the infrastructure types and the provider (Vantage, Infoblox, AWS, and OpenStack). See the sections following this one for detailed steps.

1. Navigate to Templates > Profiles.
1. Click IPAM/DNS Profile.
1. Click Create and select the provider:

* Internal
* Infoblox
* AWS
* OpenStack
* Fill in the displayed fields. (Detailed steps are provided in the sections below.)
* Click Save. The profile appears in the list.
* Navigate to Infrastructure > Clouds, and edit the cloud setting.
* Select the IPAM and DNS providers from the pull-down list. Either one or both need to be selected, based on the provider selected.
For example: if Infoblox is the IPAM provider, it must be the DNS provider as well.
* (Optional) For east-west virtual services in this cloud, you need to additionally select east-west IPAM and DNS providers from the pull-down list. Either one or both can be selected.
* Click Save.

Sample Cloud Configuration with IPAM & DNS from steps 1 through 9:

<a href="img/cloud-ipam-dns.png"><img src="img/cloud-ipam-dns.png" alt="cloud-ipam-dns" width="1080" height="677"></a>

 

Following sections provide information for each of the IPAM / DNS providers supported by Vantage.

**Avi Vantage** -> <a href="/ipam-and-dns-provider-avi-vantage/">https://kb.avinetworks.com/ipam-and-dns-provider-avi-vantage/</a>

**Infoblox** -> <a href="/ipam-and-dns-provider-infoblox/">https://kb.avinetworks.com/ipam-and-dns-provider-infoblox/</a>

**AWS IPAM** -> <a href="/ipam-and-dns-provider-aws/">https://kb.avinetworks.com/ipam-and-dns-provider-aws/</a>

**Openstack IPAM** -> <a href="/ipam-and-dns-provider-openstack/">https://kb.avinetworks.com/ipam-and-dns-provider-openstack/</a>

 

## Virtual Service Configuration Workflow

Select Auto Allocate IP and a network from a list of networks & subnets in the VS create window as shown below:

<a href="img/vs-create-dns-1.png"><img src="img/vs-create-dns-1.png" alt="vs-create-dns" width="662" height="416"></a>

Select FQDN for the virtual service from a list of configured domain names:

<a href="img/vs-create-ipam-1.png"><img src="img/vs-create-ipam-1.png" alt="vs-create-ipam" width="666" height="417"></a>

 

Note:

1. If a DNS profile is configured under a Cloud where the virtual service is being created, then the virtual service's IP cannot be determined from a fully qualified domain name; the user is expected to enter an IP address or select the auto-allocate IP checkbox.
1. In case of Infoblox, if there is a list of usable_subnets/usable_domains configured (refer to section for Infoblox above in this article), then the dropdown will consist only of those entries. If no such configuration is found, Avi will display the entire list of available subnets/domains from Infoblox.