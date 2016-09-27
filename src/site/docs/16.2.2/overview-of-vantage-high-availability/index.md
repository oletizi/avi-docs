---
title: Overview of Vantage High Availability
layout: default
---
To ensure the highest level of uptime, careful consideration must be made to ensure the availability for both Avi Controllers and Avi Service Engines.

* **Avi Controller HA:** Provides node-level redundancy for Avi Controllers. A single Avi Controller is deployed as the leader node, then two additional Avi Controllers are added as follower nodes. [Note: Some *older* Avi literature may refer to the leader and followers as primary and secondaries, respectively.]
* **Avi SE HA:** Provides SE-level redundancy within an SE group. If an SE within the group fails, HA heals the failure and compensates for the reduced site capacity. Typically, this consists of spinning up a new SE to take the place of the one that failed. 

HA for Avi SEs and HA for Avi Controllers are separate features and are configured separately. HA for Avi Controllers is a system administration setting. HA for Avi SEs is an SE group setting.
<a name="control-plane-HA"></a>

## Control Plane High Availability

Best practice, especially for production deployments, is to deploy a set of 3 Avi Controllers as an HA cluster. In a cluster deployment, one of the Avi Controllers is the leader, and performs load balancing and configuration management for the cluster. The other 2 Avi Controllers are followers; they collaborate with the leader to perform data collection from SEs and process analytics data. More information about Avi Controller HA can be found in the following articles:

* <a href="/docs/latest/ha-for-avi-controllers">HA for Avi Controllers</a>
* <a href="/docs/latest/configure-controller-ha-cluster">Deploying an Avi Controller Cluster</a>
* <a href="/docs/latest/controller-cluster-ip">Controller Cluster IP</a>
* <a href="/docs/latest/changing-avi-controller-cluster-configuration">Changing Avi Controller Cluster Configuration</a>
* <a href="/docs/latest/cluster-operational-changes">Cluster Changes Following Avi Controller Reboot</a>
* <a href="/docs/latest/impact-of-a-controller-failure">Impact of a Controller Failure</a>
* <a href="/docs/latest/clustering-controllers-from-different-networks">Clustering Avi Controllers That Are in Different Networks</a>
* <a href="/docs/latest/backup-the-configuration">Configuration Backup and Restore</a> 

<a name="data-plane-HA"></a>

## Data Plane High Availability

Avi SE groups support the following HA modes:

* **<a href="/docs/latest/elastic-ha-for-avi-service-engines-16-2">Elastic HA:</a>** Provides fast recovery for individual virtual services following failure of an Avi SE. Depending on the mode, the virtual service is already running on multiple SEs or is quickly placed on another SE. The following modes of cluster HA are supported:  
    * **Active/Active**
    * **N + M**
* **<a href="/docs/latest/legacy-ha-for-avi-service-engines/">Legacy HA:</a>** Emulates the operation of 2-device hardware active/standby HA configuration. The active SE carries all the traffic for a virtual service placed on it. The other SE in the pair is the standby for the VS, carrying no traffic for it while the active SE is healthy. 

More information about Avi SE HA can be found in the following articles:

* <a href="/docs/latest/anti-affinity-for-service-engine-placement">Anti-affinity for Service Engine Placement</a>
* <a href="/docs/latest/gateway-monitoring-for-legacy-ha">Gateway Monitoring for Legacy HA</a> 