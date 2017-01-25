---
title: Installing Avi Vantage for OpenStack (16.2)
layout: layout162
---
Note to reader: With release 16.2.2, Avi Vantage now <a href="/docs/16.2/openstack-external-networks">supports using OpenStack external networks</a>.

## Introduction

This guide describes how to integrate Avi Vantage into an OpenStack cloud. The instructions in this guide can be used for installing Avi Vantage 16.2.

Avi Vantage is a software-based solution that provides real-time analytics as well as elastic application delivery services. Vantage optimizes core web-site functions including SSL termination and load balancing. Vantage also provides access to network analytics, including end-to-end latency information for traffic between end-users and the load-balanced applications.

Vantage's unique controller-based architecture with integration into virtual infrastructure and cloud orchestrators enables true automated horizontal scaling where data plane capacity expands and contracts dynamically based on workload. When deployed into an OpenStack cloud, Avi Vantage performs as a fully distributed, virtualized system consisting of the Avi Controller and Avi Service Engines (SEs), each running as a separate virtual machine (VM).

* **Avi Controller:** VM that acts as a single point of control and management with OpenStack and is integrated with Nova, Keystone, Neutron, and Glance to allow seamless multitenancy support for scalable performance. Based on configuration, the Controller places new services on existing VMs if there is room, or spins up a new VM if needed. The Controller deploys an SE VM as needed when a tenant creates a virtual service or VIP for load balancing. Management access and analytics are provided through a web-based interface and REST-based API. The Controller manages the life cycles of the SEs by creating, controlling, and eventually deleting them. The Controller stores and manages all policies related to services and management. The Controller also provides a central point of contact for other cloud infrastructures, and can manage resources in multiple infrastructures simultaneously. For example, the Controller can be configured to communicate with both an OpenStack controller and a VMware vCenter server, to manage resources in each type of cloud.

* **Avi Service Engine (SE):** VM that receives the end-user traffic and provides application delivery services, while also collecting real-time end-to-end metrics for traffic between end-users and applications. The Controller creates an SE VM, plumbs it into a network, and provisions it with a service policy. The service policy is required to deploy a virtual service (VS), which consists of IP address and TCP/UDP port number that together represent a load-balanced service. 

## OpenStack Integration

Vantage integrates with OpenStack infrastructure components to provide centralized automation, monitoring, and management of application discovery and delivery.

Avi Vantage integrates with the following OpenStack services:

* **Keystone:** Provides automatic creation of tenants, users, and roles. Also isolates the control path from the data path.
* **Glance:** Provides software image management.
* **Nova:** Provides automatic creation of application delivery service engines (Avi SEs), and performs real-time autoscaling by adding new SEs.
* **Neutron:** Provides automatic network connectivity of Avi SEs. 

Here is how Avi Vantage integrates into an OpenStack cloud:

<a href="img/openstack-topo-1.png"><img class="alignnone size-full wp-image-5090" src="img/openstack-topo-1.png" alt="openstack-topo" width="528" height="445"></a>

## Deployment Modes

Vantage can be deployed into an OpenStack cloud in one of the following modes. These modes differ depending on whether the Avi Controller and Service Engines (SEs) are placed in the same OpenStack tenants, and whether Neutron or Avi Vantage is used to perform traffic load balancing.

* **Single-tenant mode:** The Avi Controller and the SEs are deployed together in the same single tenant. The Avi Controller has administrator privileges within the tenant. Tenant users who have administrator privileges within the tenant can install and manage Vantage. (You must use this deployment mode if you do not have administrator privileges for the cloud.) 
* **Avi-managed LBaaS mode:** The Avi Controller and SEs are installed in separate tenants. The Controller has administrator privileges for the cloud and can manage SEs that are in different tenants. A tenant administrator can log onto the Avi Controller to manage the infrastructure resources within her or his own tenant but cannot access the resources within other tenants. The tenant administrator can configure and manage load balancing services through the Avi Controller web interface or through the Avi REST API. 
* **OpenStack-managed LBaaS mode:** Similar to Avi-managed LBaaS mode, except the tenant administrator configures and manages load-balancing services through OpenStack's Neutron service and Horizon dashboard. Neither the Controller web interface nor Avi API are used. (This mode also requires installation of an LBaaS driver and SSL extension from Avi Networks.) 

Note: The Avi-managed LBaaS option is recommended for its ease of use and advanced feature accessibility.

The following table compares each deployment mode:

