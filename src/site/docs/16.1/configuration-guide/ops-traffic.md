---
layout: configuration-guide
title: Traffic Capture 
---

Most troubleshooting of connection or traffic data may be done quickly via Virtual Services logs. However, some troubleshooting may require full visibility into the packet transmission. Avi provides Packet Capture, which runs TCPdump against the desired Virtual Service. The packet capture is done on any Service Engines that may be hosting the VS, then collated in the completed capture. Packet capture may also be performed via the CLI.

### Capture Configuration

The Capture Configuration section shows the parameters defined for any captures that are currently in progress. To begin a new capture, select the blue pencil icon on the right of the box.

![][1]

*   **Select Virtual Service:** The capture is executed against traffic for a virtual service. The capture includes both the client-to-SE and SE-to-server sides of the connection. It will automatically be performed on all SEs handling traffic for the virtual service.

*   **All Traffic:** By default, all traffic is captured. Adding an optional filter will enable IP based filtering based on a single IP address 10.1.1.1, a space separated list, a range 10.1.1.1-10.1.1.255, or a subnet mask 10.1.1.1/24. This IP could be either the client or the server of the connection.

*   **Number of Packets / Duration:** It is highly recommended to set a limit to the duration of the capture. This limit may be either the max number of packets to receive, or the duration of time, in minutes. Once the limit has been reached, the capture will terminate and be sent to the Controller for processing and should be available shortly after.

*   **Size of Packets:** Set the number of bytes to capture per packet. This is similar to the snaplen option in TCPdump.

When the capture is started, the Capture Configuration section indicates the progress of the capture. Once the capture is complete, it may still take a few minutes for the new capture to show up in the Completed Captures, as the Controller may need to collate data from multiple SEs and format the data, which is output as a pcap file.

### Completed Captures

Once a traffic capture has completed, it will show in the Completed Captures table. This table shows the date, virtual service name and size. The far right column of the table contains an export icon, which allows administrators to download the pcap file. This file type can be viewed by common traffic capture utilities such as Wireshark.

 [1]: img/ops_traffic_capture.jpg