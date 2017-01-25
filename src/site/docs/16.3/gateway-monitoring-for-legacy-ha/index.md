---
title: Gateway Monitoring for Legacy HA
layout: 16.3
---
Avi Vantage supports health monitoring of the first-hop gateways connected to Avi Service Engines (SEs). ICMP echo packets are used to perform the health monitoring.

Gateway health monitoring is performed from both active and standby Avi SEs.

Notes:

* The current release supports gateway health monitoring only for Avi SEs configured for <a href="/docs/16.3/legacy-ha-for-avi-service-engines/">legacy high availability (HA)</a>.
* Another article of interest:  <a href="/docs/16.3/avi-se-behavior-on-gateway-monitor-failure/">Avi SE Behavior on Gateway Monitor Failure</a> 

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
<a name="multiple-gw-monitors"></a>

### CLI

Use the following commands to configure monitoring for a gateway:

<code>:&gt; configure vrfcontext global<br> <code>vrfcontext&gt; gateway_mon 192.168.1.10</code></code>

Make sure to use the IP address of the gateway where this example shows "192.168.1.10."

### Enhancements in Avi Vantage release 16.2.3

Beginning with the 16.2.3 release, it is possible to configure multiple gateway monitors.  This is typically useful in two-armed deployment where the first-hop gateway used for front-end and back-end connections are different.

Switchover of the virtual service is triggered if failure is detected in at least one gateway.
