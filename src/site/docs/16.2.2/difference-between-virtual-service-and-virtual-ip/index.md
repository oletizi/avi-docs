---
title: Difference Between Virtual Service and Virtual IP
layout: default
---
Avi Vantage uses virtual services and Virtual IP Addresses (VIPs). These are related but separate things.

* **Virtual IP (VIP):** a single IP address owned and advertised by a Service Engine (SE).
* **Virtual Service:** a VIP plus a specific Layer 4 protocol port (or ports) that are used to proxy an application. A single VIP can have multiple virtual services. As an example, all the following virtual services can exist on a single VIP:

* 192.168.1.1:80,443  (HTTP/S)
* 192.168.1.1:20,21  (FTP)
* 192.168.1.1:53  (DNS)

The VIP in this example is 192.168.1.1. The services are HTTPS, FTP, and DNS. Thus, VS HTTPS is advertised with address 192.168.1.1:80,443, which is the VIP plus protocol port 443.

The VIP concept is important in Avi Vantage, because a given IP address can be advertised (ARPed) from only a single SE. If the SE that owns a VIP is busy and needs to migrate a virtual service's traffic to a less busy SE, then all the VSs are moved from the busy SE to the same new (less busy) SE. If an SE were to fail, all of its virtual services would be moved to a single SE. This is true even if there are multiple idle SEs available in the SE Group.