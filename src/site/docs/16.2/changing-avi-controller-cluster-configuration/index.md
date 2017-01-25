---
title: Changing Avi Controller Cluster Configuration
layout: 16.2
---
This article describes how to change node membership or node IP address in an Avi Controller cluster.

* <a href="#deploynewcluster">Deploying a New Cluster</a>
* <a href="#removebothfollowers">Removing Both Followers</a>
* <a href="#changefollower">Changing a Follower Node</a>
* <a href="#replaceleader">Replacing the Leader Node</a>
* <a href="#replacefollower">Replacing a Follower Node with a New Node</a> &gt; Note: If the IP address of an Avi Controller node has changed, a script must be run to update the configuration. <a href="/docs/16.2/ctlr-cfg-update-after-ip-change">Click here </a>for information.
 

<a name="deploynewcluster"></a>

## Deploying an Avi Controller Cluster

This section shows the web interface popup and CLI commands for deploying an Avi Controller cluster.

To deploy an Avi Controller cluster, first deploy a single Avi Controller node (the leader), then add the follower nodes to the leader. (After using the setup wizard to install Avi Vantage on the follower nodes, do not make any other configuration changes on these nodes.) For more in-depth information about initial cluster deployment, click <a href="/docs/16.2/configure-controller-ha-cluster">here</a>.

### Web Interface

On the Avi Controller node that will be the leader:
<ol> 
 <li>Navigate to Administration &gt; Controller and click Edit.</li> 
 <li>Enter the <a href="/docs/16.2/controller-cluster-ip">cluster IP address</a>. This will be the shared management IP address of the cluster.</li> 
 <li>Enter the host IP addresses of each of the 3 nodes in the Controller Node fields: 
  <ul> 
   <li>Controller Node-1: Host IP address of the leader node.</li> 
   <li>Controller Node-2: Host IP address of one of the follower nodes.</li> 
   <li>Controller Node-3: Host IP address of one of the other follower node.</li> 
  </ul> </li> 
 <li>Click Save.</li> 
</ol> 

### CLI

Login to the CLI (or CLI shell) and enter the commands shown in the following example.

Note: Make sure to enter the host IP addresses of your Avi Controller nodes instead of the IP addresses shown in the example.

<pre class="command-line language-bash" data-prompt=": >" data-output="2-26"><code>configure cluster
Updating an existing object. Currently, the object is:
+---------------+----------------------------------------------+
| Field | Value |
+---------------+----------------------------------------------+
| uuid | cluster-eb01bf05-7313-4a4f-91b6-21e46d3c237d |
| name | cluster-0-1 |
| nodes[1] | |
| name | 10.10.25.81 |
| ip | 10.10.25.81 |
| vm_ref | EB01BF05-7313-4A4F-91B6-21E46D3C237D |
| vm_mor | |
| vm_hostname | node1.controller.local |
| tenant_ref | admin |
+---------------+----------------------------------------------+
: cluster&gt; nodes name 10.10.25.82 ip 10.10.25.82
New object being created
: cluster:nodes&gt; save
: cluster&gt; nodes name 10.10.25.83 ip 10.10.25.83
New object being created
: cluster:nodes&gt; save
: cluster&gt; save
Configuring the cluster with the controller nodes at [u'10.10.25.81', '10.10.25.82', '10.10.25.83'].
If nodes were added or removed from the cluster, this controller will be brought down and then back up with the new configuration.

Waiting for the cluster to be ready...
Controller is ready.</code></pre> <a name="removebothfollowers"></a> 

## Removing Both Followers (Dismantling the Cluster)

### Web Interface

<ol> 
 <li>To remove both followers from an Avi Controller cluster:</li> 
 <li>Navigate to Administration &gt; Controller.</li> 
 <li>Click Edit.</li> 
 <li>Remove each of the follower IP addresses from the configuration popup.</li> 
 <li>Click Save.</li> 
</ol> 

### CLI

Login to the CLI (or CLI shell) and enter the commands shown in the following example.

Note: Make sure to enter the host IP addresses of your Avi Controller nodes instead of the IP addresses shown in the example.

<pre class="command-line language-bash" data-prompt=": >" data-output="2-26"><code>configure cluster
Updating an existing object. Currently, the object is:
+---------------+----------------------------------------------+
| Field | Value |
+---------------+----------------------------------------------+
| uuid | cluster-eb01bf05-7313-4a4f-91b6-21e46d3c237d |
| name | cluster-0-1 |
| nodes[1] | |
| name | node-1 |
| ip | 10.10.25.81 |
| vm_ref | EB01BF05-7313-4A4F-91B6-21E46D3C237D |
| vm_mor | |
| vm_hostname | node1.controller.local |
| nodes[2] | |
| name | node-2 |
| ip | 10.10.25.82 |
| vm_ref | EC123A05-7313-4A4F-91B6-21E46D3D46AF |
| vm_mor | |
| vm_hostname | node2.controller.local |
| nodes[3] | |
| name | 10.10.25.83 |
| ip | 10.10.25.83 |
| vm_ref | EA12C05-7313-4A4F-91B6-21E46D3E256EA |
| vm_mor | |
| vm_hostname | node3.controller.local |
| tenant_ref | admin |
+---------------+----------------------------------------------+
: cluster&gt; no nodes name node-2
Removed nodes with name=node-2
: cluster:nodes&gt; save
: cluster&gt; no nodes name node-3
Removed nodes with name=node-3
: cluster:nodes&gt; save
: cluster&gt; save
Configuring the cluster with the controller nodes at [u'10.10.25.81'].
If nodes were added or removed from the cluster, this controller will be brought down and then back up with the new configuration.

