---
title: Installing Avi Vantage for OpenStack
layout: default
---
Avi Vantage is a software-based solution that provides real-time analytics as well as elastic application delivery services. Vantage optimizes core web-site functions including SSL termination and load balancing. Vantage also provides access to network analytics, including end-to-end latency information for traffic between end-users and the load-balanced applications.

Vantage's unique controller-based architecture with integration into virtual infrastructure and cloud orchestrators enables true automated horizontal scaling where data plane capacity expands and contracts dynamically based on workload. When deployed into an OpenStack cloud, Avi Vantage performs as a fully distributed, virtualized system consisting of the Avi Controller and Avi Service Engines (SEs), each running as a separate virtual machine (VM).

* **Avi Controller:** VM that acts as a single point of control and management with OpenStack and is integrated with Nova, Keystone, Neutron, and Glance to allow seamless multi-tenancy support for scalable performance. Based on configuration, the Controller places new services on existing VMs if there is room, or spins up a new VM if needed. Management access and analytics are provided through a web-based interface and REST-based API. The Controller manages the life cycles of the SEs by creating, controlling, and eventually deleting them. The Controller stores and manages all policies related to services and management. The Controller also provides a central point of contact for other cloud infrastructures, and can manage resources in multiple infrastructures simultaneously. For example, the Controller can be configured to communicate with both an OpenStack controller and a VMware vCenter server, to manage resources in each type of cloud.
* **Avi Service Engine (SE):** VM that receives the end-user traffic and provides application delivery services, while also collecting real-time end-to-end metrics for traffic between end-users and applications. The Controller creates an SE VM, plumbs it into a network, and provisions it with a service policy. The service policy is required to deploy a Virtual Service (VS), which consists of IP address and TCP/UDP port number that together represent a load balancing service. 

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
* **Avi-managed LBaaS mode:** The Avi Controller and SEs are installed in separate tenants. The Controller has administrator privileges for the cloud and can manage SEs that are in different tenants. A tenant administrator can log onto the Avi Controller to manage the infrastructure resources within her or his own tenant but cannot access the resources within other tenants. The tenant administrator can configure and manage load balancing services through the Avi Controller web interface or the through the Avi REST API.
* **OpenStack-managed LBaaS mode:** Similar to Avi-managed LBaaS mode, except the tenant administrator configures and manages load-balancing services are through OpenStack's Neutron service and Horizon dashboard. The Controller web interface or Avi API are not used. (This mode also requires installation of an LBaaS driver and SSL extension from Avi.) 

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
<td>12 GB</td>
<td>4</td>
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

Add 1GB for each additional vCPU.

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
<td>15.3</td>
</tr>
<tr>   
<td>OpenStack (and Neutron service)</td>
<td>One of the following: Havana, Icehouse, Juno, or Kilo</td>
</tr>
<tr>   
<td>Neutron extension for allowed-address-pair</td>
<td></td>
</tr>
<tr>   
<td>Avi LBaaS driver</td>
<td>15.3</td>
</tr>
<tr>   
<td>Avi SSL extension for OpenStack Horizon</td>
<td>15.3</td>
</tr>
</tbody>
</table>  

The Avi Vantage image is available as a Qcow2 or raw image of the Controller and SEs. The SE software is embedded in the Controller image and does require separate installation.

The Avi LBaaS driver is required only for OpenStack-managed LBaaS mode. The SSL extension for OpenStack Horizon is required only for OpenStack-managed LBaaS mode. (This driver adds tabs to Horizon for accessing the Controller.)

Note: Installation of Avi Vantage into Devstack is supported only if the DevStack/Nova-launched Virtual Machine (VMs) can run in Kernel-based Virtual Machine (KVM) mode, as opposed to Quick Emulator (QEMU) mode. Please see the <a href="http://docs.openstack.org/developer/devstack/guides/devstack-with-nested-kvm.html">DevStack KVM Guide</a> for information.

## Importing User Accounts from Keystone

