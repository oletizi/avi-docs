---
title: Direct Server Return
layout: default
---
Direct server return (DSR) is a performance optimization which applies to *natively* scaled out virtual service configurations. This article briefly reviews DSR, and lists the steps to turn it off when it must be disabled.

As mentioned in <a href="/autoscale-service-engines/">Autoscale Service Engines</a>, in a *natively* scaled out VS configuration, only the primary SE performs ARP for the VIP of a virtual service. Consequently, the primary SE receives all client traffic, and then load-balances some fraction of its client connections to secondary SEs in the same SE group. Those secondaries in turn balance load to back-end servers. When a back-end server responds to a request received from a secondary, the secondary's ability to efficiently respond directly back to the client is referred to as **direct server return** (DSR). Think of it as "direct SE return."

However, some environments (e.g., OpenStack) don't allow DSR — it presents a security violation. When DSR is not allowed in the network environment, tunnel mode must be enabled such that the secondary SE can respond back to the primary SE, which can then forward the packet back to the client.

Note: This limits total VS throughput from what might otherwise be expected because the primary SE must handle all incoming as well as outgoing traffic for the VS.

The CLI commands to enable tunnel mode from the shell are:

<pre><code class="language-lua">&gt;configure serviceengineproperties
&gt;se_bootup_properties
&gt;se_tunnel_mode 1
&gt;save</code></pre>  

Tunnel mode values are:

0 (default) — Automatic, based on customer environment
1 — Enable tunnel mode
2 — Disable tunnel mode

The tunnel mode setting won't take affect until the SE is rebooted. This is a global change.


<pre><code class="language-lua">&gt;reboot serviceengine</code></pre>  