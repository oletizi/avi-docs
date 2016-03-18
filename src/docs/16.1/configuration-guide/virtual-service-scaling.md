---
layout: configuration-guide
title: Virtual Service Scaling
---

This article covers the following virtual service optimization topics:

*   Scaling out a virtual service to an additional Service Engine (SE)

*   Scaling in a virtual service back to fewer SEs

*   Migrating a virtual service from one SE to another SE

Avi Vantage supports scaling virtual services, which distributes the virtual service workload across multiple SEs to provide increased capacity on demand, thus extending the throughput capacity of the virtual service and increasing the level of high availability.

*   Scaling out a virtual service distributes that virtual service to an additional SE if traffic increases. By default, Avi Vantage supports a maximum of four SEs per virtual service.

*   Scaling in a virtual service reduces the number of SEs consumed by that virtual service if traffic decreases. A virtual service will always require a minimum of one SE.

<img src="img/apps_vsscaling_1.png" alt="apps_vsscaling_1" width="268" height="150" class="alignright size-full wp-image-2113" />

### Operational Notes

The descriptions above to each of the supported infrastructures (cloud types). This section provides additional information for specific infrastructures.

#### How Scaling Operates in VMware / OpenStack with Nuage Deployments

For VMware deployments and OpenStack deployments with Nuage, the scaled out traffic behaves as follows:

*   The Virtual Service IP is GARPed by the Primary SE. All inbound traffic from clients will arrive on this SE.

*   The Primary may handle a percentage of traffic, which is handled normally.

*   Excess traffic is forwarded at layer 2 to the MAC address of the additional Service Engines.

*   The scaled out traffic to the secondary SEs is processed as normal. The SEs will change the source IP address of the connection to their own IP address within the server network.

*   The servers will respond back to the source IP address of the traffic, which may the primary or one of the secondary SEs.

*   The secondary SEs will forward the response traffic directly back to the origin client, bypassing the primary SE.

#### How Scaling Operates in OpenStack with Neutron Deployments

For OpenStack deployments with native Neutron, server response traffic that is sent to the secondary SEs will be forwarded back through the primary SE before returning to the origin client.

Avi Vantage will issue an Alert if the average CPU utilization of an SE exceeds the designated limit during a five-minute polling period. Alerts for additional thresholds can be configured for a virtual service. The process of scaling in or scaling out must be initiated by an administrator. The CPU Threshold field of the SE Group > High Availability tab defines the minimum and maximum CPU percentages.

### How High Availability Affects Scaling

The High Availability settings within the Service Engine Group for the Virtual Service will determine how and when scaling should be performed.

### Scaling Process

The process used to scale out will depend on the level of access, write access or read/no Access, that Avi Vantage has to the hypervisor orchestrator:

*   If Avi Vantage is in Write Access mode with write privileges to the virtualization orchestrator, then Avi Vantage will automatically create additional Service Engines when required to share the load. If the Controller runs into an issue when creating a new Service Engine, it will wait a few minutes and then try again on a different host. When AutoScale is enabled, the original Service Engine still owns and ARPs for the Virtual Service IP address to process as much traffic as it can. Some percentage of traffic will be forwarded via layer 2 to the additional Service Engines. When traffic decreases, the Virtual Service automatically scales in back to the original, primary Service Engine.

*   If Avi Vantage is in Read Access or No Access mode, an administrator must manually create and configure new Service Engines in the virtualization orchestrator. The Virtual Service can only be scaled out once the Service Engine is both properly configured for the network and connected to the Avi Vantage Controller.

> **Note:** Existing Service Engines with spare capacity and appropriate network settings may be used for the scale out; otherwise, scaling out may require either modifying existing Service Engines or creating new Service Engines.

<img src="img/details_quick_info_vs_1-1.jpg" alt="details_quick_info_vs_1" width="622" height="370" class="size-full wp-image-2117" />

### Scaling Out

To manually scale a Virtual Service out when Avi Vantage is operating in Write Access mode:

1.  Open the Virtual Service Details page for the Virtual Service that you want to scale.

2.  Hover the cursor over the name of the Virtual Service to open the Virtual Service Quick Info popup.

3.  Click the Scale Out button to scale the Virtual Service out to an additional Service Engine per click, up to a maximum of four Service Engines.

4.  If available, Avi Vantage will attempt to use an existing Service Engine. If none is available or matches reachability criteria, it may create a new SE.

5.  In some environments, Avi Vantage may prompt for additional information in order to create a new Service Engine, such as additional IP addresses.

The prompt "Currently scaling out" displays the progress while the operation is taking place.

> **Note:** If a Virtual Service scales out across multiple Service Engines, then each Service Engine will independently perform server Health Monitoring to the Pool's servers.
> 
> **Note:** Scaling out does not interrupt existing client connections.

Scaling out a Virtual Service may take anywhere from a few seconds to a few minutes. The scale out timing depends whether an additional Service Engine exists or if a new one needs to be created, as well as network and disk speeds if creating a new SE.

### Scaling In

To manually scale in a Virtual Service in when Avi Vantage is operating in Write Access mode:

1.  Open the Virtual Service Details page for the Virtual Service that you want to scale.

2.  Hover the cursor over the name of the Virtual Service to open the Virtual Service Quick Info popup.

3.  Click the Scale In button to open the Scale In popup window.

4.  Select Service Engine to scale in. In other words, which SE should be removed from supporting this Virtual Service.

5.  Scale the Virtual Service in by one Service Engine per SE selection, down to a minimum of one Service Engine.

The prompt "Currently scaling in" displays the progress while the operation is taking place.

> **Note:** When Scaling In, existing connections are given thirty seconds to complete. Remaining connections to the SE are closed and must restart.

### Migrating

The Migrate option allows graceful migration from one Service Engine to another. During this process, the primary SE will scale out to the new SE and begin sending it new connections. After thirty seconds, the old SE will be deprovisioned from supporting the Virtual Service.

> **Note:** Existing connections to the migration's source SE will be given thirty seconds to complete prior to the SE being deprovisioned for the Virtual Service. Remaining connections to the SE are closed and must restart.