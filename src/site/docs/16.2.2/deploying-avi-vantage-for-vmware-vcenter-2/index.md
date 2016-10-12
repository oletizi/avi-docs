---
title: Installing Avi Vantage for VMware vCenter
layout: default
---
This guide describes how to integrate Avi Vantage into a VMware vCenter cloud.

Avi Vantage is a software-based solution that provides real-time analytics as well as elastic application delivery services. Vantage optimizes core web-site functions including SSL termination and load balancing.

**Notes:**

* **Deployment in *write access mode* is recommended. It's the quickest and easiest way to deploy.**
* **After completing the deployment process, go <a href="configuring-a-virtual-service-for-vmware-basic">here</a> to create virtual services.** 

## How Avi Vantage Integrates into vCenter

Avi Vantage runs on virtual machines (VMs) managed by VMware vCenter. When deployed into a vCenter-managed VMware cloud, Avi Vantage performs as a fully distributed, virtualized system consisting of the Avi Controller and Avi Service Engines (SEs), each running as a VM.

<a href="img/vmware-deploy1.png"><img class="alignnone size-full wp-image-3731" src="img/vmware-deploy1.png" alt="vmware-deploy1" width="432" height="300"></a>

Avi Vantage is deployed and runs as the following main components:

* **Avi Controller**
* **Avi Service Engine (SE)** 

### Avi Controller

The Avi Controller provides a single point of control and management for the cloud. The Controller runs on a VM and can be managed using its web interface, CLI, or REST API.

The Controller stores and manages all policies related to services and management. Through vCenter, the Controller discovers VMs, data centers, networks, and hosts. Based on this auto-discovered information, virtual services can quickly be added using the web interface. To deploy a virtual service, the Controller automatically selects an ESX server, spins up an Avi SE (described below), and connects it to the correct networks (port groups).

The Controller also provides a management center for other cloud infrastructures, with the ability to manage resources in multiple infrastructures simultaneously. For example, the Controller can be configured to communicate with both a VMware vCenter server and an OpenStack controller, to manage resources in each type of cloud.

The Controller can be deployed as a single VM or as a high availability cluster of 3 Controller instances, each running on a separate VM.

### Service Engine

Avi SEs provide the application delivery services to end-user traffic, and also collect real-time end-to-end metrics for traffic between end-users and applications.

Each SE runs on its own VM. The Controller manages the lifecycles of Avi SEs by creating, controlling, and deleting them. To deploy an SE, the Controller creates an SE VM, plumbs it into a network, and provisions it with service policies as required to deploy virtual services.

## Deployment Prequisites

### Virtual Machine Requirements

The following table lists the minimum requirements for the VMs on which the Avi Controller and SEs are installed.
<table class="myTable table table-bordered table-hover">  
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

Add 1 GB for each additional SE vCPU.

For added resiliency and redundancy, the Controller can be deployed as a 3-node cluster. In this case, a separate VM is needed for each of the 3 Controller nodes. The requirements are the same for each node.

### Software Requirements

The following table lists the software requirements.

<table class="myTable table table-bordered table-hover">  
<tbody>    
<tr>   
<th>Component
</th>
<th>Version
</th>
</tr>
<tr>   
<td>Avi Controller</td>
<td>15.3</td>
</tr>
<tr>   
<td>VMware vCenter</td>
<td>5.1, 5.5, or 6.0</td>
</tr>
</tbody>
</table> 

The Avi Controller OVA contains the images files for the Avi Controller and Avi SEs.

VMware vCenter is required for write access mode deployment or read access mode deployment.

### IP Address Requirements

The Avi Controller requires one management IP address. Each SE requires one management IP address, a virtual service IP address, and an IP address that faces the pool network.

DHCP rather than static assignment is recommended for allocating the SE management and the pool network interface IP addresses. The virtual service IP address is specified manually during creation of a load balancing policy.

Traffic whose destination is the VIP address is load balanced by Vantage across the members (servers) within the pool.

### vCenter Account Requirement

During initial Controller setup, a vCenter account must be entered to allow the Controller to communicate with vCenter. The vCcenter account must have privileges to create new folders in vCenter. This is required for virtual service creation.

## Deployment Modes

Avi Vantage can be deployed into a VMware cloud in one of the following modes. Each mode differs depending on the level of vCenter access provided to Vantage. Each access level determines the amount of automation and analytics Vantage is able to provide, and accordingly has different requirements for deployment.

