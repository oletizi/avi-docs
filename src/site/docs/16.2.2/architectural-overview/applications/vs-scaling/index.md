---
title: Virtual Service Scaling
layout: default
---
This article covers the following virtual service optimization topics:

* Scaling out a virtual service to an additional Avi Service Engine (SE)
* Scaling in a virtual service back to fewer SEs
* Migrating a virtual service from one SE to another SE 

Avi Vantage supports scaling virtual services, which distributes the virtual service workload across multiple SEs to provide increased capacity on demand, thus extending the throughput capacity of the virtual service and increasing the level of high availability.

* Scaling out a virtual service distributes that virtual service to an additional SE. By default, Avi Vantage supports a maximum of four SEs per virtual service when native load balancing of SEs is in play. In <a href="bgp-support-for-virtual-services">BGP</a> environments the maximum can be increased to 32.
* Scaling in a virtual service reduces the number of SEs over which its load is distributed. A virtual service will always require a minimum of one SE. 

### Operational Notes

<figure class="thumbnail wp-caption alignright"> <a href="img/apps_vsscaling_1.png"><img class="wp-image-2113 size-full" src="img/apps_vsscaling_1.png" alt="apps_vsscaling_1" width="268" height="150"></a>  
<figcapture> Native load balancing of SEs. The primary SE (in the middle) is flanked by two secondary SEs. 
</figcapture>
</figure> 

This section provides additional information for specific infrastructures.

### How Scaling Operates in VMware / OpenStack with Nuage Deployments

For VMware deployments and OpenStack deployments with Nuage, the scaled out traffic behaves as follows:

* The virtual service IP is GARPed by the primary SE. All inbound traffic from clients will arrive to this SE.
* The primary SE may handle a percentage of traffic, which is handled normally.
* Excess traffic is forwarded at layer 2 to the MAC address of additional secondary Service Engine(s).
* The scaled-out traffic to the secondary SEs is processed as normal. The SEs will change the source IP address of the connection to their own IP address within the server network.
* The servers will respond back to the source IP address of the traffic, which may the primary or one of the secondary SEs.
* Secondary SEs forward their response traffic directly back to the origin client, bypassing the primary SE. 

### How Scaling Operates in OpenStack with Neutron Deployments

For OpenStack deployments with native Neutron, server response traffic sent to the secondary SEs will be forwarded back to and through the primary SE before returning to the origin client.

Avi Vantage will issue an Alert if the average CPU utilization of an SE exceeds the designated limit during a five-minute polling period. Alerts for additional thresholds can be configured for a virtual service. The process of scaling in or scaling out must be initiated by an administrator. The CPU Threshold field of the SE Group &gt; High Availability tab defines the minimum and maximum CPU percentages.

### Scaling Process

The process used to scale out will depend on the level of access, write access or read/no Access, that Avi Vantage has to the hypervisor orchestrator:

* If Avi Vantage is in Write Access mode with write privileges to the virtualization orchestrator, then Avi Vantage is able to automatically create additional Service Engines when required to share the load. If the Controller runs into an issue when creating a new Service Engine, it will wait a few minutes and then try again on a different host. With native load balancing of SEs in play, the original Service Engine (primary SE) owns and ARPs for the virtual service IP address to process as much traffic as it can. Some percentage of traffic arriving to it will be forwarded via layer 2 to the additional (secondary) Service Engines. When traffic decreases, the virtual service automatically scales in back to the original, primary Service Engine.
* If Avi Vantage is in Read Access or No Access mode, an administrator must manually create and configure new Service Engines in the virtualization orchestrator. The virtual service can only be scaled out once the Service Engine is both properly configured for the network and connected to the Avi Vantage Controller. &gt; <p style="text-align: center;"><strong>Note:</strong> Existing Service Engines with spare capacity and appropriate network settings may be used for the scale out; otherwise, scaling out may require either modifying existing Service Engines or creating new Service Engines.
 

