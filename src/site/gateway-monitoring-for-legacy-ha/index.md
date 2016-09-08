---
title: Gateway Monitoring for Legacy HA
layout: default
---
Avi Vantage supports health monitoring of the first-hop gateways connected to Avi Service Engines (SEs.) ICMP echo packets are used to perform the health monitoring.

Gateway health monitoring is performed from both active and standby Avi SEs.

Note: The current release supports gateway health monitoring only for Avi SEs configured for <a href="/legacy-ha/">legacy high availability (HA)</a>.

## Enabling Gateway Health Monitoring

Gateway health monitoring is part of the cloud configuration. If and when an IP address to monitor is furnished, then all legacy HA SE groups within the particular cloud perform gateway health monitoring.

### Web Interface

1. Navigate to Infrastructure > Clouds.
1. Click the edit icon next to the name of the cloud to modify (for example, Default-Cloud).
1. Click Gateway Monitor.
1. Click Create.
1. Enter the gateway information, including IP address, and click Save.

<a href="img/gateway-monitor.png"><img src="img/gateway-monitor.png" alt="gateway-monitor" width="525" height="232"></a>

### CLI

Use the following commands to configure monitoring for a gateway:
<pre crayon="false">: &gt; configure vrfcontext global
vrfcontext&gt; gateway_mon 192.168.1.10
</pre>

Make sure to use the IP address of the gateway where this example shows "192.168.1.10."