---
title: Updating the Configuration Following Avi Controller IP Address Change
layout: default
---
The management IP addresses of each Avi Controller node should be static. This applies to single-node deployments and 3-node deployments.

The cluster configuration and runtime configuration each contain the IP information for the cluster. If the IP address or a leader or follower node changes (for example, due to DHCP), this script must be run to update the IP information. The cluster will not function properly until the cluster configuration is updated.

If the IP address of an Avi Controller node is changed for any reason (such as DHCP), the following script must be used to update the cluster configuration. This applies to single-node deployments as well as cluster deployments.

To repair the cluster configuration after an Avi Controller node's IP address is changed, run the change_ip.py script.

The script is located in the following directory:

/opt/avi/python/bin/cluster_mgr/change_ip.py

### Script Options

The script can be run on the Avi Controller node whose management IP address changed, or on another Avi Controller node within the same cluster.

The script must be run on one of the nodes that is in the cluster. If the script is run on a node that is not in the cluster, the script will fail.

**-i *ipaddr***
Specifies the new IP address of the node on which the script is run.

**-o *ipaddr***
Specifies the IP address of another node in the cluster.

**-m *subnet-mask***
If the subnet also changed, use this option to specify the new subnet. Enter the mask in the following format: 255.255.255.0

**-g *gateway-ipaddr***
If the default gateway also changed, use this option to specify the new gateway.

Note: The **-m** and **-g** options apply to all IP addresses in the cluster.

### Updating IP Information for a Single-node Deployment

To update Avi Controller IP information for a single-node deployment, use a command string such as the following:

**change_ip.py -i***ipaddr*

**Example:**
This command is run on node 10.10.25.81. Since no other nodes are specified, this is assumed to be a single-node cluster (just this Avi Controller).
change_ip.py -i 10.10.25.81

In the following example, the node's default gateway also has changed:

change_ip.py -i 10.10.25.81 -g 10.10.10.1

### Updating IP Information for an Avi Controller Cluster

To update Avi Controller IP information for a cluster, use a command string such as the following:

**change_ip.py -i***ipaddr* **-o** *ipaddr* **-o** *ipaddr*

**Example:**
change_ip.py -i 10.10.25.81 -o 10.10.25.82 -o 10.10.25.83

This command is run on node 10.10.25.81, which is a member of a 3-node cluster that also contains nodes 10.10.25.82 and 10.10.25.83.

The script can be run on any of the nodes in the cluster. The following example is run on node 10.10.25.82:
change_ip.py -i 10.10.25.82 -o 10.10.25.81 -o 10.10.25.83