### Manual Scaling of Virtual Services<a href="img/VS-scale-in-out-migrate.png"><img class="alignright wp-image-10874" src="img/VS-scale-in-out-migrate.png" alt="VS scale in out migrate" width="275" height="171"></a>

Virtual services inherit from their SE group the values for the minimum and maximum number of SEs on which they can be instantiated. [Note: A virtual service's maximum instantiation count may be well below the maximum number of SEs in its group.] Between the VS min/max values, the user can manually scale the virtual service out or in from the UI, CLI, or REST API. Also, current VS instantiations on SEs can be migrated to other SEs with the same SE group. The mouse-over popup at right shows how these three actions can be accomplished from within the UI.

### Automatic Scaling of Virtual Services

<a href="img/VS-placement-policy.png"><img class="alignnone size-full wp-image-10878" src="img/VS-placement-policy.png" alt="VS placement policy" width="2148" height="178"></a>Virtual services likewise inherit from their SE group the value set for automatic rebalancing of VS instantiations. [Note: Auto-rebalancing applies only if elastic HA has been selected for the SE group]. As shown above, this setting can be checked in the Virtual Service Placement Policy section of the SE group editor. With auto-rebalance in play, and based upon the CPU utilizations of SEs with the group, Vantage will migrate virtual services and -- if need be -- scale out/in the number of SEs deployed. As a result of an auto-rebalance operation, one or more virtual services in the group may be migrated to alternative SEs and/or their instantiation count adjusted to best serve the current client load.

### Scaling Out

To manually scale a virtual service out when Avi Vantage is operating in Write Access mode:
</p><ol> 
 <li>Open the Virtual Service Details page for the virtual service that you want to scale.</li> 
 <li>Hover the cursor over the name of the virtual service to open the Virtual Service Quick Info popup.</li> 
 <li>Click the Scale Out button to scale the Virtual Service out to an additional Service Engine per click, up to a maximum of four Service Engines.</li> 
 <li>If available, Avi Vantage will attempt to use an existing Service Engine. If none is available or matches reachability criteria, it may create a new SE.</li> 
 <li>In some environments, Avi Vantage may prompt for additional information in order to create a new Service Engine, such as additional IP addresses.</li> 
</ol> 

The prompt "Currently scaling out" displays the progress while the operation is taking place.

&gt; <strong>Note:</strong> If avirtual service scales out across multiple Service Engines, then each Service Engine will independently perform server health monitoring to the pool's servers. 
&gt; <strong>Note:</strong> Scaling out does not interrupt existing client connections.
 

Scaling out a virtual service may take anywhere from a few seconds to a few minutes. The scale out timing depends whether an additional Service Engine exists or if a new one needs to be created, as well as network and disk speeds if creating a new SE.

### Scaling In

To manually scale in a virtual service in when Avi Vantage is operating in Write Access mode:
<ol> 
 <li>Open the Virtual Service Details page for the virtual service that you want to scale.</li> 
 <li>Hover the cursor over the name of the virtual service to open the Virtual Service Quick Info popup.</li> 
 <li>Click the Scale In button to open the Scale In popup window.</li> 
 <li>Select Service Engine to scale in. In other words, which SE should be removed from supporting this Virtual Service.</li> 
 <li>Scale the virtual service in by one Service Engine per SE selection, down to a minimum of one Service Engine.</li> 
</ol> 

The prompt "Currently scaling in" displays the progress while the operation is taking place.

&gt; <strong>Note:</strong> When Scaling In, existing connections are given thirty seconds to complete. Remaining connections to the SE are closed and must restart.
 

### Migrating

The Migrate option allows graceful migration from one Service Engine to another. During this process, the primary SE will scale out to the new SE and begin sending it new connections. After thirty seconds, the old SE will be deprovisioned from supporting the virtual service.
&gt; <strong>Note:</strong> Existing connections to the migration's source SE will be given thirty seconds to complete prior to the SE being deprovisioned for the virtual service. Remaining connections to the SE are closed and must restart.
  