<table class="table table table-bordered table-hover">  
<tbody>         
<tr>     
<th>
</th>
<th>Single-tenant Mode
</th>
<th>Avi-managed LBaaS Mode
</th>
<th>OpenStack-managed LBaaS Mode
</th>
</tr>
<tr>     
<td>Administrator privileges for cloud required</td>
<td>No</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr>     
<td>Managed by tenant user</td>
<td>No</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr>     
<td>Automated tenant creation</td>
<td>N/A</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr>     
<td>Advanced load-balancing features</td>
<td>Yes</td>
<td>Yes</td>
<td>Limited</td>
</tr>
<tr>     
<td>Analytics service</td>
<td>Yes</td>
<td>Yes</td>
<td>Yes</td>
</tr>
<tr>     
<td>Avi LBaaS driver install required</td>
<td>No</td>
<td>No</td>
<td>Yes</td>
</tr>
<tr>     
<td>Avi extension for Horizon dashboard required</td>
<td>No</td>
<td>No</td>
<td>Yes (required for SSL offload and analytics)</td>
</tr>
</tbody>
</table> 

## Deployment Prerequisites

The physical and software requirements differ depending on the deployment mode.

### Virtual Machine Requirements

The following table lists the minimum requirements for the VMs on which the Avi Controller and SEs are installed.

<table class="table table table-bordered table-hover">  
<tbody>    
<tr>     
<th>Component
</th>
<th>Memory
</th>
<th>vCPUs
</th>
<th>HD
</th>
</tr>
<tr>     
<td>Avi Controller</td>
<td>24 GB</td>
<td>8</td>
<td>64 GB</td>
</tr>
<tr>     
<td>Service Engine</td>
<td>2 GB</td>
<td>2</td>
<td>10 GB</td>
</tr>
</tbody>
</table> 

Add 3 GB for each additional vCPU in a Controller.
Add 1GB for each additional vCPU in an SE.

If you allocate more than the minimum number of vCPUs required, make sure to also allocate at least the minimum required additional memory. Cloud administrators can create multiple flavors of the Avi Vantage Controller image with different resource allocations (for example, "avi_ctrl.small" with the minimum required resources, and "avi_se.medium" with more resources).

### Software Requirements

The following table lists the software requirements.

<table class="table table table-bordered table-hover">  
<tbody>       
<tr>   
<th>Software
</th>
<th>Version
</th>
</tr>
<tr>   
<td>Avi Controller</td>
<td>16.2</td>
</tr>
<tr>   
<td>OpenStack (and Neutron service)</td>
<td>One of the following: Havana, Icehouse, Juno, Kilo, or Liberty</td>
</tr>
<tr>   
<td>Neutron extension for allowed-address-pair</td>
<td></td>
</tr>
<tr>   
<td>Avi LBaaS driver</td>
<td>16.2</td>
</tr>
<tr>   
<td>Avi SSL extension for OpenStack Horizon</td>
<td>16.2</td>
</tr>
</tbody>
</table> 

The Avi Vantage image is available as a QCOW2 or raw image of the Controller and SEs. The SE software is embedded in the Controller image and does require separate installation.

The Avi LBaaS driver is required only for OpenStack-managed LBaaS mode. The SSL extension for OpenStack Horizon is required only for OpenStack-managed LBaaS mode. (This driver adds tabs to Horizon for accessing the Controller.)

Note: Installation of Avi Vantage into DevStack is supported only if the DevStack/Nova-launched Virtual Machine (VMs) can run in Kernel-based Virtual Machine (KVM) mode, as opposed to Quick Emulator (QEMU) mode. Please see the <a href="http://docs.openstack.org/developer/devstack/guides/devstack-with-nested-kvm.html">DevStack KVM Guide</a> for information.

### Protocol Ports Used by Avi Vantage for Management Communication

In an OpenStack deployment, the Avi Controller and Avi Service Engines use the following ports for management. The firewall should allow traffic for these ports.
<table class="table table table-bordered table-hover">  
<tbody>       
<tr>    
<th>Traffic Source
</th>
<th>Traffic Destination
</th>
<th>Ports To Allow
</th>
</tr>
<tr>    
<td rowspan="3">Avi Controller</td>
<td>Avi Controller</td>
<td>TCP 22 (SSH)<br> TCP 8443<br> TCP 5054</td>
</tr>
<tr>   
<td>Avi Service Engine</td>
<td>TCP 22</td>
</tr>
<tr>   
<td>Management Net</td>
<td><em>See section below the table.</em></td>
</tr>
<tr>    
<td>Avi Service Engine</td>
<td rowspan="2">Avi Controller</td>
<td>TCP 22<br> TCP 8443<br> UDP 123</td>
</tr>
<tr>   
<td>Management Net</td>
<td>TCP 22<br> TCP 80 <em>(optional)</em><br> TCP 443<br> TCP 5054 <em>(if using the optional <a href="/docs/16.2/cli-installing-the-cli-shell/">CLI shell</a> for remote management access)</em></td>
</tr>
</tbody>
</table>  

