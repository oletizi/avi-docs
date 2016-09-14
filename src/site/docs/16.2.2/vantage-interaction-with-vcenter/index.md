---
title: Avi Vantage Interaction with vCenter
layout: default
---
### Description

Avi Vantage may be deployed with a VMware cloud in either No Access, Read Access, or Write Access mode. Each mode results in escalating functionality and automation, but also requires higher levels of privilege for the Vantage Controller within VMware vCenter.

See <a href="/docs/latest/orchestrator-access-modes">Orchestrator Access Modes</a> for more information on access modes.

### Initial Discovery (Read operation)

Avi Controller retrieves the following objects from vCenter in both Read Access and Write Access modes.<a href="img/SelectbyNetwork2.png"><img src="img/SelectbyNetwork2.png" alt="SelectbyNetwork2" width="220" height="177"></a>

* **Datacenter**: Discovered Datacenters are provided as a list for user to select the specific Datacenter for more detailed discovery
* **Networks**: This includes all networks (Standard/Distributed Portgroup)

* **Networks**: It provides networks as a list for the user to select "Management Network"
* **IP Subnet**: The IP Subnet for each portgroup based on vNics in that portgroup (if vmtools is running on the VM).
IP Subnet learned is used for placing the virtual service on appropriate networks
* **Hosts**: Used to execute the placement algorithms for creating Service Engine VMs
* **Clusters**: Used to constrain the set of ESX Hosts to be considered while creating the Service Engine VMs
* **Virtual Machines**: All the Virtual Machines in the Datacenter are discovered. This is to retrieve the IP Subnet for each network.
Discovered Virtual Machines also aid in the pool server selection
* **Datastores**: This is for the user to select which Datastore to use for Service Engine VM creation (only shared datastores are considered)

### Service Engine VM Creation (Read/Write operation)

Vantage Controller interacts with OVF Manager functionality of the vCenter to spawn a Service Engine VM. The Controller needs the following access while in Write Access mode.

* **Folders**: Vantage Controller creates the Service Engine VM in the default "AviSeFolder" or a folder which the user can specify.
It creates the folder "AviSeFolder" if it is not present.
* **Datastores**: Vantage Controller performs the data transfer for the Service Engine VM directly to the ESX Host's datastore.
* **Network**: 9 out of 10 vNics for the Service Engine VM are placed in "Avi Internal" portgroup of vSwitch0.
"Avi Internal" Standard portgroup is created in vSwitch0 of the ESX Host. If vSwitch0 (default Standard Switch) is not present then
Avi Controller creates vSwitch0 in the ESX Host
* **vApp**: Avi Controller updates OVF parameters of the Service Engine VM which fall in the vApp functionality.

### Placement of VS on a Service Engine VM (Write Operation)

Vantage Controller moves vNics of Service Engine VM from "Avi Internal" to the required Portgroup (Standard/Distributed) to stitch the network connectivity for the virtual service while in Write Access mode.

* **VM Deletion**:** **Vantage Controller deletes the Service Engine VM by interacting with the vCenter

### vCenter Stats

<a href="img/ServerMetrics.png"><img src="img/ServerMetrics.png" alt="ServerMetrics" width="356" height="80"></a>Vantage Controller retrieves stats from vCenter for Virtual Machines and Hosts. This data is for metrics based analytics, such as assigning resource penalties. This data is queried by Vantage while in both Read and Write Access modes.

### Custom vCenter Roles

Vantage may leverage a custom role created within vCenter to limit the scope of access, as shown below. No change is required on Vantage.

<a href="img/vCenterAviRole.jpg"><img src="img/vCenterAviRole.jpg" alt="vCenterAviRole" width="586" height="920"></a>