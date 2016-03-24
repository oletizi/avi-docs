---
layout: cli-guide
title: Common Tasks
---

### Virtual Service and Pool Creation

When creating a new Virtual Service, it will need to point to a Pool, which is expected to be pre-created. From the GUI using basic mode, this is done via a single operation. From the CLI, this is explicitly performed as two tasks.

<pre class="console">: &gt; <strong>configure pool Test</strong>
: pool&gt; <strong>servers ip 10.1.1.100 port 80 </strong>
: pool:servers&gt; <strong>save</strong>
: pool&gt; <strong>servers ip 10.1.1.101 port 80</strong>
: pool:servers&gt; <strong>save</strong>
: pool&gt; <strong>where</strong>
Tenant: admin 
+------------+------------+
| Field      | Value      | 
+------------+------------+
| name       | Test       |
| servers[1] |            |
| ip         | 10.1.1.100 | 
| port       | 80         |
| servers[2] |            |
| ip         | 10.1.1.101 | 
|port        | 80         | 
+------------+------------+
: pool&gt; <strong>save</strong></pre>

Once the Pool is created, the next step is to create the new Virtual Service.

<pre class="console">: &gt; <strong>configure virtualservice Test_VS</strong>
: virtualservice&gt; <strong>address 10.10.10.10</strong> 
: virtualservice&gt; <strong>services port 80</strong>
: virtualservice&gt; <strong>pool_ref Test</strong>
</pre>

### Modify Pool Servers

A common task is to add and remove servers from an existing pool, or to enable or disable servers within the pool. While servers may be added to a pool without specifying a port (they will inherit the port of the pool or Virtual Service), the CLI requires the IP and Port to manipulate the server for tasks such as enable and disable.

The following commands will delete the .101 server and add a new .102 server to the pool Test.

<pre class="console">: &gt; <strong>configure pool Test</strong>
: pool&gt; <strong>no servers ip 10.1.1.101 port 80</strong>
: pool&gt; <strong>servers ip 10.1.1.102 port 80</strong>
: pool:servers&gt; <strong>save</strong>
</pre>

The following commands will enter the sub-mode for the .100 server and disable it.

<pre class="console">: pool:servers&gt; <strong>ip 10.1.1.100 port 80 </strong>
: pool:servers&gt; <strong>where</strong>
Tenant: admin
+-------+------------+
| Field | Value      | 
+-------+------------+
| ip    | 10.1.1.100 |
| port  | 80         | 
+-------+------------+
: pool:servers&gt; <strong>no enabled</strong>
+---------+------------+
| Field   | Value      | 
+---------+------------+ 
| ip      | 10.1.1.100 | 
| port    | 80         | 
| enabled | False      | 
+---------+------------+ 
: pool:servers&gt; <strong>save</strong>
</pre>

### Export / Import Configuration

The Avi Controller has a database to store its configuration information. This includes all configuration related to Tenant, Virtual Services, Pools, Policies and Accounts. Export this configuration as a JSON file for backup or to migrate parts of the config to another Avi Controller.

The configuration may be backed up or moved to another Controller cluster via the CLI. The exported configuration may be the entire system configuration, a more limited version based on the access rights of the current user and tenant of the administrator, or it may be a single Virtual Service and its child properties.

To export only a single Virtual Service and its child objects, such as Pools, use the `virtualservice` flag instead of the `configuration` flag with the export command.

The following commands will export the configuration to a file named `config_export`, SCP it to a remote location, then return to the Avi shell.

<pre class="console">: &gt; <strong>export configuration file config_export</strong>
Completed writing the export configuration to config_export 
: &gt; <strong>bash</strong>

admin@Avi-Controller:~$ <strong>pwd</strong>
/home/admin
admin@Avi-Controller:~$ <strong>ls</strong>
config_export
admin@Avi-Controller:~$ <strong>scp ./config_export root@10.1.1.1:/root</strong>
root@10.1.1.1's password:
config_export                                  100% 232KB 431.8KB/s 00:00 
admin@Avi-Controller:~$ <strong>exit</strong>
:&gt;
</pre>

Before starting a configuration import, ensure that all Controller members of the cluster are up and the cluster leader has the following configuration:

*   Admin account
*   Cluster configuration
*   OpenStack infrastructure (OpenStack only)

The following commands will import a backed up configuration to a Controller cluster.

<pre class="console">: &gt; <strong>import configuration file /home/admin/myconfig keep_uuid</strong>
Successfully imported the configuration file
</pre>

You can restore this configuration information to an empty Avi Controller. The restoration steps may look like:

*   Deploy 3 new Controller nodes; the image type (OVA, qcow2, ami) should match that of the original Controller node from which the configuration was exported.
*   Choose one Controller as a leader and go through the initial setup page to enter the initial setup information and the redundant Controller cluster information.
*   Use the CLI or API to import the configuration.