Waiting for the cluster to be ready...
Controller is ready.</code></pre> After Save: 

* The cluster is dismantled and recovered into a single node.
* Each follower is re-imaged into its default state with no configuration and no access to the leader.
* The leader holds the configuration. The Avi Service Engines (SEs) continue to connect to the leader. 

For more information about the transition process, including descriptions of the status messages that appear, <a href="/docs/16.2//configure-controller-ha-cluster#cluster-transition-process">click here</a>.

Note: During the transition from a cluster to a single node, the REST API will be unavailable for around 2 minutes.

<a name="changefollower"></a>

## Change a Follower Node

To remove one of the follower nodes and add another one, use the following steps.

Note: If the node will be removed and replaced with a different node (different VM, container, or bare metal server), click here instead. The cluster will need to be <a href="#replacefollower">dismantled</a>, then recreated using the new node.

### Web Interface

<ol> 
 <li>Navigate to Administration &gt; Controller.</li> 
 <li>Click Edit.</li> 
 <li>Edit the IP address for the follower node to changed.</li> 
 <li>Click Save.</li> 
</ol> 

### CLI

Login to the CLI (or CLI shell) and enter the commands shown in the following example.

Note: Make sure to enter the host IP addresses of your Avi Controller nodes instead of the IP addresses shown in the example.

<pre class="command-line language-bash" data-prompt=": >" data-output="2-26"><code>configure cluster
Updating an existing object. Currently, the object is:
+---------------+----------------------------------------------+
| Field | Value |
+---------------+----------------------------------------------+
| uuid | cluster-eb01bf05-7313-4a4f-91b6-21e46d3c237d |
| name | cluster-0-1 |
| nodes[1] | |
| name | node-1 |
| ip | 10.10.25.81 |
| vm_ref | EB01BF05-7313-4A4F-91B6-21E46D3C237D |
| vm_mor | |
| vm_hostname | node1.controller.local |
| nodes[2] | |
| name | node-2 |
| ip | 10.10.25.82 |
| vm_ref | EC123A05-7313-4A4F-91B6-21E46D3D46AF |
| vm_mor | |
| vm_hostname | node2.controller.local |
| nodes[3] | |
| name | 10.10.25.83 |
| ip | 10.10.25.83 |
| vm_ref | EA12C05-7313-4A4F-91B6-21E46D3E256EA |
| vm_mor | |
| vm_hostname | node3.controller.local |
| tenant_ref | admin |
+---------------+----------------------------------------------+
: cluster&gt; no nodes name node-3
Removed nodes with name=node-3
: cluster:nodes&gt; save
: cluster&gt; nodes name node-4 ip 10.10.25.84
Removed nodes with name=node-4
: cluster:nodes&gt; save
: cluster&gt; save
Configuring the cluster with the controller nodes at [u'10.10.25.81', '10.10.25.82', '10.10.25.84'].
If nodes were added or removed from the cluster, this controller will be brought down and then back up with the new configuration.

Waiting for the cluster to be ready...
Controller is ready.</code></pre> After Save: 

* The removed follower node is sent an API request asking it to gracefully clear its own state.
* Since the old follower is not always expected to clear its own state, the leader will forcibly remove it if necessary.
* The new follower node is added using the process described <a href="/docs/16.2/changing-avi-controller-cluster-configuration#cluster-transition-process"> here</a>. 

<a name="replaceleader"></a>

## Replacing the Leader Node

To replace the leader node, power it down to force one of the followers to take over leadership, then use the steps to <a href="#changefollower">replace a follower</a>.
<ol> 
 <li>Power down the leader node and leave it powered off for several minutes while one of the followers assumes leadership.</li> 
 <li>Use the steps for adding a new follower node.</li> 
</ol> 

Note: The leader cannot be directly removed. Instead, it must be replaced with another leader.

<a name="replacefollower"></a>

## Replace a Follower Node with a New Node

These steps describe how to replace a follower node with a new node.

Notes:

* This procedure applies to replacing a follower node with a completely different node that is not currently in the cluster. For example, these steps apply to replacing a follower node with a new VM or bare metal server.
* The node cannot be replaced simply by inserting the node into the network and editing the cluster configuration information. 

To replace a follower node:

<ol> 
 <li>Log onto the leader node, and use the steps to dismantle the cluster by <a href="#removebothfollowers">removing both follower nodes</a>.</li> 
 <li>On the new node, install Avi Vantage. This consists of spinning up a new virtual machine (VM) or container from the Avi Controller package (OVA, QCOW or Docker image) on the new node.</li> 
 <li>Use the steps to <a href="#deploynewcluster">deploy a new cluster</a>.</li> 
</ol> 