Using the Avi API, user roles can be exported from Keystone into the Avi Controller and directly mapped to role names in the Controller. The accounts do not need to be recreated on the Controller. Here is an example:

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

<pre><code class="language-lua"></code></pre> 

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
 <li>Add the Avi Controller qcow2 or raw image into the tenant from Glance.</li> 
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

* For ingress traffic, the group must allow <a href="/2016/02/02/protocol-ports-used-by-vantage-for-management-communication/">these </a>ports.
* For egress traffic, the group can allow all ports. 

Note: The Controller automatically creates a security group for the SEs.

To create a security group (in this example, "Avi-mgmt-sg") to allow management traffic:
<ol> 
 <li>On the Horizon Dashboard, navigate to Project &gt; Access &amp; Security, and click Create Security Groups.</li> 
 <li>Add rules as shown in the following example, where 192.168.10.0/24 is the management network. (figure)</li> 
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

Note: While the system is booting up, a blank web page or 503 status code may appear. In this case, wait for 5-10 minutes, then follow the instructions for the setup wizard.
<ol> 
 <li>Configure basic system settings: 
  <ul> 
   <li>Administrator account</li> 
   <li>DNS and NTP server information</li> 
  </ul> 
  <div> 
   <p><img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-admin.png" alt="" align="left" hspace="0&quot;" vspace="6"> <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-dnsntp.png" alt="" align="left" hspace="12" vspace="6"></p> 
   <p style="clear: both"> </p> 
  </div> </li> 
 <li>Set the infrustructure type to OpenStack:<a href="img/openstack-deploy-orchestratorselection.png"><img class="alignnone size-full wp-image-5033" src="img/openstack-deploy-orchestratorselection.png" alt="openstack-deploy-orchestratorselection" width="264" height="288"></a></li> 
 <li>Enter OpenStack settings: 
  <ul> 
   <li>Tenant user credentials (username, password)</li> 
   <li>IP address of Keystone server</li> 
   <li>Keystone Auth enabled</li> 
  </ul> <p><a href="img/openstack-deploy-openstacklogin-selectkeystone.png"><img src="img/openstack-deploy-openstacklogin-selectkeystone.png" alt="openstack-deploy-openstacklogin-selectkeystone" width="264" height="246" class="alignnone size-full wp-image-8512"></a></p></li> 
 <li>In the Virtual Service Placement Settings window, deselect all options and click Next. Then, in the Support Multiple Tenants window, click No.<a href="img/openstack-deploy-vsplacement.png"><img class="alignnone size-full wp-image-5037" src="img/openstack-deploy-vsplacement.png" alt="openstack-deploy-vsplacement" width="264" height="221"></a></li> 
</ol> 

## Deploying Avi-managed LBaaS Mode

This section provides the steps for deploying Vantage into an OpenStack cloud in single-tenant mode. In single-tenant mode, the Avi Controller and SEs are installed in the same tenant, and have member privileges for that tenant.

<a href="img/OpenStack-deploy-topo-avilbaas.png"><img class="alignnone size-full wp-image-5087" src="img/OpenStack-deploy-topo-avilbaas.png" alt="OpenStack-deploy-topo-avilbaas" width="528" height="252"></a>

Avi-managed LBaaS mode provides tenant users with the advantages of Avi Vantage, without the need for them to perform deployment or maintenance of Vantage. Instead, the cloud administrator deploys and manages Vantage. The Controller and SEs in the administrative tenant are shared by other tenants. Users of those tenants are able to secure and optimize their applications using the Vantage resources that reside in the administrative tenant.

Note: While using an existing tenant instead of creating a new one also is supported, creating a new tenant is recommended for easy maintenance.

### Deployment Process

