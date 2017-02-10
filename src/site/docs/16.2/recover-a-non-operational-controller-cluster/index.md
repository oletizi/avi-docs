---
title: Recover a Non-Operational Controller Cluster
layout: layout162
---
In the case where two of the three Controller nodes within a cluster are permanently down and not recoverable, the remaining Controller node in the cluster will be marked operationally down due to the lack of cluster quorum. Note that all Service Engines will continue to operate in a headless fashion. The following steps can be used to return to a fully redundant three node cluster.

To recover the cluster, the remaining healthy Controller node needs to first be converted to a single-node cluster. After this, you are able to add two new nodes to the cluster.

To convert this remaining Controller node to a single-node cluster while preserving configuration, execute the following command:

<pre class="command-line language-bash" data-prompt="root@avi-controller#"><code>/opt/avi/python/bin/cluster_mgr/recover.py</code></pre> 

The script may take several minutes to successfully complete. Once the script finishes, you will be able to log in to the Controller node as a single node cluster. To make this into a fully redundant three node cluster, add two new, unconfigured Controllers nodes to the cluster.

