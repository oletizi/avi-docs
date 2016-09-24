---
title: API - Configuring the Avi Controller Cluster
layout: default
---
The Avi Vantage REST API provides commands for managing the Avi Controller cluster.

To configure the Avi Controller cluster using the API, use the following API commands.

### Getting the Avi Controller Cluster Configuration

To get the existing cluster configuration, send an API request such as the following:

<code>GET /api/cluster</code>

**Example Output**

<pre>
<code class="language-json">{
    url: "https://10.10.5.27/api/cluster",
    uuid: "cluster-005056ac9e91",
    name: "cluster-0-1",
    tenant_ref: "https://10.10.5.27/api/tenant/admin",
    virtual_ip: {
        type: "V4",
        addr: "10.10.5.27"
    },
    nodes: [
        {
            ip: {
                type: "V4",
                addr: "10.10.5.16"
            },
            vm_hostname: "node1.controller.local",
            vm_uuid: "005056ac9e91",
            name: "10.10.5.16",
        }
    ]
}</code>
</pre> 

In this example, the cluster contains only a single member. When Vantage is installed, the Avi Controller created during installation is placed in a cluster, as the primary Avi Controller. The management IP address is configured as the cluster IP address.

### Adding Avi Controller Nodes to the Cluster

To create a 3-node cluster, send a request such as the following to add 2 more Avi Controller nodes to the cluster.

For controller-ip, specify the management IP address of the individual Avi Controller node, not the IP address to be assigned to the cluster. The cluster IP is specified under virtual_ip.

<code>PUT /api/cluster</code>

**Example PUT Data**

<pre><code class="language-json">{
    uuid: "cluster-005056ac9e91",
    name: "cluster-0-1",
    virtual_ip: {
        type: "V4",
        addr: "10.10.5.27"
    },
    nodes: [
        {
            ip: {
                type: "V4",
                addr: "10.10.5.16"
            },
            vm_hostname: "node1.controller.local",
            vm_uuid: "005056ac9e91",
            name: "10.10.5.16",
        },
        {
            ip: {
                type: "V4",
                addr: "10.10.5.15"
            },
            name: "10.10.5.15",
        },
        {
            ip: {
                type: "V4",
                addr: "10.10.5.17"
            },
            name: "10.10.5.17",
        }
    ]
}</code>
</pre> 

### Removing Avi Controller Nodes from the Cluster

To remove Avi Controller nodes from the cluster, use a request such as the following.

<code>PUT /api/cluster</code>

**Example PUT Data**

<pre>
<code class="language-json">{
    uuid: "cluster-005056ac9e91",
    name: "cluster-0-1",
    virtual_ip: {
        type: "V4",
        addr: "10.10.5.27"
    },
    nodes: [
        {
            ip: {
                type: "V4",
                addr: "10.10.5.16"
            },
            name: "10.10.5.16",
        }
    ]
}</code>
</pre> 

### Getting Runtime Information for the Cluster

The following request gets runtime information for the cluster.

The cluster is ready for operation when the cluster_state is CLUSTER_UP_HA_ACTIVE (for a 3-node cluster) or CLUSTER_UP_NO_HA (for a 1-node cluster). This example shows CLUSTER_UP_HA_ACTIVE. (See bottom of output.)

<code>GET /api/cluster/runtime</code>

**Example Output**

<pre>
<code class="language-json">{
    node_info: {
        uuid: "005056ac115e",
        mgmt_ip: "10.10.5.15",
        has_config: "True",
        ip: "node2.controller.local",
        vm_mor: "vm-54736",
        version: "16.1.1(9014) 2016-03-26 01:05:26 UTC",
        vm_uuid: "005056ac115e"
    },
    node_states: [
        {
            up_since: "2016-03-26 16:06:21",
            state: "CLUSTER_ACTIVE",
            role: "CLUSTER_LEADER",
            name: "10.10.5.15"
        },
        {
            up_since: "2016-03-26 16:07:08",
            state: "CLUSTER_ACTIVE",
            role: "CLUSTER_FOLLOWER",
            name: "10.10.5.17"
        },
        {
            up_since: "2016-03-26 16:07:31",
            state: "CLUSTER_ACTIVE",
            role: "CLUSTER_FOLLOWER",
            name: "10.10.5.16"
        }
    ],
    service_states: [],
        cluster_state: {
        up_since: "2016-03-26 16:06:21",
        progress: 100,
        state: "CLUSTER_UP_HA_ACTIVE"
    }
}</code>
</pre> 