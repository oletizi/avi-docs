---
title: Gateway Monitoring for Legacy HA
layout: default
---
Avi Vantage supports health monitoring of the first-hop gateways connected to Avi Service Engines (SEs.) ICMP echo packets are used to perform the health monitoring.

Gateway health monitoring is performed from both active and standby Avi SEs.

Note: The current release supports gateway health monitoring only for Avi SEs configured for <a href="/docs/16.2/legacy-ha-for-avi-service-engines/">legacy high availability (HA)</a>.

## Enabling Gateway Health Monitoring

Gateway health monitoring is part of the cloud configuration. If and when an IP address to monitor is furnished, then all legacy HA SE groups within the particular cloud perform gateway health monitoring.

### Web Interface

<ol> 
 <li>Navigate to Infrastructure &gt; Clouds.</li> 
 <li>Click the edit icon next to the name of the cloud to modify (for example, Default-Cloud).</li> 
 <li>Click Gateway Monitor.</li> 
 <li>Click Create.</li> 
 <li>Enter the gateway information, including IP address, and click Save.</li> 
</ol> 

<a href="img/gateway-monitor.png"><img class="alignnone size-full wp-image-9712" src="img/gateway-monitor.png" alt="gateway-monitor" width="525" height="232"></a>

### CLI

Use the following commands to configure monitoring for a gateway:

<pre>: &gt; configure vrfcontext global
vrfcontext&gt; gateway_mon 192.168.1.10
</pre> 

Make sure to use the IP address of the gateway where this example shows "192.168.1.10."