After these steps, the cluster will be back to the same running state as the original one.

### Packet Capture

The Avi Controller provides a convenient mechanism to capture data plane traffic processed by Service Engines. An administrator can initiate a capture command from the Avi Controller CLI, while the actual capture occurs on the Service Engine. The packet capture is saved in the pcap format on the Controller. The Service Engine captures packets intelligently on both client side and server side of the SE. If a Virtual Service is scaled across multiple Service Engines, then all applicable SEs will participate in the packet capture. The Controller will aggregate the captures and sort the entries according to time. Once a capture is complete, it is commonly uploaded to a PC or other system for analysis with an appropriate tool such as TCPdump or Wireshark.

Enter the packet capture sub-mode for the specified Virtual Service:

<pre class="console">: &gt; <strong>debug virtualservice Test-VS</strong>
Updating an existing object. Currently, the object is: 
+-------+--------------------+
| Field | Value              | 
+-------+--------------------+
| uuid  | virtualservice-0-1 |
| name  | Test-VS            | 
+-------+--------------------+
</pre>

Parameters may be defined for the packet capture. By default, the capture is performed within the context of the selected
Virtual Service. It is also performed on all Service Engines that are handling the VS traffic, and includes the packets 
from the client and server side of the SE. 

|                           |                                                                |
| ------------------------- | -------------------------------------------------------------- |
| `capture_params duration` | Time, in minutes. Default is unlimited.                        |
| `capture_params num_pkts` | Maximum number of packets to collect. Default is unlimited.    |
| `capture_params pkt_size` | Packet size, or snap length, to capture. Default is unlimited. |
|                           |                                                                |
| `debug_ip addrs`          | IP4 Address format <x.x.x.x>                                   |
| `debug_ip prefixes`       | IP4 Prefix format <x.x.x.x/x>                                  |


The `debug_ip` command enters a sub-mode. This allows multiple IP addresses or IP subnets to be entered (omit the `debug_ip` for subsequent entries). Save to commit the desired IPs and return to the previous menu.

> **Warning:** By default, no maximum packets or duration of time to be captured are defined. It is recommended to include a maximum packet capture as shown in the following example. Without a limit, the capture will run until filling the Service Engine disk, potentially disrupting service.

Specify parameters, including the max number of packets to capture:

<pre class="console">: debugvirtualservice&gt; <strong>capture_params num_pkts 1000</strong>
: debugvirtualservice&gt; <strong>debug_ip addrs 10.10.10.10</strong>
: debugvirtualservice:debug_ip&gt; <strong>save</strong>
</pre>

Begin capturing based on the previously configured parameters:

<pre class="console">: debugvirtualservice&gt; capture
: debugvirtualservice&gt; save 
+----------------+--------------------+ 
| Field          | Value              | 
+----------------+--------------------+
| uuid           | virtualservice-0-1 |
| name           | Test-VS            |
| debug_ip       |                    |
|   addrs[1]     | 10.10.10.10        |
| capture        | True               |
| capture_params |                    |
|   duration     | 0 mins             |
|   num_pkts     | 1000               | 
+----------------+--------------------+
</pre>

Re-enter the packet capture sub-mode and stop an ongoing packet capture:

<pre class="console">: &gt; <strong>debug virtualservice Test-VS</strong>
: debugvirtualservice&gt; <strong>no capture</strong>
: debugvirtualservice&gt; <strong>save</strong>
</pre>

Export the packet capture to a remote system that can view it via a tool such as TCPdump or Wireshark:

<pre class="console">: &gt; <strong>show debug virtualservice Test-VS capture</strong>
Please specify the destination directory: <strong>/tmp</strong>
Downloaded the attachment to /tmp/vs_virtualservice.20141205_192033.pcap
: &gt; <strong>bash</strong>
root@Avi-CTRL:~# <strong>scp /tmp/vs_virtualservice.192033.pcap user@10.1.1.1:/tmp</strong>
</pre>

### Monitor Concurrent Connections to a Server

To track the number of a concurrent connections to a server, the server must be viewed within the context of a Pool. By prepending the `watch` command in front of the `show`, it is possible to see a near real-time updates of the connection count. Keep in mind there is some delay between the time the connection is established and the polling interval when the SE sends information back to the Controller. Cancel the `watch` with `Ctl-C`.

<pre class="console">: &gt; <strong>watch show pool Test-pool server detail | grep -e 'ip\|open_conns'</strong>
| ip_addr      | 10.1.1.17 | 
|   open_conns | 50        | 
| ip_addr      | 10.1.1.16 |
|   open_conns | 49        |

</pre>