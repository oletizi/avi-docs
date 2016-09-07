---
title: Packet Capture
layout: default
---
Most troubleshooting of connection or traffic data may be done quickly via virtual service logs. However, some troubleshooting may require full visibility into the packet transmission. Vantage provides a packet capture feature, which runs TCPdump against a designated virtual service.

Virtual services may exist on a single Avi Service Engine (SE) or may be scaled out across multiple active Avi SEs. Traffic captures will automatically be executed on all Avi SEs actively handling traffic for the virtual service. Once the captures are complete, the Avi SEs forward their pcap files to the Controller, which aggregates and sorts the data into a single file containing client and server sides of Vantage.

## Capture Configuration

The following sections describe how to configure and start a packet capture.

Note: It is highly recommended to set a limit to the duration of the capture. This limit may be either the maximum number of packets to receive, or the duration of time, in minutes. Once the limit has been reached, the capture will terminate and be sent to the Avi Controller for processing and should be available shortly after.

### Web Interface

Navigate to Operations > Traffic Capture. The Capture Configuration section shows the parameters defined for any captures that are currently in progress. To begin a new capture, select the edit icon on the right of the box.

<a href="img/packet-capture2.png"><img src="img/packet-capture2.png" alt="packet-capture2" width="1121" height="553"></a>

* **Select Virtual Service**:  The capture is executed against traffic for a virtual service. The capture includes both the client-to-SE and SE-to-server sides of the connection. It will automatically be performed on all Avi SEs handling traffic for the virtual service.
* **Filter to Capture**

* **All Traffic**: Captures all traffic.
* **Choose Client IP, IP Range, Subnet Mask**: Captures traffic only for the specified IP address, list or range of IP addresses, or subnet. The IP addresses can be client or server addresses.

* To specify a list, use a space between each address. For example: 10.1.1.1 10.1.1.99 192.168.8.200
* To specify a range, use the following format: 10.1.1.1-10.1.1.255
* To specify a subnet, use the following format: 10.1.1.1/24.
* **Number of Packets**: Maximum number of packets to capture, per core.
* **Duration**: Number of minutes during which to capture packets.
* **Size of Packets**: Number of bytes to capture per packet. This is similar to the snaplen option in TCPdump. To capture entire packets, enter 0.

* **Advanced Settings**

* **Health Monitor Options:** Indicates whether to capture packets from health checks.

* None: Excludes health monitoring traffic (the default)
* Include: Includes health monitoring traffic
* Only: Captures only health monitoring traffic

When the capture is started, the Capture Configuration section indicates the progress of the capture. Once the capture is complete, it may still take a few minutes for the new capture to show up in the Completed Captures, as the Avi Controller may need to collate data from multiple Avi SEs and format the data, which is output as a pcap file.

### Completed Captures

Once a traffic capture has completed, it will show in the Completed Captures table. This table shows the date, virtual service name and size. The far right column of the table contains an export icon, which allows administrators to download the pcap file. This file type can be viewed by common traffic capture utilities such as Wireshark.

### Packet Capture Via CLI

To capture packets via the CLI, log into the Vantage CLI shell, then enter the packet capture sub-mode for the desired virtual service:
debug virtualservice Test-virtual service Updating an existing object. Currently, the object is: +-------+--------------------+ | Field | Value | +-------+--------------------+ | uuid | virtualservice-0-1 | | name | Test-virtual service | +-------+--------------------+  

Parameters may be defined for the packet capture. By default, the capture is performed within the context of the selected virtual service. It is also performed on all Avi SEs that are handling the virtual service traffic, and includes the packets from the client and server side of the Avi SE.

capture_params duration
 Time, in minutes. Default is unlimited. capture_params num_pkts
 Maximum number of packets to collect. Default is unlimited. capture_params pkt_size
 Packet size, or snap length, to capture. Default is unlimited. debug_ip addrs
 IPv4 Address format debug_ip prefixes
 IPv4 Prefix format <x.x.x.x/x> debug_virtual service_hm_include
 Include health monitor packets in the capture debug_virtual service_hm_none
 Omit health monitor packets from the capture (the default) debug_virtual service_hm_only
 Capture only health monitor packets

The *debug_ip* command enters a sub-mode. This allows multiple IP addresses or IP subnets to be entered. (Omit the *debug_ip* option for for subsequent entries.) Save to commit the desired IPs and return to the previous menu.

**Warning**:  By default, no maximum packets or duration of time to be captured are defined. It is recommended to include a maximum packet capture as shown in the following example. Without a limit, the capture will run until filling the Avi SE drive, potentially disrupting service.

Specify parameters, including the maximum number of packets to capture:
debugvirtualservice> capture_params num_pkts 1000 debugvirtualservice> debug_ip addrs 10.10.10.10 debugvirtualservice:debug_ip> save  

Begin capturing based on the previously configured parameters:

debugvirtualservice> capture debugvirtualservice> save +----------------+--------------------+ | Field | Value | +----------------+--------------------+ | uuid | virtualservice-0-1 | | name | Test-VS | | debug_ip | | | addrs[1] | 10.10.10.10 | | capture | True | | capture_params | | | duration | 0 mins | | num_pkts | 1000 | +----------------+--------------------+  

Re-enter the packet capture sub-mode and stop an ongoing packet capture:

debug virtualservice Test-virtual service debugvirtualservice> no capture debugvirtualservice> save  

Export the packet capture to a remote system that can view it via a tool such as TCPdump or Wireshark:

show debug virtualservice Test-virtual service capture Please specify the destination directory: /tmp Downloaded the attachment to /tmp/virtual service_virtualservice.20141205_192033.pcap bash  
 
scp /tmp/virtual service_virtualservice.192033.pcap user@10.1.1.1:/tmp