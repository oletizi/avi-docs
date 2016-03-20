---
layout: configuration-guide
title: Controller
---

The Administration > Controller page provides information about the Controller (or Controller cluster).

## Controller Table

The Controller table lists the Controllers. If Vantage is deployed with a single Controller, only that Controller is listed. If Vantage is deployed as a 3-node Controller cluster, each Controller node is listed. The following example is from a deployment that uses a single Controller:

<a href="img/admin-ctlr-list.png" rel="attachment wp-att-5363"><img src="img/admin-ctlr-list.png" alt="admin-ctlr-list" width="880" height="231" class="alignnone size-full wp-image-5363" /></a>

The Controller table contains the following information:

*   **Name:** Name or IP address of the Controller.

*   **Management IP Address:** Management IP address of the individual Controller (node) in the cluster. Each Controller in the cluster will have its own management address.

*   **Cluster IP:** The shared management IP address for the cluster, owned by the current primary (leader) Controller.

*   **Role:** Shows which Controller is the primary, or leader of the cluster.

*   **State:** The Controller's status, such as "Cluster Active".

<div style="margin-top: 60px;">
</div>

## Controller Analytics

This tab configures the management IP addresses for the Controller(s).

In a 3-node cluster, each Controller node will have its own management IP address, which can be directly accessed. The cluster will also have a single address that moves to whichever Controller is currently the cluster leader.

Best practice is to always access the Controller cluster through the cluster IP address, in the event there is an issue with a single Controller. By using the cluster IP address for access, access to the Controller web interface can be maintained even while an individual Controller is offline. For example, the cluster IP address provides consistent management access to Vantage during the upgrade process.

*   **Cluster Information:**
    
    *   **Controller Cluster IP:** The shared management IP address for the cluster. 

*   **Management IP:**
    
    *   **Controller Node-1:** Management IP address of node 1. This IP interface belongs only to this Controller node and is not shared by the cluster.
    
    *   **Controller Node-2:** Management IP address of node 2. This IP interface belongs only to this Controller node and is not shared by the cluster.
    
    *   **Controller Node-3:** Management IP address of node 3. This IP interface belongs only to this Controller node and is not shared by the cluster.

<div style="margin-top: 60px;">
</div>

## Controller Events

This page lists Controller-related events. This page automatically filters the Vantage events log to display only those events related to Controller operation. The same events also are included in the events log accessed by [Operations > Events][1]. The same search options also are supported.

<a href="img/admin-events.png" rel="attachment wp-att-5383"><img src="img/admin-events.png" alt="admin-events" width="880" height="531" class="alignnone size-full wp-image-5383" /></a>

<div style="margin-top: 60px;">
</div>

## Controller Alerts

This page lists Controller-related alerts. This page automatically filters the Vantage alerts log to display only those alerts related to Controller operation. The same alerts also are included in the alerts log accessed by [Operations > Alerts][2]. The same search options also are supported.

> Note: Alerts are generated only if [configured][2] by the Vantage user.

<div style="margin-top: 60px;">
</div>

## Converting a Single-node Cluster to a Three-node Cluster

If Vantage was deployed with a single Controller node, it is possible to add 2 additional Controller nodes to form a 3-node cluster. To ensure complete system redundancy, the Avi Controller must be highly available. High availability of the Controller requires 3 separate Controller instances, configured as a 3-node cluster.

To convert a single-node Controller deployment into a 3-node deployment, use the following steps.

In this procedure, the Controller node that is already deployed in the singe-node deployment is referred to as the *incumbent* Controller.

1.  [Install][3] 2 (two) new Controller nodes. During installation, configure ***only*** the following settings for each node:
    
    *   Node management IP address
    
    *   Gateway address

2.  Connect the management interface of each new Controller node to the same network as the incumbent Controller. After the incumbent Controller detects the 2 new Controller nodes, the incumbent Controller will become the primary (leader) Controller for the 3-node cluster.

3.  Use a web browser to navigate to the management IP address of the primary (leader) Controller.

