---
title: SNAT Source Port Exhuastion
layout: layout163
---
Typically, connections between an Avi Service Engine (SE) and destination servers are translated using source NAT (SNAT). Avi Vantage uses SNAT to translate the source IP address of the connection from the client address into the IP address of the SE. A connection is considered unique if any combination of the client source IP (for SNATed connections, the SE IP) and protocol port plus the server destination IP and port are unique. For typical application traffic, the source port from an Avi SE is unique for each SNATed TCP connection. When SNAT is used, an SE can open up to 64k connections to each destination server. Every new server added to a pool adds 64k potential concurrent connections. If a virtual service is scaled across multiple SEs, each SE can maintain a maximum of 64k SNATed connections to each server.
