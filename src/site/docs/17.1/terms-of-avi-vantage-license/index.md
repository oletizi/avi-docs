---
title: Terms of Avi Vantage Software License
layout: default
---
Avi Vantage software must be licensed. A free trial license is available for evaluating the product. To deploy Avi Vantage into an enterprise cloud, an enterprise license is recommended.

Avi Vantage licenses are subscription based, and have a start date and an expiration date. Each licence applies to a specific infrastructure type, and more than one license can be added to the Avi Controller. For example, an Avi Controller that will be used in both a VMware vCenter cloud and in a Mesos cloud will need a separate license for each one.

**Note: For information about procuring, installing, and managing a license, <a href="/docs/16.3/avi-vantage-license-management">click here</a>.**
<table class="table table table-bordered table-hover">   
<thead>  
<tr>    
<th>Infrastructure (Cloud) Type
</th>
<th>Licensed By
</th>
<th>Description
</th>
</tr>
</thead>
<tbody>    
<tr>    
<td>VMware<br> OpenStack<br> AWS<br> Nutanix Acropolis</td>
<td>Service Engine (SE) vCPUs</td>
<td>Defines the maximum number of vCPUs (cores) that can be used across all SEs in these cloud types. Individual SEs can vary in terms of the number of vCPUs each individual SE has, so long as the total number of vCPUs consumed by all SEs does not exceed the number of vCPUs allowed in the license file. SE vCPU allocation is configured in the SE group.<p></p> 
<ul> 
 <li>For example, a 10-vCPU license allows up to 10 1-vCPU SEs, or 5 2-vCPU SEs, or a mix of 4 1-vCPU SEs and 3 2-vCPU SEs (across 2 SE groups), and so on.</li> 
</ul> <p><strong>Per-app SE mode:</strong> If an SE group is configured in per-app SE mode, <span style="font-weight: 400;">a vCPU counts at 25% rate for licensing usage. For example, a 2-vCPU SE in the per-app SE group utilizes 0.5 vCPU license (2 * 0.25). Per-app SE mode is limited to a maximum of 2 virtual services per SE. This mode is suitable for deployments with dedicated per-application load balancers. This mode is available with Avi Vantage software version 16.2 and later.</span></p></td>
</tr>
<tr>    
<td>Linux server</td>
<td>SE sockets</td>
<td>Defines the maximum number of sockets Avi SEs can be deployed on.<p></p> <p>Note: Alternatively, SE vCPU-based licensing can be used instead of SE socket-based licensing for a Linux server cloud.</p></td>
</tr>
<tr>    
<td>Mesos</td>
<td>Hosts in Cluster</td>
<td>Defines the maximum number of hosts on which SE instances that can be deployed.<p></p> <p>One SE instance is installed on each host within the Mesos cluster.</p></td>
</tr>
</tbody>
</table>  

## Trial License Terms

A free trial license is already installed in the product when it is downloaded from the Avi Networks website. The trial license supports all features supported by an enterprise license. The following table describes the trial license limits and terms:
<table class="table table table-bordered table-hover">   
<thead>  
<tr>    
<th>Infrastructure (Cloud) Type
</th>
<th>Licensed By
</th>
<th>Limits
</th>
</tr>
</thead>
<tbody>    
<tr>    
<td>VMware<br> OpenStack<br> AWS<br> Nutanix Acropolis</td>
<td>SE vCPUs</td>
<td>First 6 months: 20 vCPUs<p></p> <p>After 6 months: 2 vCPUs (free perpetual limit)</p></td>
</tr>
<tr>    
<td>Linux server</td>
<td>SE sockets</td>
<td>First 6 months: 4 sockets<p></p> <p>After 6 months: 0 sockets</p> <p> </p></td>
</tr>
<tr>    
<td>Mesos</td>
<td>Hosts in Cluster</td>
<td>First 6 months: 200 hosts and 200 virtual services<p></p> <p>After 6 months: 20 hosts and 20 virtual services (free perpetual limit)</p></td>
</tr>
</tbody>
</table>  