---
title: MAC Masquerade
layout: layout163
---
As of release 16.3.2, Avi Vantage supports MAC masquerade, for use in conjunction with <a href="{% vpath %}/default-gateway-ip-routing-on-avi-se/">Avi SE IP routing</a>, to accelerate <a href="{% vpath %}/legacy-ha-for-avi-service-engines/">legacy HA SE</a> failover in Linux server clouds. The delay in failover that otherwise may occur is attributed to back-end servers clinging to the MAC address of the interface of the previously active SE while they wait to learn the new MAC address from the newly active SE.

For such cases, MAC masquerade facilitates the use of a virtual MAC. Back-end servers are made to learn the virtual MAC for reachability of SE through the floating IP. Upon failover, just as the floating interface IP moves from the failed SE to the new active SE, so does the virtual MAC, enabling back-end servers to reach the correct SE as soon as the floating IP is moved to the new active SE.

Since the feature is applicable only when <a href="{% vpath %}/default-gateway-ip-routing-on-avi-se/">IP-routing</a> is enabled, all constraints applicable to IP routing are applicable here. Additionally, the feature is only supported for DPDK-based bare-metal deployments.

### CLI Interface

Following command-line interface enables the feature under <code>serviceenginegroup</code> configuration:


<pre><code class="language-lua">[admin:10-140-1-4]: &gt; configure serviceenginegroup Default-Group
[admin:10-140-1-4]: serviceenginegroup&gt; enable_vmac
Overwriting the previously entered value for enable_vmac
[admin:10-140-1-4]: serviceenginegroup&gt; save
[admin:10-140-1-4]: &gt;</code></pre>  To disable the feature, use the no-form of the CLI: 

<pre><code class="language-lua">[admin:10-140-1-4]: &gt; configure serviceenginegroup Default-Group
[admin:10-140-1-4]: serviceenginegroup&gt; no enable_vmac
[admin:10-140-1-4]: serviceenginegroup&gt; save
[admin:10-140-1-4]: &gt;</code></pre>  