* **Write access mode:** Avi Controller automatically spins up Avi SEs as needed. This mode requires a vCenter user account with write privileges.
* **Read access mode:** Controller accesses vCenter to discover information about networks and VMs. SEs must be spin up and connected to networks by the Vantage user (probably you, if you are using this doucment to install Vantage). This mode requires a vCenter user account with read privileges.
* **No access mode:** Avi Controller does not access the vCenter. The Vantage user spins up an Avi SE, discovers networks, and connects the SE to one of the networks. 

### Deployment Example: Write access with DHCP

The following example shows the recommended deployment topology: write access mode with DHCP.

<a href="img/vmware-deploy2.png"><img class="alignnone size-medium wp-image-3732" src="img/vmware-deploy2.png" alt="vmware-deploy2" width="528" height="360"></a>

The Avi Controller requires one management IP address. The Avi SE requires one management IP address, a virtual service IP address, and a pool network facing IP address. DHCP is recommended for allocation of the SE management IP addresses and the pool network interface IP addresses. The virtual service IP address is specified manually as part of creating a load balancing policy. End-user requests are received by the virtual service IP and is load balanced across the members of the pool.

----

## Deploying in Write Access Mode

This section provides the steps for deploying Avi Vantage in write access mode.

### Deployment Steps

Deployment of Vantage into a vCenter-managed VMware cloud in write access mode requires the following procedure. Detailed steps for each part of the procedure are provided.
<ol> 
 <li>Deploy the Controller OVA file.</li> 
 <li>Perform initial Controller setup.</li> 
 <li>If using static IP assignment, configure the IP address pools for the networks where the SEs will run.</li> 
 <li>Verify installation.</li> 
</ol> 

### Deploy Controller OVA

Through a vCenter client, log into the Center server. Using the vCenter client, deploy the Avi Controller OVA file.
<ol> 
 <li>Click File on the top menu and choose Deploy OVF Template.</li> 
 <li>Follow the instructions of the Deploy OVA Template wizard. 
  <ul> 
   <li>Choose Thick Provision Lazy Zeroed for disk format.</li> 
   <li>Choose a port group for Destination Networks in Network Mapping. This port group will be used by the Avi Controller to communicate with vCenter.</li> 
   <li>Specify the management IP address and default gateway. Or, leave them empty if using DHCP.</li> 
  </ul> </li> 
 <li>Power on the VM.</li> 
</ol> 

Note: Use a static IP address for Avi Controller management unless your DHCP server can keep the assigned IP address permanently.

### Perform Initial Setup of Controller

This section shows how to perform initial configuration of the Avi Controller using its deployment wizard.

You can change or customize settings following initial deployment using the Avi Controller’s web interface.

To start, use a browser to navigate to the Avi Controller.

Note: While the system is booting up, a blank web page or 503 status code may appear. In this case, wait for 5-10 minutes, then follow the instructions for the the setup wizard.
<ol> 
 <li>Configure basic system settings: 
  <ul> 
   <li>Administrator account</li> 
   <li>DNS and NTP server information</li> 
  </ul> 
  <div> 
   <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-admin.png" alt="" align="left" hspace="0&quot;" vspace="6"> 
   <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-dnsntp.png" alt="" align="left" hspace="12" vspace="6"> 
   <p></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>Set the infrustructure type to VMware: <p><img title="Image call" src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-infra.png" alt="VMware-deploy-Ctlr-setup-infra2"></p></li> 
 <li>Enter vCenter settings: 
  <ul> 
   <li>vCenter IP address</li> 
   <li>vCenter credentials (The vCenter account must have privileges to create new folders in vCenter. This is required for virtual service creation.)</li> 
   <li>Permissions (Select <strong>Write</strong>.)</li> 
   <li>Integration with Cisco APIC (Leave unselected/disabled.)</li> 
   <li>Data center (where Vantage will be deployed)</li> 
   <li>IP allocation method for the networks where the pools and virtual services will be located</li> 
  </ul> 
  <div> 
   <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-vcenterlogin.png" alt="" align="left" vspace="6"> 
   <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-selectdatacenter.png" alt="" align="left" hspace="12" vspace="6"> 
   <p></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>Configure SE settings: 
  <ul> 
   <li>Management network</li> 
   <li>IP allocation method for management network</li> 
   <li>Support Multiple Tenants (Select <strong>No</strong>.)</li> 
  </ul> <p>One of the SE's 10 vNICs is be connected to the management network. The other vNICs are data vNICs. For the IP allocation method, if static address assignment is used, enter a subnet address and a range of host addresses within the subnet. Vantage assigns addresses from this range to the SE data interfaces.</p> <p><img title="Image call" src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-multtenantsbox.png" alt="VMware-deploy-Ctlr-setup-multtenants"></p></li> 
 <li>To verify installation, navigate to Infrastructure &gt; Clouds, click Default-Clouds, then click the Status button. If the status is green, installation is a success. <p><a href="img/vmware-deploy3-6.png"><img class="alignnone size-full wp-image-3893" src="img/vmware-deploy3-6.png" alt="vmware-deploy3" width="859" height="398"></a></p> <p>If the management and pool networks use DHCP, the deployment procedure is complete. If static address allocation is used, an additional set of steps is required: <a href="#staticIPass">configure IP address pools for networks</a>.</p></li> 
