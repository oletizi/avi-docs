---
title: Common CLI Tasks
layout: layout171
---
This KB provides illustrated examples of executing common management tasks from the Avi Vantage CLI.

## Virtual Service and Pool Creation

When creating a new virtual service, it will need to point to a pool, which is expected to be pre-created. From the GUI using the basic mode wizard, this is done via a single operation. From the CLI, this is explicitly performed as two tasks.

<pre class="command-line language-bash" data-prompt="2,4,6,19|pool> ;3,5|pool:servers> " data-output="7-18"><code><strong>configure pool Test</strong>
<strong>servers ip 10.1.1.100 port 80 </strong>
<strong>save</strong>
<strong>servers ip 10.1.1.101 port 80</strong>
<strong>save</strong>
<strong>where</strong>
Tenant: admin
+------------+------------+
| Field | Value |
+------------+------------+
| name | Test |
| servers[1] | |
| ip | 10.1.1.100 |
| port | 80 |
| servers[2] | |
| ip | 10.1.1.101 |
|port | 80 |
+------------+------------+
<strong>save</strong></code></pre> 

Once the pool is created, the next step is to create the new virtual service.

<pre class="command-line language-bash" data-prompt="2-5|virtualservice> "><code><strong>configure virtualservice Test_VS</strong>
<strong>address 10.10.10.10</strong>
<strong>services port 80</strong>
<strong>pool_ref Test</strong></code></pre> 

## Modify Pool Servers

A common task is to add and remove servers from an existing pool, or to enable or disable servers within the pool. While servers may be added to a pool without specifying a port (they will inherit the port of the pool or virtual service), the CLI requires the IP and port to manipulate the server for tasks such as enable and disable.

The following commands will delete the .101 server and add a new .102 server to the pool Test.

<pre class="command-line language-bash" data-prompt="2,3|pool> ;4|pool:servers> "><code><strong>configure pool Test</strong>
<strong>no servers ip 10.1.1.101 port 80</strong>
<strong>servers ip 10.1.1.102 port 80</strong>
<strong>save</strong></code></pre> 

The following commands will enter the sub-mode for the .100 server and disable it.

<pre class="command-line language-bash" data-prompt="1-2,10,18|pool:servers> " data-output="3-9,11-17"><code><strong>ip 10.1.1.100 port 80 </strong>
<strong>where</strong>
Tenant: admin
+-------+------------+
| Field | Value |
+-------+------------+
| ip | 10.1.1.100 |
| port | 80 |
+-------+------------+
<strong>no enabled</strong>
+---------+------------+
| Field | Value |
+---------+------------+
| ip | 10.1.1.100 |
| port | 80 |
| enabled | False |
+---------+------------+
<strong>save</strong></code></pre> 

## Export / Import Configuration

The Avi Controller has a database to store its configuration information. This includes all configuration related to tenant, virtual services, pools, policies and accounts. Export this configuration as a JSON file for backup or to migrate parts of the config to another Avi Controller.

The configuration may be backed up or moved to another Controller cluster via the CLI. The exported configuration may be the entire system configuration, a more limited version based on the access rights of the current user and tenant of the administrator, or it may be a single virtual service and its child properties.

To export only a single virtual service and its child objects, such as pools, use the <code>virtualservice</code> flag instead of the <code>configuration</code> flag with the export command.

The following commands will export the configuration to a file named <code>config_export</code>, SCP it to a remote location, then return to the Avi Vantage shell.

<pre class="command-line language-bash" data-prompt="5,7,9,12|admin@avi-controller:~$ " data-output="2,4,6,8,10,11"><code><strong>export configuration file config_export</strong>
Completed writing the export configuration to config_export
<strong>bash</strong>

<strong>pwd</strong>
/home/admin
<strong>ls</strong>
config_export
<strong>scp ./config_export root@10.1.1.1:/root</strong>
root@10.1.1.1's password:
config_export 100% 232KB 431.8KB/s 00:00
<strong>exit</strong></code></pre> 

Before starting a configuration import, ensure that all Controller members of the cluster are up and the cluster leader has the following configuration:

* Admin account
* Cluster configuration
* OpenStack infrastructure (OpenStack only) 

The following commands will import a backed up configuration to a Controller cluster.

<pre class="command-line language-bash" data-prompt=": >" data-output="2"><code><strong>import configuration file /home/admin/myconfig keep_uuid</strong>
Successfully imported the configuration file</code></pre> 

You can restore this configuration information to an empty Avi Controller. The restoration steps may look like:

* Deploy 3 new Controller nodes; the image type (OVA, qcow2, ami) should match that of the original Controller node from which the configuration was exported.
* Choose one Controller as a leader and go through the initial setup page to enter the initial setup information and the redundant Controller cluster information.
* Use the CLI or API to import the configuration. 

After these steps, the cluster will be back to the same running state as the original one.

## Packet Capture

