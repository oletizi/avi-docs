---
title: Orchestrator Access Modes
layout: default
---
While Avi Vantage can be deployed within a virtualized environment or cloud, the access level that Vantage has for communicating with the virtualization orchestrator (such as VMware vCenter) affects how the system operates and is configured. The level of communication that Vantage has with the virtualization orchestrator is defined as the *access mode*.

Vantage may be deployed in a number of different environments, both with or without an orchestrator (such as vCenter or OpenStack).

<a href="img/SelectbyNetwork.png"><img class="alignnone  wp-image-876" src="img/SelectbyNetwork.png" alt="SelectbyNetwork" width="524" height="287"></a> Figure 1:  Add servers via *Select Servers by Network* autodiscovery  

* **No Access Mode:**  Avi Vantage has no access to the orchestrator, or is in an environment such as bare metal where there is no orchestrator. When in this mode, adding, removing, or modifying properties of a Service Engine requires an administrator to manually perform the changes. For instance, an administrator would need to install a new SE through the orchestrator, such as vCenter, by uploading the OVA and setting the resource and networking properties. If a new virtual service is created, admin access to vCenter may again be required to change the network settings to support the new virtual server. Servers and networks cannot be auto-discovered and must be manually configured. In this mode, the Avi Vantage cloud setting is configured as "no orchestrator" regardless of the cloud/virtualization environment. 
* **Read Access Mode: ** This mode is specific to VMware's vCenter. In this mode, Vantage has read-only access to vCenter, enabling it to learn the resource utilization of virtual machines (servers) and discover network information. Vantage cannot add, modify, or remove SEs, backend servers, or network properties. Avi Vantage cannot gather resource information from servers, such as CPU or memory utilization. While in this mode, the Vantage cloud setting is "VMware", with access permission set to Read. 
* **Write Access Mode:**  This mode grants Vantage full write access to the orchestrator. Vantage can automatically create, modify, and remove SEs and other resources as needed to adapt to changing traffic needs. This is the recommended deployment mode when available for a cloud environment. Password access is required to the orchestrator. (An exception is Amazon Web Services [AWS]. AWS requires an access key ID and secret access key, or a preconfigured role for access.)  

The following table shows the access modes available for each supported cloud environment.

<table class=" table table-bordered table-hover">   
<tbody>         
<tr>     
<td></td>
<td><strong>None</strong></td>
<td><strong>Read</strong></td>
<td><strong>Write</strong></td>
</tr>
<tr>     
<td>vCenter</td>
<td>Y</td>
<td>Y</td>
<td>Y</td>
</tr>
<tr>     
<td>vCenter w APIC</td>
<td></td>
<td></td>
<td>Y</td>
</tr>
<tr>     
<td>OpenStack</td>
<td>Y</td>
<td></td>
<td>Y</td>
</tr>
<tr>     
<td>CloudStack</td>
<td>Y</td>
<td></td>
<td>Y</td>
</tr>
<tr>     
<td>AWS</td>
<td>Y</td>
<td></td>
<td>Y</td>
</tr>
<tr>     
<td>Mesos</td>
<td></td>
<td></td>
<td>Y</td>
</tr>
<tr>     
<td>Bare Metal</td>
<td>Y</td>
<td></td>
<td></td>
</tr>
</tbody>
</table> 