</ol> 

----

## Deploying in Read / No Access Mode

This section provides the steps for deploying Avi Vantage in read access mode or no access mode. In these modes:

* The Avi Controller does not access vCenter and does not deploy SEs or connect them to networks. Instead, SE deployment is performed by the Avi Vantage user.
* Read access mode can provide analytics. No access mode does not provide analytics. 

### Deployment Process

Deployment of Vantage into a vCenter-managed VMware cloud in read or no access mode requires the following procedure.
<ol> 
 <li>Deploy the Controller OVA.</li> 
 <li>Perform initial Controller setup.</li> 
 <li>Download the SE OVA file from the Controller.</li> 
 <li>Deploy the SE OVA file. (This step is required twice, to create 2 SEs. At least two instances of SE are required for Active-Standby High Availability.)</li> 
 <li>Connect the Avi SEs to port groups to allow them to access the management network, virtual service network, and server network.</li> 
 <li>Verify SE discovery.</li> 
 <li>Verify the discovery of VMware resources.</li> 
</ol> 

### Deploy Controller OVA

Through a vCenter client, log into the vCenter server. Then use the vCenter client to deploy the Avi Controller OVA file.
<ol> 
 <li>In vCenter, click File on the top menu and choose Deploy OVF Template.</li> 
 <li>Follow the instructions of the Deploy OVA Template wizard. 
  <ul> 
   <li>Choose Thick Provision Lazy Zeroed for disk format.</li> 
   <li>Choose a port group for Destination Networks in Network Mapping. This port group will be used by the Avi Controller to communicate with vCenter.</li> 
   <li>Specify the management IP address and default gateway. Or, leave them empty if using DHCP.</li> 
  </ul> </li> 
 <li>Power on the VM.</li> 
</ol> 

Note: Use a static IP address for Avi Controller management unless your DHCP server can keep the assigned IP address permanently.

### Perform Initial Setup of Controller

This section shows how to perform initial configuration of the Avi Controller using its deployment wizard.

You can change or customize settings following initial deployment using the Avi Controller’s web interface.

To start, use a browser to navigate to the Avi Controller.

Note: While the system is booting up, a blank web page or 503 status code may appear. In this case, wait for 5-10 minutes, then follow the instructions for the the setup wizard.
<ol> 
 <li>Configure basic system settings: 
  <ul> 
   <li>Administrator account</li> 
   <li>DNS and NTP server information</li> 
  </ul> 
  <div> 
   <img src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-admin.png" alt="" align="left" vspace="6"> 
   <img src="/wp-content/uploads/2016/01/VMware-deploy-WriteAccessmode-Ctlr-setup-dnsntp.png" alt="" align="left" hspace="12" vspace="6"> 
   <p></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>Set the infrastructure type: 
  <ul> 
   <li>No access mode: select No Orchestrator to finish the wizard. No more information is required. </li> 
   <li>Read access mode: select VMware and continue with this procedure. </li> 
  </ul> <p><img title="Image call" src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-infra.png" alt="VMware-deploy-Ctlr-setup-infra"></p></li> 
 <li>Enter vCenter settings (read access mode): 
  <ul> 
   <li>vCenter IP address</li> 
   <li>vCenter credentials (username and password)</li> 
   <li>Permissions (Select <strong>Read</strong>.)</li> 
   <li>Integration with Cisco APIC (leave unselected/disabled)</li> 
   <li>Data center (where Vantage will be deployed)</li> 
   <li>IP allocation method for the networks where the pools and virtual services will be located</li> 
  </ul> 
  <div> 
   <img src="/wp-content/uploads/2016/01/VMware-deploy-WriteAccessmode-Ctlr-setup-vcenterlogin.png" alt="" align="left" vspace="6"> 
   <img src="/wp-content/uploads/2016/01/VMware-deploy-WriteAccessmode-Ctlr-setup-selectdatacenter.png" alt="" align="left" hspace="12" vspace="6"> 
   <p></p> 
   <p style="clear: both;"> </p> 
  </div> </li> 
 <li>To verify discovery by the Controller of all vCenter resources, navigate to Administration &gt; Settings &gt; Infrastructure. The discovery status should be 100% complete. (See example above.)</li> 