### Ports Used by Controller for Network Services

The Controller may send traffic to the following UDP ports as part of network operation:

* TCP 25 (SMTP)
* UDP 53 (DNS)
* UDP 123 (NTP)
* UDP 162 (SNMP traps)
* UDP 514 (Syslog) 

The firewall also should allow traffic from the Controller to these ports.

## Importing User Accounts from Keystone

Using the Avi REST API, user roles can be exported from Keystone into the Avi Controller and directly mapped to role names in the Controller. The accounts do not need to be recreated on the Controller. Here is an example:

<pre><code class="language-lua">"openstack_configuration": 
{
    ....
    "role_mapping": [
       {"os_role": "admin",
        "avi_role": "Tenant-Admin"},
       {"os_role": "_member_",
        "avi_role": "Tenant-Admin"},
       {"os_role": "*",
        "avi_role": "Application-Operator"}
    ],
    ....
}</code></pre>  

The role_mapping parameter is an ordered list, where each item specifies how a Keystone role (os_role) maps to a role in the Controller (avi_role). A default mapping can be defined for any Keystone role by specifying the “ /* ” wildcard for the os_role field. In the above example, roles admin and _member_ from Keystone are mapped to the role Tenant-Admin in the Controller. Further, any other role from Keystone is mapped to role Application-Operator on the Controller.

In the following example, only users with role lbaas_project_admin are allowed to access the Controller:

<pre><code class="language-lua">"openstack_configuration": 
{
    ....
    "role_mapping": [
       {"os_role": "lbaas_project_admin",
        "avi_role": "Tenant-Admin"}
    ],
    ....
}</code></pre>  

## Deploying Single-tenant Mode

This section provides the steps for deploying Vantage into an OpenStack cloud in single-tenant mode.

<a href="img/OpenStack-deploy-topo-tenantmode.png"><img class="alignnone size-full wp-image-5086" src="img/OpenStack-deploy-topo-tenantmode.png" alt="OpenStack-deploy-topo-tenantmode" width="528" height="248"></a>

In single-tenant mode, the Avi Controller and SEs are installed in the same tenant, and have member privileges for that tenant. The member privilege grants the Avi Controller full access to the tenant so that it can automatically spin-up and spin-down an SE. Each tenant is responsible for installing and operating Vantage.

### Deployment Process

Single-tenant installation requires the following procedure.
<ol> 
 <li>Add the Avi Controller QCOW2 or raw image into the tenant from Glance.</li> 
 <li>Create a management network for the Avi Controller and SEs.</li> 
 <li>Create a security group.</li> 
 <li>Deploy an Avi Controller instance and assign a floating IP address to it.</li> 
 <li>Create a security group to allow Avi management traffic.</li> 
 <li>Use the setup wizard to perform initial configuration of the Controller.</li> 
</ol> 

Detailed steps are provided below.

### Upload Controller Image

<ol> 
 <li>Copy the Avi Vantage Controller image onto your hard drive.</li> 
 <li>Log into the OpenStack tenant account on the Horizon dashboard.</li> 
 <li>Navigate to Project &gt; Images.</li> 
 <li>Click Create Image and fill out the form.</li> 
</ol> 

### Create Management Network

A management network is required for communication between the Avi Controller and the SEs. An existing network can be used but a dedicated management network is recommended.
<ol> 
 <li>On the Horizon Dashboard, navigate to Network &gt; Networks.</li> 
 <li>Click Create Network and follow the wizard's instructions. For this example: 
  <ul> 
   <li>Network name: avi-mgmt</li> 
   <li>DHCP: Enabled</li> 
  </ul> </li> 
 <li>Connect the network to your neutron router.a. Navigate to Network &gt; Routers.b. On the Name column in the router list, click the router to add an interface to the network.c. Click the Interfaces tab, then click Add Interface.</li> 
</ol> 

### Create Security Group

A security group is required to allow the Controller and SEs to exchange management traffic. The group specifies the protocol ports for which traffic will be allowed.

* For ingress traffic, the group must allow <a href="#mgmt-ports">these</a> ports.
* For egress traffic, the group can allow all ports. 

Note: The Controller automatically creates a security group for the SEs.

To create a security group (in this example, "Avi-mgmt-sg") to allow management traffic:
<ol> 
 <li>On the Horizon Dashboard, navigate to Project &gt; Access &amp; Security, and click Create Security Groups.</li> 
 <li>Add rules as shown in the following example, where 192.168.10.0/24 is the management network.<br> <img class="alignnone size-full wp-image-8773" src="img/openstack-portgroup-excerpt.png" alt="openstack-portgroup-excerpt" width="539" height="415"></li> 
</ol> 

### Deploy Controller and Assign It a Floating IP

Deploy an Avi Controller instance:

* Flavor: Deploy m1.xlarge or bigger.
* Network: Use avi-mgmt to attach the Controller to the management network.
* Security group: Use avi-mgmt-sg to allow management traffic.
* Enable config-drive. 

To assign a floating IP address to the Controller:

<ol> 
 <li>On the Horizon Dashboard, navigate to Project &gt; Compute &gt; Access &amp; Security.</li> 
 <li>Assign the floating IP address: 
  <ul> 
   <li>If no floating IP address is already available, click Allocate IP to Project.</li> 
   <li>Otherwise, if a floating IP address is already available, associate it with the Avi Controller instance.</li> 
  </ul> </li> 
</ol> 

### Perform Initial Controller Setup

This section shows how to perform initial configuration of the Avi Controller using its deployment wizard. You can change or customize settings following initial deployment using the Avi Controller’s web interface.

Note: While the system is booting up, a blank web page or 503 status code may appear. In this case, wait for 5 to 10 minutes; then follow the instructions for the setup wizard.
<ol> 
 <li>Configure basic system settings: 
  <ul> 
   <li>Administrator account</li> 
   <li>DNS and NTP server information</li> 
  </ul> 
  <div> 
   <p><img src="img/openstack-install-adminacct-162.png" alt="" width="264" height="" align="left"> <img src="img/openstack-install-dnsntp-262.png" alt="" width="264" height="" align="left" hspace="12" vspace=""></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>Set the infrastructure type to OpenStack: <img class="alignnone size-full wp-image-6067" src="img/ctlr-setup-infra-openstack-162.png" alt="ctlr-setup-infra-openstack-161" width="264" height="303"></li> 
 <li>Enter OpenStack settings: 
  <ul> 
   <li>Tenant user credentials (username, password)</li> 
   <li>IP address of Keystone host</li> 
   <li>Enable (check) the Keystone Auth option.</li> 
  </ul> <p><a href="img/openstack-deploy-openstacklogin-selectkeystone.png"><img class="alignnone wp-image-11302" src="img/openstack-deploy-openstacklogin-selectkeystone.png" alt="openstack-deploy-openstacklogin-selectkeystone" width="285" height="265"></a></p></li> 
 <li>In the Management Network window, select a tenant. In this deployment, it should be the same tenant into which the Avi Controller is deployed. Choose the management network created previously. <img class="alignnone wp-image-6598" src="img/ctlr-setup-mgmtnetwork-162.png" alt="ctlr-setup-mgmtnetwork-161" width="264" height="322"></li> 
 <li>In the Keystone Role Mapping window, select a Vantage user role to use as the default user role: <img class="alignnone size-full wp-image-6070" src="img/ctlr-setup-openstack-keystonemapping-162-1.png" alt="ctlr-setup-openstack-keystonemapping-161" width="264" height="288"><br> If a Vantage user who logs in with valid Keystone credentials, but with a role that does not have the same name as any of the user roles defined on the Controller, the default role is assigned to the user. To instead disallow access by any user who does not have a role that is defined on the Controller, leave the selection empty (None).</li> 
 <li>In the Virtual Service Placement Settings window, select Import Tenants to import from tenants Keystone and click Next. Then, in the Support Multiple Tenants window, click No. <img class="alignnone size-full wp-image-6068" src="img/ctlr-setup-vsplacement-openstack-162.png" alt="ctlr-setup-vsplacement-openstack-161" width="264" height="305"></li> 
 <li>To verify installation, navigate to Infrastructure &gt; Clouds, click Default-Cloud, then click the Status button. If the status is green, the installation is successful.<br> <a href="img/openstack-deploy-verify-162.png"><img class="alignnone size-full wp-image-10219" src="img/openstack-deploy-verify-162.png" alt="openstack-deploy-verify-162" width="1438" height="364"></a></li> 
</ol> 

## Deploying Avi-managed LBaaS Mode

This section provides the steps for deploying Vantage into an OpenStack cloud in Avi-managed LBaaS mode.

<a href="img/OpenStack-deploy-topo-avilbaas.png"><img class="alignnone size-full wp-image-5087" src="img/OpenStack-deploy-topo-avilbaas.png" alt="OpenStack-deploy-topo-avilbaas" width="528" height="252"></a>

Avi-managed LBaaS mode provides tenant users with the advantages of Avi Vantage, without the need for them to perform deployment or maintenance of Vantage. Instead, the cloud administrator deploys and manages Vantage. The Controller and SEs in the administrative tenant are shared by other tenants. Users of those tenants are able to secure and optimize their applications using the Vantage resources that reside in the administrative tenant.

Note: Although using an existing tenant instead of creating a new one also is supported, creating a new tenant is recommended for easy maintenance.

### Deployment Process

Deployment of Avi-managed LBaaS mode requires the following procedure.
<ol> 
 <li>Create a tenant for the Controller and SE.</li> 
 <li>(Optional) Create multiple flavors of the Vantage image, with different resource allocations to fit different sizes of user tenant. (For example: "avi_ctrl.small" and "avi_se.medium".)</li> 
 <li>Upload the Avi Controller QCOW2 or raw image into the tenant from Glance.</li> 
 <li>Create a management network for the Avi Controller and SEs.</li> 
 <li>Create a security group to allow Avi management traffic.</li> 
 <li>Deploy an Avi Controller instance and assign a floating IP address to it.</li> 
 <li>Use the setup wizard to perform initial configuration of the Controller.</li> 
</ol> 

Detailed steps are provided below.

### Create a Tenant for the Controller and SEs

<ol> 
 <li>Log into the OpenStack Horizon dashboard with an account that has cloud administrator privileges.</li> 
 <li>Navigate to Identity &gt; Projects.</li> 
 <li>Click New Project and follow the wizard's instructions.</li> 
 <li>Follow the instructions of the tenant creation wizard. For Avi Vantage deployment, use the following settings:<br> a. Enter a project name (e.g., "avi-tenant”).<br> b. Click the Project Members tab.<br> c. Add a user account to Project Members and assign the “admin” role to the account.<br> d. Click the Quota tab and modify the maximum resources.These settings allow for three Avi Controllers (for redundancy), up to 1000 SEs and some other managerial instances, if required.</li> 
</ol> 

### Create Multiple Flavors of Controller Image

Use these steps to create multiple flavors of Avi Vantage, avi_ctrl.small and avi_se.medium.
<ol> 
 <li>In the Horizon dashboard, navigate to Admin &gt; System &gt; Flavors and click Create Flavor.</li> 
 <li>Fill out the forms for flavor avi_ctrl.small. Assign minimal resources to this flavor.</li> 
 <li>Repeat for avi_se.medium but assign more resources to this flavor than to the avi_ctrl.small flavor.</li> 
</ol> 

### Upload Controller Image

<ol> 
 <li>Copy the Avi Vantage Controller QCOW2 image onto your hard drive.</li> 
 <li>In the Horizon dashboard, navigate to Project &gt; Images.</li> 
 <li>Click Create Image and fill out the form. Use at least these resource allocations: 
  <ul> 
   <li>Minimum disk: 64 GB</li> 
   <li>Minimum memory: 24 GB</li> 
  </ul> </li> 
</ol> 

### Create Management Network

A management network is required for communication between the Avi Controller and the SEs. An existing network can be used but a dedicated management network is recommended.
<ol> 
 <li>On the Horizon Dashboard, navigate to Network &gt; Networks.</li> 
 <li>Click Create Network and follow the wizard's instructions. For this example: 
  <ul> 
   <li>Network name: avi-mgmt</li> 
   <li>DHCP: Enabled</li> 
  </ul> </li> 
 <li>Connect the network to your Neutron router.<br> a. Navigate to Network &gt; Routers.<br> b. On the Name column in the router list, click the router to add an interface to the network.<br> c. Click the Interfaces tab; then click Add Interface.</li> 
</ol> 

### Create Security Group

A security group is required to allow the Controller and SEs to exchange management traffic. The group specifies the protocol ports for which traffic will be allowed. For ingress traffic, the group must allow <a href="#mgmt-ports">these</a> ports.

For egress traffic, the group can allow all ports.

Note: The Controller automatically creates a security group for the SEs.

To create a security group (in this example, "Avi-mgmt-sg") to allow management traffic:
<ol> 
 <li>Navigate to Project &gt; Access &amp; Security, and click Create Security Groups.</li> 
 <li>Add rules as shown in the following example, where 192.168.10.0/24 is the management network.</li> 
</ol> 

### Deploy Controller and Assign it a Floating IP

Deploy an Avi Controller instance:

* Flavor: Deploy avi_ctrl.small or bigger.
* Network: use avi-mgmt to attach the Controller to the management network.
* Security group: use avi-mgmt-sg to allow management traffic.
* Enable config-drive. 

To assign a floating IP address to the Controller:

<ol> 
 <li>On the Horizon Dashboard, navigate to Project &gt; Compute &gt; Access &amp; Security.</li> 
 <li>Assign the floating IP address: 
  <ul> 
   <li>If no floating IP address is already available, click Allocate IP to Project.</li> 
   <li>Otherwise, if a floating IP address is already available, associate it with the Avi Controller instance.</li> 
  </ul> </li> 
</ol> 

### Perform Initial Controller Setup

This section shows how to perform initial configuration of the Avi Controller using its deployment wizard.

You can change or customize settings following initial deployment using the Avi Controller’s web interface.
<ol> 
 <li>Configure basic system settings: 
  <ul> 
   <li>Administrator account</li> 
   <li>DNS and NTP server information</li> 
  </ul> 
  <div> 
   <p><img src="img/openstack-install-adminacct-162.png" alt="" width="264" height="" align="left"> <img src="img/openstack-install-dnsntp-262.png" alt="" width="264" height="" align="left" hspace="12" vspace=""></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>Set the infrastructure type to OpenStack:<img class="alignnone size-full wp-image-6067" src="img/ctlr-setup-infra-openstack-162.png" alt="ctlr-setup-infra-openstack-161" width="264" height="419"></li> 
 <li>Enter OpenStack settings: 
  <ul> 
   <li>Tenant user credentials (username, password)</li> 
   <li>IP address of Keystone server</li> 
   <li>Enable (check) the Keystone Auth option.</li> 
  </ul> <p><a href="img/openstack-deploy-openstacklogin-selectkeystone-1.png"><img class="alignnone wp-image-11305" src="img/openstack-deploy-openstacklogin-selectkeystone-1.png" alt="openstack-deploy-openstacklogin-selectkeystone" width="285" height="265"></a></p></li> 
 <li>In the Management Network window, select a tenant. In this deployment, it should be the same tenant into which the Avi Controller is deployed. Choose the management network created previously. <img class="alignnone wp-image-6604" src="img/ctlr-setup-mgmtnetwork-162.png" alt="ctlr-setup-mgmtnetwork-lbass-mgdmode-161" width="264" height="325"></li> 
 <li>In the Keystone Role Mapping window, select a Vantage user role to use as the default user role: <img class="alignnone size-full wp-image-6070" src="img/ctlr-setup-openstack-keystonemapping-162-1.png" alt="ctlr-setup-openstack-keystonemapping-161" width="264" height="288"><br> If a Vantage user logs in with valid Keystone credentials, but with a role that does not have the same name as any of the user roles defined on the Controller, the default role is assigned to the user. To instead disallow access by any user who does not have a role that is defined on the Controller, leave the selection empty (None).</li> 
 <li>In the Virtual Service Placement Settings window, select Import Tenants to import from tenants Keystone and click Next. Then, in the Support Multiple Tenants window, click <strong>Yes</strong>.<img class="alignnone size-full wp-image-6068" src="img/ctlr-setup-vsplacement-openstack-162.png" alt="ctlr-setup-vsplacement-openstack-161" width="264" height="305"></li> 
 <li>In the Tenant Settings window, select the following settings: 
  <ul> 
   <li>Per tenant IP route domain</li> 
   <li>Service Engines are managed within the provider context, shared across tenants</li> 
   <li>Tenant has Read Access to Service Engines</li> 
  </ul> <p><img class="alignnone size-full wp-image-5032" src="img/openstack-deploy-openstackmulttenantsettings.png" alt="openstack-deploy-openstackmulttenantsettings" width="264" height="160"></p></li> 
 <li>Navigate to Infrastructure &gt; Clouds and select Default-Cloud.</li> 
 <li>Click the Service Engine Group tab.</li> 
 <li>Click the edit icon on the right end of Default-Group.</li> 
 <li>Ensure that compact placement is selected and Max Number of Service Engines is high enough to meet the needs of all tenants.<a href="img/Screen-Shot-2016-07-13-at-12.50.49-PM.png"><img class="wp-image-10904 alignnone" src="img/Screen-Shot-2016-07-13-at-12.50.49-PM.png" alt="Screen Shot 2016-07-13 at 12.50.49 PM" width="427" height="321"><br> </a></li> 
 <li>To verify installation, navigate to Infrastructure &gt; Clouds, click Default-Cloud, then click the Status button. If the status is green, installation is a success.<br> <a href="img/openstack-deploy-verify-162.png"><img class="alignnone size-full wp-image-10219" src="img/openstack-deploy-verify-162.png" alt="openstack-deploy-verify-162" width="1438" height="364"></a></li> 
</ol>  

<a name="OpenStack-managed_LBaaS_Mode"></a>

## Deploying OpenStack-managed LBaaS Mode

OpenStack-managed LBaaS mode includes the same deployment steps as Avi-managed LBaaS mode. In addition, installation of the Avi LBaaS driver and Avi extension for Horizon dashboard are required. The tenant administrator accesses and manages Vantage through the Horizon dashboard instead of the Avi Controller web interface.

<img class="alignnone size-full wp-image-5088" src="img/OpenStack-deploy-topo-openstacklbaas.png" alt="OpenStack-deploy-topo-openstacklbaas" width="528" height="249">

### Deployment Process

Deployment of OpenStack-managed LBaaS mode requires the following procedure.
<ol> 
 <li>Deploy Avi-managed LBaaS mode.<br> a. Create a tenant for the Controller and SE.<br> b. (Optional) Create multiple flavors of the Vantage image, with different resource allocations to fit different sizes of user tenant ("avi_ctrl.small" and "avi_se.medium").<br> c. Upload the Avi Controller qcow2 or raw image into the tenant from Glance.<br> d. Create a management network for the Avi Controller and SEs.<br> e. Deploy an Avi Controller instance and assign a floating IP address to it.<br> f. Create a security group to allow Avi management traffic.<br> g. Use the setup wizard to perform initial configuration of the Controller.</li> 
 <li>Install the Avi LBaaS driver.</li> 
 <li>Install the Avi extension for the Horizon dashboard.</li> 
 <li>Install a valid certificate on the Avi Controller.</li> 
</ol> 

Note: Replacing the Controller's self-signed certificate with a valid one allows access to the Avi Controller through the Horizon dashboard. Alternatively, the tenant user or administrator can log onto the Avi Controller's web interface directly, accept the self-signed certificate presented by the Controller. After this, the user or administrator can access the Controller through Horizon.

### Perform Avi-managed LBaaS Mode Depoyment

To begin, perform all the steps in <a href="#Deploying_Avi-managed_LBaaS_Mode">Deploying Avi-managed LBaaS Mode</a>. These steps also are required for OpenStack-managed LBaaS mode.

### Install Avi LBaaS Driver

<ol> 
 <li>In the Vantage web interface, navigate to Infrastructure &gt; Clouds.</li> 
 <li>Click on Default-Cloud, then click on the plugin icon: <a href="img/openstack-lbaas-plugin-install-icon.png"><img class="alignnone size-full wp-image-10223" src="img/openstack-lbaas-plugin-install-icon.png" alt="openstack-lbaas-plugin-install-icon" width="18" height="20"></a></li> 
 <li>Fill in the fields, then click Install.</li> 
</ol> 

<img class="alignnone size-full wp-image-10222" src="img/openstack-install-lbaas-driver-162.png" alt="openstack-install-lbaas-driver-162" width="1438" height="782">

### Install Avi Extension for Horizon Dashboard

This part of the installation requires an account for access to the OpenStack Horizon server. The Git and pip utilities also are required.
<ol> 
 <li>Log into the OpenStack Horizon server, and locally clone the Avi SSL enhancement repository: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>git clone https://github.com/avinetworks/avi-horizon-dashboard</code></pre></li> 
 <li>Switch to the Icehouse, Juno, or Kilo branch: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>cd avi-horizon-dashboard; git checkout icehouse</code></pre></li> 
 <li>Create a pip package: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>python setup.py sdist</code></pre></li> 
 <li>This step creates the following pip package in the dist/ directory: avidashboard-0.2.1.dev39.tar.gz</li> 
 <li>Copy the pip package to the Horizon servers.</li> 
 <li>Install the pip package: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>pip install ./avidashboard-0.2.1.dev39.tar.gz</code></pre></li> 
 <li>Update the Horizon setting files to enable Avi SSL and Analytics tabs on the Horizon dashboard:</li> 
</ol> <ol start="8"> 
 <li>Modify the Horizon settings file to add the Avi dashboard by inserting two highlighted<span style="color: #000000;"> lines </span>in the following snippet. Usually, the Horizon settings file is located here: /usr/share/openstack_dashboard/openstack_dashboard/settings.py.<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">import avidashboard.enabled           
INSTALLED_APPS = list(INSTALLED_APPS)  # Make sure it's mutable
settings.update_dashboards([
  openstack_dashboard.enabled,
  openstack_dashboard.local.enabled,
  avidashboard.enabled                 
], HORIZON_CONFIG, INSTALLED_APPS)</code></pre> 
  <!-- [Format Time: 0.0006 seconds] --> </li> 
</ol> <ol start="9"> 
 <li>Add the IP address of the Avi Controller to the Horizon local_settings file. Usually, this file is located here: /etc/openstack_dashboard/local_settings.py<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">AVI_CONTROLLER = {"RegionA": "regiona.avi-lbaas.example.net", 
                  "RegionB": "regionb.avi-lbaas.example.net", }</code></pre> 
  <!-- [Format Time: 0.0003 seconds] --> </li> 
</ol> <ol start="10"> 
 <li><em>(Optional)</em> Enable the Vantage Analytics Tab by setting the following in your local settings file. (<a href="/docs/16.2/clickjacking-protection/">Click-jacking protection</a> must be <strong>disabled</strong> on the Controller.) <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>AVI_ANALYTICS_TAB_ENABLED = True</code></pre></li> 
</ol> <ol start="11"> 
 <li><em>(Optional)</em> Enable the full LBaaS panel to be the Vantage web interface by setting the following in your local settings file. (<a href="/docs/16.2/clickjacking-protection/">Click-jacking protection</a> must be <strong>disabled</strong> on the Controller.) <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>AVI_LBAAS_FULL_UI = True</code></pre> Note: In Juno's version of Horizon, there was a bug in _tab_group.html template file that caused the title of a tab to be shown in a tab group even when there was only one tab in the tab group. This is fixed in later versions. To get around this issue, replace the _tab_group.html file on the Horizon server with the <a href="https://github.com/openstack/horizon/blob/stable/kilo/horizon/templates/horizon/common/_tab_group.html">Kilo version</a>. The _tab_group.html file is located in one of the following directories: 
  <ul> 
   <li><strong>Red Hat:</strong> /usr/lib/python2.7/site-packages/horizon/templates/horizon/common/_tab_group.html</li> 
   <li><strong>Ubuntu:</strong> /usr/lib/python2.7/dist-packages/horizon/templates/horizon/common/_tab_group.html</li> 
  </ul> </li> 
</ol> <ol start="12"> 
 <li>Restart horizon. For example: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>apache2ctl restart</code></pre> Important! Restarting Horizon is required to complete this procedure.</li> 
</ol> 

### New Horizon Tabs for Vantage

After the Avi extension for Horizon is installed, one or more of the following new tabs appear on the Load Balancers menu of the Horizon dashboard:

* **Certificates:** Allows management of SSL certificates. Through this tab, certificates can be uploaded to the Controller and associated with a VIP for SSL offload.<img class="alignnone size-full wp-image-5025" src="img/openstack-deploy-hortabs-cert.png" alt="openstack-deploy-hortabs-cert" width="1032" height="271">
* **Analytics:** Provides detailed operational and performance information about virtual services and related traffic. <img class="alignnone size-full wp-image-5024" src="img/openstack-deploy-hortabs-analytics.png" alt="openstack-deploy-hortabs-analytics" width="1034" height="327">
* **Full Controller LBaaS panel:** The full LBassThe extension enables access to the entire Controller web interface from within Horizon: <img class="alignnone size-full wp-image-5026" src="img/openstack-deploy-hortabs-uiaccess.png" alt="openstack-deploy-hortabs-uiaccess" width="1031" height="327"> 

Note: The Analytics tab requires replacement of the Controller's self-signed certificate (see below). If the Controller's self-signed certificate is not replaced with a valid one, the Analytics tab does not appear.

### Install Valid Certificate on Avi Controller

This section gives steps for replacing the Controller's self-signed certificate with one signed by a Certificate Authority (CA). The Controller requires a CA-signed certificate to access the Avi Controller through the Horizon dashboard.
<ol> 
 <li>Log into the Avi Controller web interface.</li> 
 <li>Navigate to Templates &gt; Security.</li> 
 <li>Click New on the SSL/TLS Certificates menu.</li> 
 <li>Click Import to import the new certificate and key.</li> 
 <li>After uploading the new certificate and key, configure the Avi Controller to use them: 
  <ol> 
   <li>Navigate to Administration &gt; Settings &gt; Access Settings.</li> 
   <li>Click the edit icon.</li> 
   <li>Select the imported certificate and click Save.</li> 
  </ol> </li> 
</ol> 