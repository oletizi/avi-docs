---
title: Protocol Ports Used by Avi Vantage for Management Communication
layout: default
---
The Avi Controller and Avi Service Engines use the following ports for management. The firewall should allow traffic for these ports.
<table class="table table table-bordered table-hover">  
<tbody>      
<tr>    
<th>Traffic Source
</th>
<th>Traffic Destination
</th>
<th>Ports To Allow
</th>
</tr>
<tr>    
<td rowspan="2">Avi Controller</td>
<td>Avi Controller</td>
<td>TCP 22 (SSH)<br> TCP 8443 (https)<br> TCP 5098 (SSH) <em>(if controller is a docker container, SSH is on port 5098)</em></td>
</tr>
<tr>   
<td>External Network Services</td>
<td><em>See section below the table.</em></td>
</tr>
<tr>    
<td>Avi Service Engine</td>
<td rowspan="2">Avi Controller</td>
<td>TCP 22 (SSH)<br> TCP 8443 (https)<br> UDP 123 (NTP)<br> TCP 5098 (SSH) <em>(if controller is a docker container, SSH is on port 5098)</em></td>
</tr>
<tr>   
<td>External Network Services</td>
<td>TCP 22 (SSH)<br> TCP 80 (http) <em>(optional)</em><br> TCP 443 (https)<br> TCP 5054 (CLI Server) <em>(if using the optional <a href="/docs/16.2/cli-installing-the-cli-shell/">CLI shell</a> for remote management access)</em><br> UDP 161 (SNMP)</td>
</tr>
</tbody>
</table>  

### Ports Used by Controller for Network Services

The Controller may send traffic to the following UDP ports as part of network operation:

* TCP 25 (SMTP)
* UDP 53 (DNS)
* UDP 123 (NTP)
* UDP 162 (SNMP traps)
* UDP 514 (Syslog) 

The firewall also should allow traffic from the Controller to these ports.

### Ports Used by Cloud Orchestrators

Additional ports may be used by the cloud orchestrator. For example, in OpenStack deployments, some or all of the following ports may be required:

* Keystone: TCP 5000, 35357
* Glance: TCP 9292
* Nova: TCP 8774
* Neutron: TCP 9696
* Heat (optional; used for autoscale of back-end members): TCP 8004 