</ol> 

If the management and pool networks use DHCP, the deployment procedure is complete. If static address allocation is used, an additional set of steps is required: <a href="#staticIPass">configure IP address pools for networks</a>.

<a name="downloadova"></a>

### Install Service Engine

Deployment in read access mode or no access mode requires the user to download and deploy the SE to install it. *(SE installation in write access mode is automatic.)*

### Download SE OVA

The OV image file for SEs is embedded in the Controller image. The SE OV image can be downloaded through the web interface or the API. To download:

* Using the Web Interface: Navigate to Infrastructure > Cloud, click the button, and select se.ova to download the SE ova. <a href="img/VMware-deploy-SE-OVA-download-10.png"><img class="alignnone size-full wp-image-3894" src="img/VMware-deploy-SE-OVA-download-10.png" alt="VMware-deploy-SE-OVA-download" width="860" height="271"></a>
* Using the API: Navigate to <a href="http://avi-ctlr-ip/api/fileservice/seova">http://avi-ctlr-ip/api/fileservice/seova</a>http://avi-ctlr-ip/api/fileservice/seova, where avi-ctlr-ip is the IP address of the Controller. 

<a name="deployloadova"></a>

### Deploy SE OVA

After you download the SE OVA from the Controller, use the following steps to deploy it.

Note: By default, deployment requires a minimum of two SEs. One SE actively receives application traffic while the other SE remains in a standby state, ready to take over if the active SE fails.
<ol> 
 <li>In vCenter, click File on the top menu and choose Deploy OVF Template.</li> 
 <li>Follow the instructions of the Deploy OVA Template wizard. 
  <ul> 
   <li>Choose Thick Provision Lazy Zeroed for disk format.</li> 
   <li>Choose the port groups for the SE network connections. The SE has 10 vNICs. Connect the first vNIC to the management network. Connect the other vNICs to the data networks.</li> 
   <li>For the management connection, choose a port group that will allow the SEs to communicate with the Controller. An SE can be connected to up to 9 data networks. For each Source Network, choose a port group in Destination Networks where you plan to have virtual services and pools. The Controller expects the SE’s data vNICs to be connected to virtual service and pool networks.</li> 
   <li>Specify the Controller IP address.</li> 
   <li>Enter the Controller’s authentication token key: 
    <ol> 
     <li>Log into the Avi Controller.</li> 
     <li>Navigate to Infrastructure &gt; Clouds.</li> 
     <li>Click on <span style="display: inline-block;"><img class="alignnone size-full wp-image-3558" src="img/security-key-icon.png" alt="edit-icon" width="13" height="12"></span> to view the authentication token key.</li> 
     <li>Copy the authentication token. <img title="Image call" src="img/security-copy-token.png" alt="security-copy-token"></li> 
     <li>Paste the authentication token key into the Authentication Token for Avi field.</li> 
     <li>Specify the management IP address and default gateway. Or, leave them empty if using DHCP. <a href="img/vmware-deploy7.png"><img class="alignnone size-medium wp-image-3739" src="img/vmware-deploy7.png" alt="vmware-deploy7" width="528" height="499"></a></li> 
    </ol> </li> 
  </ul> <p style="clear: both;"> </p></li> 
 <li>On the VM Properties menu, connect the SE data vNICs to the port groups needed to reach a virtual service network and pool network. <p>Note: Leave any unused vNICs disconnected.</p></li> 
 <li><em>(no access mode only)</em> Write down the following information: 
  <ul> 
   <li>MAC addresses of the vNICs</li> 
   <li>IP subnet of the port group</li> 
  </ul> <p>This information will be used to identify the Avi SE interfaces because the Controller does not have access to vCenter and therefore cannot associate the SE’s interface names with VMware’s interface names.</p> <p><a href="img/vmware-deploy9.png"><img class="alignnone size-medium wp-image-3741" src="img/vmware-deploy9.png" alt="vmware-deploy9" width="528" height="466"></a></p> <p>Note: This step is reqired only for no access mode, not for read access mode.</p></li> 
 <li>Power on the VM.</li> 
