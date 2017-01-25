---
title: Impact of a Controller Failure
layout: 16.3
---
The impact of the loss of an Avi Controller depends on whether the Controller is deployed as a standalone or as part of a 3-node Controller cluster.

A Controller failure can occur for various reasons, such as a software failure or failure in the underlying hardware. A Controller also can *fail* simply by losing connectivity to the networks containing the rest of the Avi Vantage infrastructure.

### Controller Cluster

In a Controller cluster, the three Controllers divide the workload among themselves. Should one Controller fail, the remaining two Controllers will continue operations as normal with no impact to data plane traffic.

If the failed Controller was the cluster leader, one of the remaining Controllers will take over as cluster leader. This change in leadership has no direct impact on operations. If a cluster IP address has been created, that IP address will move to the new leader, which will begin ARPing (advertising) the address.

### Cluster Quorum

A Controller cluster requires at least two of its 3 nodes to be up, in order to maintain quorum. This eliminates the "split brain" scenario in which two devices are simultaneously active (primary) with potentially conflicting configuration updates.

If a Controller is still online, but merely has lost contact with the other Controllers, it will no longer be part of the cluster until it has regained connectivity. So if one Controller and multiple Service Engines are created in each of three data centers, and one data center has lost connectivity to the other two data centers, the Controller at the isolated data center will not accept configuration changes as a standalone. The isolated Controller must either reconnect with the cluster or be formally demoted to a standalone.

### Replacing a Failed Controller

If Controller failure is a permanent state, take the following actions to remove the Controller and restore full high availability to the cluster.
<ol> 
 <li>If the Controller was in a virtual machine, delete the VM from the cloud orchestrator.</li> 
 <li>From another (still up) Controller's web interface, delete the failed Controller's IP address. Navigate to Administration &gt; Controller.</li> 
 <li>Install a new Controller. <p>Note: Do not log into the new Controller's web interface. Only perform initial setup (such as selecting the cloud orchestrator).</p></li> 
 <li>From the existing Controller, add the IP address of the new Controller. After a few minutes, the status of the cluster should turn green.</li> 
</ol> 

### Standalone Controller

In a standalone Controller configuration, a Controller failure leaves the Avi Vantage system in a headless state. In a headless state, existing Service Engines (SEs) will continue to operate with the last instructions they were given.

No new configuration changes are possible until a Controller is restored. This may be done by rebuilding a new Controller, which is disruptive to existing connections, or by bringing the existing Controller back online, which is transparent to existing data traffic.

While in a headless state, SEs will attempt to queue up metrics and logs. If a Controller is temporarily offline, such as while the Controller's host is rebooted, the SEs will reconnect after the Controller returns and is updated with the metrics and logs it missed while offline.
