---
title: Protocol Ports Used by Avi Vantage for Management Communication
layout: default
---
The Avi Controller and Avi Service Engines use the following ports for management. The firewall should allow traffic for these ports.
Traffic Source Traffic Destination Ports To Allow Avi Controller Avi Controller TCP 22 (SSH)
TCP 8443 (https)
TCP 5098 (SSH) *(if controller is a docker container, SSH is on port 5098)* External Network Services *See section below the table.* Avi Service Engine Avi Controller TCP 22 (SSH)
TCP 8443 (https)
UDP 123 (NTP)
TCP 5098 (SSH) *(if controller is a docker container, SSH is on port 5098)* External Network Services TCP 22 (SSH)
TCP 80 (http) *(optional)*
TCP 443 (https)
TCP 5054 (CLI Server) *(if using the optional <a href="/2016/02/26/cli-installing-the-cli-shell/">CLI shell</a> for remote management access)*
UDP 161 (SNMP)

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