</ol> 

Repeat to deploy at least one more SE. By default, 2 Avi SEs are required for deployment of a virtual service. One SE will take traffic actively while the other SE acts as a standby, ready to take over if the active SE fails.

If the management and pool networks use DHCP, the deployment procedure is complete. If static address allocation is used, an additional set of steps is required: <a href="#staticIPass">configure IP address pools for networks</a>.

Note: The Avi SE must be connected to the management network, virtual service networks, and pool (backend server) networks.

<a name="SEint"></a>

### *(no access mode only)* Configure SE Interfaces

Each SE requires an IP address in each of the virtual service networks and server networks. If deploying in write access mode or read access mode, this process is automatic. If deploying in no access mode, the Avi Vantage user must perform the following steps:
<ol> 
 <li>Navigate to Infrastructure &gt; Service Engines, and select the SE that was deployed in the previous section.</li> 
 <li>Find the interface that matches the list of MAC addresses written down during SE deployment.</li> 
 <li>If DHCP is available for address assignment, enable the DHCP option for the interface. Otherwise, <a href="#staticIPass">provide a static IP address</a>.</li> 
</ol> 

Repeat for each connected interface, for virtual service and server networks.

<a href="img/vmware-deploy10.png"><img class="alignnone size-medium wp-image-3742" src="img/vmware-deploy10.png" alt="vmware-deploy10" width="528" height="336"></a>

<a name="staticIPass"></a>

### *(Static IP only)* Configure IP Address Pools for Networks

***These steps are required only if static IP address allocation is used. If the management and pool networks use DHCP, skip this section.***

Each Avi SE deployed in a VMware cloud has 10 vNICs. The first vNIC is the management vNIC through which the SE communicates with the Avi Controller. The other vNICs are data vNICs and are used for end-user traffic.

After spinning up an SE, the Controller connects the SE’s management vNIC to the management network specified during initial configuration. The Controller then connects the data vNICs to virtual service networks according to the IP and pool configurations for the virtual services.

To perform this network plumbing automatically, the Controller builds a table that maps port groups to IP subnets. With this table, the Controller connects SE data vNICs to port groups that match virtual service networks and pools.

<a href="img/vmware-deploy4.png"><img class="alignnone size-medium wp-image-3736" src="img/vmware-deploy4.png" alt="vmware-deploy4" width="528" height="265"></a>

After a data vNIC is connected to a port group, it needs to be assigned an IP address. For static allocation, assign a range of IP addresses to the applicable port group. The Controller selects an IP address from the specified range and adds the address to the data vNIC connected to the port group.

Use the following steps to assign an IP address pool to port groups:
<ol> 
 <li>Navigate to Infrastructure &gt; Cloud &gt; Default-Cloud &gt; Network.</li> 
 <li>Find a port group and IP subnet on which a DHCP service <em>is not</em> available.</li> 
 <li>Select the port group by clicking the edit icon: <span style="display: inline-block;"><img class="alignnone size-full wp-image-3558" src="img/edit-icon-2.png" alt="edit-icon" width="13" height="12"></span></li> 
 <li>Check Static for Network IP Address Management.</li> 
 <li>Select the IP subnet by clicking the edit icon: <span style="display: inline-block;"><img class="alignnone size-full wp-image-3558" src="/wp-content/uploads/2016/01/edit-icon-2.png" alt="edit-icon" width="13" height="12"></span></li> 
 <li>Enter a static IP address or a range.</li> 
</ol> 

<a href="img/vmware-deploy5.png"><img class="alignnone size-medium wp-image-3737" src="img/vmware-deploy5.png" alt="vmware-deploy5" width="528" height="287"></a>

**If deploying in no access mode, <a href="configuring-a-virtual-service-for-vmware-basic">creation of virtual services</a>.**
**
### <a href="virtual-service-creation-vmware/">Creating a Virtual Service</a>

### <a href="troubleshooting-vmware-deployment/">Troubleshooting</a>

**  **** 