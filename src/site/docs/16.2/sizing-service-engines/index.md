---
title: Sizing Service Engines
layout: default
---
Avi publishes *minimum* and *recommended* resource requirements for new Avi Service Engines.  These are somewhat abstract numbers though, as network and application traffic may vary dramatically.  This guide provides some guidance on sizing.  Avi recommends consulting with your local Avi sales engineer for more recommendation that is tailored to the exact requirements.

<table class=" table table-bordered table-hover">   
<tbody>       
<tr>   
<td></td>
<td>1 CPU core</td>
</tr>
<tr>   
<td>Throughput</td>
<td>4 Gb/s</td>
</tr>
<tr>   
<td>Connections/s</td>
<td>40k</td>
</tr>
<tr>   
<td>SSL Tput</td>
<td>1 Gb/s</td>
</tr>
<tr>   
<td>SSL TPS (RSA)</td>
<td>500</td>
</tr>
<tr>   
<td>SSL TPS (ECC)</td>
<td>2000</td>
</tr>
</tbody>
</table> 

 

Multiple performance vectors or features may have an impact on performance.  For instance, to achieve 1 Gb/s of SSL throughput and 2000 TPS of SSL with EC certificates, Avi recommends two cores.

Avi Service Engines may be configured with as little as 1 vCPU core and 1 GB RAM, or up to 36 vCPU cores and 128 GB RAM.  In write access mode, Service Engine resources for newly created SEs may be configured within the SE Group properties.  When creating an Avi SE in read or no access modes, Avi SE resources are allocated via the hypervisor or by the size hardware used for bare metal servers.

### CPU

CPU scales very linearly as more cores are added.  Avi does not use hyperthreading, as it has minimal improvement in performance.  CPU is generally the bottleneck for SSL TPS, SSL throughput and HTTP compression.  The default is 2 CPU cores, not reserved.

### Memory

Memory scales near linearly.  It is used for concurrent connections and HTTP caching.  Doubling the memory will double the ability of the Avi Service Engine to perform these tasks.  The default is 2 GB memory, reserved within the hypervisor for VMware clouds.  See also <a href="/docs/16.2/se-memory-consumption">SE Memory Consumption</a>.

### PPS

For throughput-related metrics, the hypervisor is likely going to be the bottleneck.  Limitations are different for each hypervisor and version.  For instance, VMware's vSphere / ESX 5.x supports about 550k packets per second to a virtual machine such as Avi's Service Engine.  ESX version 6 doubles this number to around 1.1M PPS.  Bare metal (no hypervisor) numbers depend greatly on the type of NIC used.  Avi recommends Intel 82598 and 82599 10-Gb NICs for optimal performance.

### Disk

Avi Service Engines may store logs locally before they are sent to the Avi Controllers for indexing.  Increasing the disk will increase the log retention on the SE.  SSD is preferred over hard drives, as they can write the log data faster.  This is not a requirement.  The default is 10 GB for storage.
