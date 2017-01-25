---
title: Cluster Changes Following Avi Controller Reboot
layout: 16.3
---
This article describes the operational changes that can occur when a node in a an Avi Controller cluster reboots.

## Follower Reboots

Reboot of a follower node does not significantly impact operation of the Avi Service Engines (SEs) connected to the node. 

* Logs are saved locally on the SE until connectivity to the follower node is restored.
* After reboot, the Avi Controller node is configured to handle the virtual service logs from the SE.
* Analytics to the node are briefly interrupted.
* The SE reconnects over SSH when the node is back up.
* Follower replicates the PostgreSQL database of the leader.
* The web interface, REST API, CLI and other Avi Controller services continue to be supported. 

### Related Event Messages

These event messages are generated when a follower node leaves and rejoins the cluster, respectively.

* CONTROLLER_NODE_LEFT
* CONTROLLER_NODE_JOINED 

## Leader Reboots

When the leader node in an Avi Controller cluster reboots, one of the follower nodes takes over the new leader. Operation of the Avi SEs connected to the node is not significantly impacted.

The process is similar to when a follower reboots. Additionally, the leader IP address is updated to that of the follower that became the new leader.

### Related Event Messages

These event messages are generated when a follower node leaves and rejoins the cluster, respectively. 

* CONTROLLER_NODE_LEFT
* CONTROLLER_NODE_JOINED 

Note: These are the same events generated when a follower reboots and rejoins. 

## Multiple Followers Reboot

When the leader node in an Avi Controller cluster reboots, one of the follower nodes takes over the new leader. Operation of the Avi SEs connected to the node is not significantly impacted.

The process is similar to when a single follower reboots. 

During the reboot process, the cluster status changes as follows:

* Ready
* Not Responsive
* Restoring
* Waiting for Service Engines
* Cluster copying DB from leader
* Ready 

### Related Event Messages

These event messages are generated when a follower node leaves and rejoins the cluster, respectively. 

* CONTROLLER_NODE_LEFT
* CONTROLLER_NODE_JOINED 

Note: These are the same events generated when a single follower reboots and rejoins. 

## Leader *and* Followers Reboot

When all Avi Controllers in the cluster reboot, the process is similar to the process when the leader and only one of the followers reboots. 

During the reboot process, the cluster status changes as follows:

* Ready
* Not Responsive
* Errors (if any)
* Restoring
* Waiting for Service Engines
* Cluster copying DB from leader
* Ready 

### Related Event Messages

These event messages are generated when a follower node leaves and rejoins the cluster, respectively. 

* CONTROLLER_LEADER_FAILOVER
* CONTROLLER_NODE_JOINED 

The CONTROLLER_LEADER_FAILOVER indicates that a new leader has taken over. The CONTROLLER_NODE_JOINED event indicates when followers join the cluster. 

### Service Engine State Changes

The SE state changes as follows:

* Avi Controller heartbeat failed
* Headless (SE is continuing to operate but without an Avi Controller.) 

Once the cluster is back up, the SE reconnects to an Avi Controller.

