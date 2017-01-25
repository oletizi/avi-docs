---
title: Protocol Ports Used by Avi Vantage for Management Communication
layout: 16.3
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
<td>TCP 22 (SSH)<br> TCP 8443 (HTTPS)<br> TCP 5098 (SSH) <em>(if controller is a docker container, SSH is on port 5098)</em></td>
</tr>
<tr>   
<td>External Entities</td>
<td><em>See sections below the table.</em></td>
</tr>
<tr>    
<td>Avi Service Engine</td>
<td rowspan="2">Avi Controller</td>
<td>TCP 22 (SSH)<br> TCP 8443 (HTTPS)<br> UDP 123 (NTP)<br> TCP 5098 (SSH) <em>(if controller is a docker container, SSH is on port 5098)</em></td>
</tr>
<tr>   
<td>External Network Services</td>
<td>TCP 22 (SSH)<br> TCP 80 (HTTP) <em>(optional)</em><br> TCP 443 (HTTPS)<br> TCP 5054 (CLI Server) <em>(if using the optional <a href="/docs/16.3/cli-installing-the-cli-shell/">CLI shell</a> for remote management access)</em><br> UDP 161 (SNMP agent listens to this port)</td>
</tr>
</tbody>
</table>  

### Ports Used by Controller for Network Services

The Controller may send traffic to the following ports as part of network operation. The firewall also should allow traffic from the Controller to these ports.

* TCP 25 (SMTP)
* TCP 49 (TACACS+)
* UDP 53 (DNS)
* UDP 123 (NTP)
* UDP 162 (SNMP traps)
* TCP or UDP 389 (LDAP)
* UDP 514 (syslog)
* TCP or UDP 636 (LDAPS) 

### Protocols / Ports Used by Cloud Orchestrators

### OpenStack

Some or all of the following ports may be required:

* Keystone: TCP 5000, 35357
* Glance: TCP 9292
* Nova: TCP 8774
* Neutron: TCP 9696
* Heat (optional; used for autoscaling back-end members): TCP 8004 

### VMware vCenter

* Controller-to-ESXi hosts: port 443 

### OpenShift Master

* Port 8443 

### Kubernetes Master

* Port 8080 for unauthenticated masters 

### Mesos or DC/OS Masters

* Port 5050 for masters
* Port 80 for unauthenticated Marathon services 

### Ports Used by Container Cluster Nodes

### OpenShift

* Port 22 

### Kubernetes Minions

* Port 22 

### Mesos Nodes

* Port 22 