The Avi Controller provides a convenient mechanism to capture data plane traffic processed by Service Engines. An administrator can initiate a capture command from the Avi Controller CLI, while the actual capture occurs on the Service Engine. The packet capture is saved in the pcap format on the Controller. The Service Engine captures packets intelligently on both client side and server side of the SE. If a virtual service is scaled across multiple Service Engines, then all applicable SEs will participate in the packet capture. The Controller will aggregate the captures and sort the entries according to time. Once a capture is complete, it is commonly uploaded to a PC or other system for analysis with an appropriate tool such as tcpdump or Wireshark.

Enter the packet capture sub-mode for the specified virtual service:

<pre class="command-line language-bash" data-prompt=": >" data-output="2-99"><code><strong>debug virtualservice Test-VS</strong>
Updating an existing object. Currently, the object is:
+-------+--------------------+
| Field | Value |
+-------+--------------------+
| uuid | virtualservice-0-1 |
| name | Test-VS |
+-------+--------------------+</code></pre> Parameters may be defined for the packet capture. By default, the capture is performed within the context of the selected virtual service. It is also performed on all Service Engines that are handling the VS traffic, and includes the packets from the client and server side of the SE. 

<table class="table table-hover table table-bordered table-hover">   
<thead>  
<tr>   
<th>
</th>
<th>
</th>
</tr>
</thead>
<tbody>      
<tr>   
<td><code>capture_params duration</code></td>
<td>Time, in minutes. Default is unlimited.</td>
</tr>
<tr>   
<td><code>capture_params num_pkts</code></td>
<td>Maximum number of packets to collect. Default is unlimited.</td>
</tr>
<tr>   
<td><code>capture_params pkt_size</code></td>
<td>Packet size, or snap length, to capture. Default is unlimited.</td>
</tr>
<tr>   
<td><code>debug_ip addrs</code></td>
<td>IP4 Address format &lt;x.x.x.x&gt;</td>
</tr>
<tr>   
<td><code>debug_ip prefixes</code></td>
<td>IP4 Prefix format &lt;x.x.x.x/x&gt;</td>
</tr>
</tbody>
</table> 

The <code>debug_ip</code> command enters a sub-mode. This allows multiple IP addresses or IP subnets to be entered (omit the <code>debug_ip</code> for subsequent entries). Save to commit the desired IPs and return to the previous menu.

> <strong>Warning:</strong> By default, no maximum packets or duration of time to be captured are defined. It is recommended to include a maximum packet capture as shown in the following example. Without a limit, the capture will run until filling the Service Engine disk, potentially disrupting service.
 

Specify parameters, including the maximum number of packets to capture:

<pre class="command-line language-bash" data-prompt="1-2|debugvirtualservice> ;3|debugvirtualservice:debug_ip> "><code><strong>capture_params num_pkts 1000</strong>
<strong>debug_ip addrs 10.10.10.10</strong>
<strong>save</strong></code></pre> 

Begin capturing based on the previously configured parameters:

<pre class="command-line language-bash" data-prompt="1,2|debugvirtualservice> " data-output="3-14"><code>capture
save
+----------------+--------------------+
| Field | Value |
+----------------+--------------------+
| uuid | virtualservice-0-1 |
| name | Test-VS |
| debug_ip | |
| addrs[1] | 10.10.10.10 |
| capture | True |
| capture_params | |
| duration | 0 mins |
| num_pkts | 1000 |
+----------------+--------------------+</code></pre> 

Re-enter the packet capture sub-mode and stop an ongoing packet capture:

<pre class="command-line language-bash" data-prompt="2,3|debugvirtualservice> "><code><strong>debug virtualservice Test-VS</strong>
<strong>no capture</strong>
<strong>save</strong></code></pre> 

Export the packet capture to a remote system that can view it via a tool such as tcpdump or Wireshark:

<pre class="command-line language-bash" data-prompt="5|root@avi-controller:~$ " data-output="2,3"><code><strong>show debug virtualservice Test-VS capture</strong>
Please specify the destination directory: <strong>/tmp</strong>
Downloaded the attachment to /tmp/vs_virtualservice.20141205_192033.pcap
<strong>bash</strong>
<strong>scp /tmp/vs_virtualservice.192033.pcap user@10.1.1.1:/tmp</strong></code></pre> 

## Monitor Concurrent Connections to a Server

To track the number of a concurrent connections to a server, the server must be viewed within the context of a pool. By prepending the <code>watch</code> command in front of the <code>show</code>, it is possible to see a near real-time updates of the connection count. Keep in mind there is some delay between the time the connection is established and the polling interval when the SE sends information back to the Controller. Cancel the <code>watch</code> with <code>Ctl-C</code>.

<pre class="command-line language-bash" data-prompt=": >" data-output="2-5"><code><strong>watch show pool Test-pool server detail | grep -e 'ip\|open_conns'</strong>
| ip_addr | 10.1.1.17 |
| open_conns | 50 |
| ip_addr | 10.1.1.16 |
| open_conns | 49 |</code></pre> 