---
title: Testing Vantage with Load Generators
layout: default
---
Validating performance characteristics of Vantage or any device under test (DUT) with load generation tools is a common practice.  There are many load generators, and operating them is often more of an art than a science.

Avi has no specific preference for which load generators should be used.  Our intent and goal is for any published HTTP performance numbers to be fully repeatable via the industry standard ApacheBench (AB), which is freely available for most Linux distributions.

Avi provides an Ubuntu virtual machine, downloadable from the <a href="/docs/16.3/access-to-avi-portal/">Avi Portal</a>.  This VM includes a default web server and AB, which can be used to quickly spin up clients and servers to test Vantage load balancing and performance.

The most common issue when testing with a load generator is the client or server running out of capacity.  When this happens, responses become slow, packets are dropped, and the load generator will report the device under test did not perform well.  Load generators make no distinction in results when the bottleneck is the client, the device under test, or the server.  If the performance doubles when adding a second load generator or a second server, then its a safe assumption that the Service Engine was not the bottleneck.

This document is not a definitive guide to load generators or their optimization.  Avi strongly recommends working with one of our engineers to ensure best results.

### Load Generators Versus Real Clients

Testing with a load generator is an important step in establishing trust with a load balancer.  It is helpful to understand the behavior when a Service Engine will reach maximum capacity and the impact to connections or latency.  However, load generators are not real clients, which behave very differently.  For instance, clients connecting over a network will have some latency, while load generators often are configured for near zero latency via immediate adjacency to the device under test.

Free load generators generally are software that generate traffic and validate the timing and success of the responses.  Commercial load generators, such as Ixia or Spirent provide both the clients and servers.  With systems that include the servers, often the servers do not start until the test starts.  Service Engines health checking the servers will find them down for a few seconds after clients begin sending requests.

### Service Engine Optimization

Ensure the Service Engines to be tested have been configured with enough hardware resources to achieve the desired goals.  This includes hardware such as CPU, memory, NICs etc.  Every virtualized environment has different performance maximums, particularly in the packets per second able to be sent to a single VM.  For instance, ESX 5.5 is about 500,000/s, ESX is about 950,000/s.  See the <a href="/docs/16.3/sizing-service-engines/">Sizing Service Engines</a> KB for general guidelines on performance.

### Vantage Configuration Recommendations

The following configuration changes should be made to Avi Vantage:

* **Health monitors**:  Disable active and passive health monitors from within the pool.  This ensures there is no lag between the servers being turned on, clients sending traffic, and Vantage waiting for a successful health monitor response.
* **Slow Ramp**:  Set the pool's Slow Ramp time to 0, effectively disabling the ramp.  This ensures Vantage does not try to be gentle with servers, and sends connections as fast as it receives them.  The assumption in a load test is the clients and servers will not be the bottleneck.
* **Logs**:  Disable Non-Significant client logs if they have been enabled.  It is never recommended to attempt to log hundreds of thousands of requests per second, as there is a performance penalty for this task.  Significant logs (errors) will still be performed, which is the default state of a virtual service. 

When deploying SEs in virtual environments such as ESX:

* **Reserve CPU**
* **Reserve Memory** 

 

 

 

 
