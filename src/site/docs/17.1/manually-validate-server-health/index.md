---
title: Manually Validate Server Health
layout: layout163
---
It is often helpful to validate the response of a server while troubleshooting reasons a server may be marked down. The challenge is to ensure the test is from a specific Avi Service Engine, using the same tenant, network, and IP address. SEs have multiple network stacks, one for the control plane which uses Linux, and a second for the data plane. Simply logging into an SE and pinging a server will go out the management port and IP address, which may route through different infrastructure than the SE data plane.

For more info on health monitoring servers see:

* <a href="{% vpath %}/overview-of-health-monitors">Overview of Health Monitors</a>
* <a href="{% vpath %}/why-is-a-server-marked-down">Reasons a Server Can Be Marked Down</a>
* <a href="{% vpath %}/servers-flapping-up-down">Servers Flap Up / Down</a>
* <a href="{% vpath %}/health-monitor-troubleshooting">Health Monitor Troubleshooting</a>

 

### Prerequisites

<ol> 
 <li>Determine the IP address of the Service Engine hosting the virtual service.</li> 
 <li>SSH into the Avi Controller</li> 
 <li>Log into the Avi shell<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">shell</code></pre> 
  <!-- [Format Time: 0.0002 seconds] --> </li> 
</ol> 

### VMware - No Tenants

<ol> 
 <li>Connect to a Service Engine's Linux shell:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; attach serviceengine 10.10.25.28</code></pre> 
  <!-- [Format Time: 0.0003 seconds] --> </li> 
 <li>Validate the current namespace:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">admin@10-10-25-28:~$ ip netns</code></pre> 
  <!-- [Format Time: 0.0003 seconds] --> Usual output is avi_ns1, which is the default namespace.</li> 
 <li>Execute a static health check from this namespace. See examples at the end of this article.</li> 
</ol> 

### VMware - Multiple Tenants

For multiple tenants on VMware, Avi Vantage does not create VRFs/namespaces by default.
<ol> 
 <li>Attach to the Service Engine Linux shell:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; attach serviceengine 10.10.25.28</code></pre> 
  <!-- [Format Time: 0.0003 seconds] --> </li> 
 <li>Execute a static health check. See examples at the end of this article.</li> 
</ol> 

### Multiple Tenants with VRF (Provider Mode)

<ol> 
 <li>Find the namespace/VRF for the pool server:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; show pool p1 detail  | grep vrf_id
 | vrf_id   | 2</code></pre> 
  <!-- [Format Time: 0.0004 seconds] --> In this case, the vrf_id is 2, and the namespace is avi_ns2.<br> This information can also be obtained from:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; show serviceengine 10.10.25.28 vnicdb</code></pre> 
  <!-- [Format Time: 0.0003 seconds] --> </li> 
 <li>If there are multiple SEs, find the vrf-id on the specific SE:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">show pool p1 detail | filter disable_aggregate se  se_ref 10.10.25.28
| vrf_id   | 2</code></pre> 
  <!-- [Format Time: 0.0004 seconds] --> </li> 
 <li>Attach to the Service Engine Linux shell:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; attach serviceengine 10.10.25.28</code></pre> 
  <!-- [Format Time: 0.0002 seconds] --> </li> 
 <li>Execute a static health check from this namespace. See examples at the end of this article.</li> 
</ol> 

### Bare Metal / Linux Cloud

For bare-metal Linux clouds, there are no namespaces, reducing the necessary steps.
<ol> 
 <li>Attach to the Service Engine Linux shell:<br> 
  <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">: &gt; attach serviceengine 10.10.25.28</code></pre> 
  <!-- [Format Time: 0.0002 seconds] --> </li> 
 <li>Execute a static health check. See examples at the end of this article.</li> 
</ol> 

### Common Manual Server Checks

Ping:

<pre><code class="language-lua">root@test-se2:~# ip netns exec avi_ns1 ping 10.90.15.62
 PING 10.90.15.62 (10.90.15.62) 56(84) bytes of data.
 64 bytes from 10.90.15.62: icmp_seq=1 ttl=64 time=26.8 ms</code></pre>  

Curl:

<pre><code class="language-lua">root@test-se2:~# ip netns exec avi_ns1 curl 10.90.15.62
 curl:  Failed to connect to 10.90.15.62 port 80: Connection refused

 root@test-se2:~# ip netns exec avi_ns1 curl 10.90.15.62:8000Welcome - Served from port 80!</code></pre>  

Note: This step is not necessary when the SE is on a Docker + bare-metal setup and the Docker container itself exists in a namespace.

# Welcome!

 

 


<pre><code class="language-lua">root@test-se2:~#</code></pre>  