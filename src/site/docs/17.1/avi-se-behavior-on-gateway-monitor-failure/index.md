---
title: Avi SE Behavior On Gateway Monitor Failure
layout: layout171
---
<a href="{% vpath %}/gateway-monitoring-for-legacy-ha">Legacy high availability (HA) includes support for gateway monitoring</a>. Avi Service Engines (SEs) taking on either active or standby roles for a virtual service in a legacy HA deployment can perform gateway monitoring. By default, gateway monitoring is off until an IP address to monitor is furnished for the cloud. When an IP address is furnished, all legacy HA SE groups within the cloud perform gateway monitoring.

This article describes issues that can occur, and the Vantage behavior in response to these issues, when gateway monitor is enabled via either the UI or CLI.

### Gateway is not reachable from active Avi SE but is reachable from standby Avi SE 

If only the standby Avi SE for a virtual service can reach the gateway, the active SE becomes standby and the standby SE becomes active. When the gateway reachability is restored on the standby SE, it stays in standby state.

### Gateway is not reachable from standby Avi SE but is reachable from active Avi SE 

The active Avi SE for the virtual service remains active and the standby Avi SE remains in standby state. When gateway reachability is restored on the standby SE, the SE stays in standby state.

### Active Avi SE loses gateway connectivity after standby Avi SE has lost gateway connectivity 

The active Avi SE for the virtual service remains active and the standby Avi SE remains in standby state.

### Both the active Avi SE and the standby Avi SE simultaneously lose gateway reachability

The active Avi SE for the virtual service remains active and the standby Avi SE remains in standby state.

 

Note: Even when the gateway monitor shows that gateway connectivity is down, the Avi SEs remain operationally up.

 

### With multiple gateway monitors, at least one gateway is not reachable from active Avi SE, but all gateways reachable from standby Avi SE

This results in switch over of all the virtual services on the current active SE, to standby SE.