Deployment of Avi-managed LBaaS mode requires the following procedure.
<ol> 
 <li>Create a tenant for the Controller and SE.</li> 
 <li>(Optional) Create multiple flavors of the Vantage image, with different resource allocations to fit different sizes of user tenant. (For example: "avi_ctrl.small" and "avi_se.medium".)</li> 
 <li>Upload the Avi Controller qcow2 or raw image into the tenant from Glance.</li> 
 <li>Create a management network for the Avi Controller and SEs.</li> 
 <li>Create a security group to allow Avi management traffic.</li> 
 <li>Deploy an Avi Controller instance and assign a floating IP address to it.</li> 
 <li>Create a security group to allow Avi management traffic.</li> 
 <li>Use the setup wizard to perform initial configuration of the Controller.</li> 
</ol> 

Detailed steps are provided below.

### Create a Tenant for the Controller and SEs

<ol> 
 <li>Log into the OpenStack Horizon dashboard with an account that has cloud administrator privileges.</li> 
 <li>Log into the OpenStack Horizon dashboard with an account that has cloud administrator privileges.</li> 
 <li>Navigate to Identity &gt; Projects.</li> 
 <li>Click New Project and follow the wizard's instructions.</li> 
 <li>Follow the instructions of the tenant creation wizard. For Avi Vantage deployment, use the following settings:a. Enter a project name (ex: "avi-tenant”).b. Click the Project Members tab.c. Add a user account to Project Members and assign the “admin” role to the account.d. Click the Quota tab and modify the maximum resources. These settings allow for three Avi Controllers (for redundancy), up to 1000 SEs and some other managerial instances if required.</li> 
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
 <li>Copy the Avi Vantage Controller qcow2 image onto your hard drive.</li> 
 <li>In the Horizon dashboard, navigate to Project &gt; Images.</li> 
 <li>Click Create Image and fill out the form. Use at least these resource allocations: 
  <ul> 
   <li>Minimum disk: 64GB</li> 
   <li>Minimum memory: 12GB</li> 
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
 <li>Connect the network to your neutron router.a. Navigate to Network &gt; Routers.b. On the Name column in the router list, click the router to add an interface to the network.c. Click the Interfaces tab, then click Add Interface.</li> 
</ol> 

### Create Security Group

A security group is required to allow the Controller and SEs to exchange management traffic. The group specifies the protocol ports for which traffic will be allowed. For ingress traffic, the group must allow (link: these) ports.

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
   <p><img src="/wp-content/uploads/2016/01/VMware-deploy-WriteAccessmode-Ctlr-setup-admin.png" alt="" align="left" hspace="0&quot;" vspace="6"> <img src="/wp-content/uploads/2016/01/VMware-deploy-WriteAccessmode-Ctlr-setup-dnsntp.png" alt="" align="left" hspace="12" vspace="6"></p> 
   <p style="clear: both"> </p> 
  </div> </li> 
 <li>Set the infrustructure type to OpenStack:<a href="img/openstack-deploy-orchestratorselection.png"><img class="alignnone size-full wp-image-5033" src="/wp-content/uploads/2016/02/openstack-deploy-orchestratorselection.png" alt="openstack-deploy-orchestratorselection" width="264" height="288"></a></li> 
 <li>Enter OpenStack settings: 
  <ul> 
   <li>Tenant user credentials (username, password)</li> 
   <li>IP address of Keystone server</li> 
   <li>Keystone Auth enabled</li> 
  </ul> <p><a href="img/openstack-deploy-openstacklogin-selectkeystone.png"><img src="/wp-content/uploads/2016/02/openstack-deploy-openstacklogin-selectkeystone.png" alt="openstack-deploy-openstacklogin-selectkeystone" width="264" height="246" class="alignnone size-full wp-image-8512"></a></p></li> 
 <li>In the Virtual Service Placement Settings window, deselect all options and click Next. Then, in the Support Multiple Tenants window, click <strong>Yes</strong>.<a href="img/openstack-deploy-vsplacement.png"><img class="alignnone size-full wp-image-5037" src="/wp-content/uploads/2016/02/openstack-deploy-vsplacement.png" alt="openstack-deploy-vsplacement" width="264" height="221"></a></li> 
 <li>In the Tenant Settings window, select the following settings: 
  <ul> 
   <li>Per tenant IP route domain</li> 
   <li>Service Engines are managed within the provider context, shared across tenants</li> 
   <li>Tenant has Read Access to Service Engines</li> 
  </ul> <p><a href="img/openstack-deploy-openstackmulttenantsettings.png"><img class="alignnone size-full wp-image-5032" src="img/openstack-deploy-openstackmulttenantsettings.png" alt="openstack-deploy-openstackmulttenantsettings" width="264" height="160"></a></p></li> 
 <li>Navigate to Infrastructure &gt; Clouds and select Default-Cloud.</li> 
 <li>Click the Service Engine Group tab.</li> 
 <li>Click the edit icon on the right end of Default-Group.</li> 
 <li>Ensure that Compactor is selected and Max Number of Service Engines is high enough to meet the needs of all tenants.<a href="img/openstack-deploy-vscompactor.png"><img class="alignnone size-full wp-image-5036" src="img/openstack-deploy-vscompactor.png" alt="openstack-deploy-vscompactor" width="432" height="200"></a></li> 
</ol> 

## Deploying OpenStack-managed LBaaS Mode

OpenStack-managed LBaaS mode includes the same deployment steps as Avi-managed LBaaS mode. In addition, installation of the Avi LBaaS driver and Avi extension for Horizon dashboard are required. The tenant administrator accesses and manages Vantage through the Horizon dashboard instead of the Avi Controller web interface.

<a href="img/OpenStack-deploy-topo-openstacklbaas.png"><img class="alignnone size-full wp-image-5088" src="img/OpenStack-deploy-topo-openstacklbaas.png" alt="OpenStack-deploy-topo-openstacklbaas" width="528" height="249"></a>

### Deployment Process

Deployment of OpenStack-managed LBaaS mode requires the following procedure. 1. Deploy Avi-managed LBaaS mode. a. Create a tenant for the Controller and SE. b. (Optional) Create multiple flavors of the Vantage image, with different resource allocations to fit different sizes of user tenant ("avi_ctrl.small" and "avi_se.medium"). c. Upload the Avi Controller qcow2 or raw image into the tenant from Glance. d. Create a management network for the Avi Controller and SEs. e. Deploy an Avi Controller instance and assign a floating IP address to it. f. Create a security group to allow Avi management traffic. g. Use the setup wizard to perform initial configuration of the Controller.
<ol> 
 <li>Install the Avi LBaaS driver.</li> 
 <li>Install the Avi extension for the Horizon dashboard.</li> 
 <li>Install a valid certificate on the Avi Controller.</li> 
</ol> 

Note: Replacing the Controller's self-signed certificate with a valid one allows access to the Avi Controller through the Horizon dashboard. Alternatively, the tenant user or administrator can log onto the Avi Controller's web interface directly, accept the self-signed certificate presented by the Controller. After this, the user or administrator can access the Controller through Horizon.

### Perform Avi-managed LBaaS Mode Depoyment

To begin, perform all the steps in Deploying Avi-managed LBaaS Mode (link). These steps also are required for OpenStack-managed LBaaS mode.

### Install Avi LBaaS Driver

Avi Networks provides a script for installing or upgrading the LBaaS plugin driver. The script makes the necessary OpenStack configuration changes automatically. Download the Avi LBaaS driver installation package (avi_openstack_package.tar.gz) from the Avi Networks portal website (https://portal.avinetworks.com).

Note: An account with root privileges for the Neutron API server is required. This account is different from the account used by the Controller to access the OpenStack infrastructure.
<ol> 
 <li>Copy the package onto the OpenStack Neutron API host.</li> 
 <li>Log into the Neutron API server.</li> 
 <li>On the OpenStack Neutron API server, back up neutron.conf.</li> 
 <li>Unzip and untar the driver package: <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>tar -xzf avi_openstack_package.tar.gz</code></pre></li> 
 <li>Run the Avi LBaaS installation script.In the following example, 10.114.214.250 is the IP address for the Avi Controller cluster. The login credentials for the Controller are admin, avinetworks. Make sure to replace the IP address in the example with the cluster IP address.</li> 
</ol> 


<pre><code class="language-lua">cd ./openstack_lbplugin
./install.sh --aname avi_adc --aip 10.114.214.250 --auser admin --apass avinetworks
  --&gt; Install SeLinux module 'avi_lbaas'? (y/n) n
  --&gt; Configure Neutron Server with Avi LBaaS provider 'avi_adc' with driver 'avi'? (y/n) y
  08/28/2014 23:27:55 INFO: Neutron Avi LBaaS provider 'avi_adc' configure...OK
  08/28/2014 23:27:56 INFO: Neutron Avi LBaaS driver 'avi' setup...OK
  08/28/2014 23:28:01 INFO: neutron-server restart...OK
  08/28/2014 23:28:01 INFO: Neutron Avi LBaaS configuration setup...OK</code></pre>  

### Install Avi Extension for Horizon Dashboard

For this part of the installation, Avi Networks' open source code for extending the Horizon Dashboard is required. Navigate to the Github <a href="https://github.com/avinetworks/avi-horizon-dashboard/">avi-horizon-dashboard</a> page.

**Notes:**

* An account for access to the OpenStack Horizon server is required.
* The **pip** command must be available on the machines where the Horizon server is running. (To install on Ubuntu: **apt-get install python-pip**. To install on Red Hat Linux: **yum install python-pip**.)
* Starting with Vantage version 15.3, clickjacking protection is available and is enabled by default on the Controller. Unfortunately, the Horizon integration with iframes does not work with the clickjacking protection in place. The link above also has instructions for disabling clickjacking protection using the Vantage CLI. 

### New Horizon Tabs for Vantage

After the Avi extension for Horizon is installed, one or more of the following new tabs appear on the Load Balancers menu of the Horizon dashboard:

* **Certificates:** Allows management of SSL certificates. Through this tab, certificates can be uploaded to the Controller and associated with a VIP for SSL offload.<a href="img/openstack-deploy-hortabs-cert.png"><img class="alignnone size-full wp-image-5025" src="img/openstack-deploy-hortabs-cert.png" alt="openstack-deploy-hortabs-cert" width="1032" height="271"></a>
* **Analytics:** Provides detailed operational and performance information about virtual services and related traffic.<a href="img/openstack-deploy-hortabs-analytics.png"><img class="alignnone size-full wp-image-5024" src="img/openstack-deploy-hortabs-analytics.png" alt="openstack-deploy-hortabs-analytics" width="1034" height="327"></a> 

The extension also enables access to the entire Controller web interface from within Horizon:

<a href="img/openstack-deploy-hortabs-uiaccess.png"><img class="alignnone size-full wp-image-5026" src="img/openstack-deploy-hortabs-uiaccess.png" alt="openstack-deploy-hortabs-uiaccess" width="1031" height="327"></a>

Note: The Analytics tab requires replacement of the Controller's self-signed certificate (see below). If the Controller's self-signed certificate is not replaced with a valid one, the Analytics tab does not appear.

### Install Valid Certificate on Avi Controller

This section gives steps for replacing the Controller's self-signed certificate with one signed by a Certificate Authority (CA). The Controller requires a CA-signed certificate to access the Avi Controller through the Horizon dashboard.
<ol> 
 <li>Log into the Avi Controller web interface.</li> 
 <li>Navigate to Templates &gt; Security.</li> 
 <li>Click New on the SSL/TLS Certificates menu.</li> 
 <li>Click Import to import the new certificate and key.</li> 
 <li>After uploading the new certificate and key, configure the Avi Controller to use them:a. Navigate to Administration &gt; Settings &gt; Access Settings.b. Click the edit icon.c. Select the imported certificate and click Save.</li> 
</ol> 