4.  Navigate to Administrator > Controller, and click Edit. The Edit Controller Configuration popup appears.

5.  In the Controller Cluster IP field, enter the shared IP address for the Controller cluster.

6.  In the Controller Node-2 and Controller Node-3 fields, enter the management IP addresses of the new Controller nodes.

<a href="img/admin-ctlr-cluster-info-3.png" rel="attachment wp-att-5381"><img src="img/admin-ctlr-cluster-info-3.png" alt="admin-ctlr-cluster-info" width="767" height="384" class="alignnone size-full wp-image-5381" /></a>

After these steps, the incumbent Controller becomes the primary (leader) for the cluster and invites the other Controllers to the cluster as members. Vantage then performs a warm reboot of the cluster. This process can take 2-3 minutes. The configuration of the primary (leader) Controller is synchronized to the new member nodes when the cluster comes online following the reboot.

<a href="img/admin-ctlr-cluster-topo-small-1.png" rel="attachment wp-att-5396"><img src="img/admin-ctlr-cluster-topo-small-1.png" alt="admin-ctlr-cluster-topo-small" width="450" height="236" class="alignnone size-full wp-image-5396" /></a>

<div style="margin-top: 60px;">
</div>

## High Availability Operation for Controllers

Vantage provides high availability for virtual services, which is separately configurable within individual virtual services (using the [Advanced][4] tab of a virtual service's configuration.)

In addition to high availability for individual virtual services, the Controllers in a 3-node cluster provide an additional level of high availability with redundancy of the Controller itself.

### Quorum

Controller-level high availability requires a quorum of Controller nodes to be up. In a 3-node Controller cluster, quorum can be maintained if at least 2 of the 3 Controller nodes are up. If one of the Controllers fails, the remaining 2 nodes continue service and Vantage continues to operate. However, if 2 of the 3 nodes go down, the entire cluster goes down and Vantage stops working.

### Failover

Each Controller node in a cluster periodically sends heartbeat messages to the other Controller nodes in the cluster.

<a href="img/admin-ctlr-cluster-heartbeats.png" rel="attachment wp-att-5399"><img src="img/admin-ctlr-cluster-heartbeats.png" alt="admin-ctlr-cluster-heartbeats" width="375" height="330" class="alignnone size-full wp-image-5399" /></a>

<div style="margin-top: 40px;">
</div>

The heartbeat interval is 10 seconds. The maximum number of consecutive heartbeat messages that can be missed is 4. If a Controller does not hear from another Controller for 40 seconds (4 missed heartbeats), the other Controller is assumed to be down.

If only one node is down, quorum is maintained and the cluster can continue to operate.

*   If a member node goes down by the primary (leader) node stays, access to virtual services continues without interruption.
    
    <a href="img/admin-ctlr-cluster-heartbeats-missed-1.png" rel="attachment wp-att-5405"><img src="img/admin-ctlr-cluster-heartbeats-missed-1.png" alt="admin-ctlr-cluster-heartbeats-missed" width="375" height="321" class="alignnone size-full wp-image-5405" /></a>
    
    <div style="margin-top: 40px;">
    </div>

*   If the primary (leader) node goes down, the member nodes form a new quorum and elect a cluster leader. The election process takes about 50-60 seconds and during this period, there is no impact on the data plane. The SEs will continue to operate in "headless mode" but control plane service is not going to be available. During this period, Vantage users will not be able to create a VIP through LBaaS or using the Vantage web interface, API, or CLI.
    
    <a href="img/admin-ctlr-cluster-heartbeats-missed-headless-1.png" rel="attachment wp-att-5406"><img src="img/admin-ctlr-cluster-heartbeats-missed-headless-1.png" alt="admin-ctlr-cluster-heartbeats-missed-headless" width="375" height="276" class="alignnone size-full wp-image-5406" /></a>

<div style="margin-top: 40px;">
</div>

 [1]: ops-events
 [2]: ops-alerts/
 [3]: img/vantage-installation-guides
 [4]: virtual-service-create#vscreateadvancedadvancedtab