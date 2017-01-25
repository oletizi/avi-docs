---
title: System Requirements&#58; Ecosystem
layout: 16.2
---
### HYPERVISOR SUPPORT

* VMware vSphere 5.1, 5.5, 6.0
* For OpenStack environments: KVM - RHEL/CentOS 6.4, Ubuntu 12.04, 14.04
* Amazon Web Services (AWS)
* Docker UCP version 1.1.1
* Nutanix Acropolis 4.6 

### ORCHESTRATOR SUPPORT

* VMware vCenter 5.1, 5.5, 6.0, vCO and vCAC
* OpenStack Version Support: Havana, Icehouse, Juno, Kilo, Liberty
* Mesosphere DCOS 1.6
* Mesos 0.23.0, 0.23.1, 0.24.0, 0.24.1, 0.25.0, 0.26.0, 0.27.0, and 0.27.1
* Marathon 0.13.x, 0.14.x, 0.15.0, 0.15.1, 0.15.2, and 0.15.3 

### OPENSTACK VENDOR SUPPORT

* Trunk
* Red Hat
* Mirantis
* Canonical/Ubuntu 

### CISCO APIC SUPPORT

* Version 1.03(f) and later 

### CLOUDSTACK VERSION SUPPORT

* CloudStack 4.5.1 

Avi Vantage may be deployed in various environments with write (recommended), read, or no access integration with the virtualization orchestrator. The primary difference among these modes is the level of automation performed by Vantage and the cloud orchestrator compared to the level of manual configuration required of administrators. There are no differences in hardware or system requirements among these modes. Servers being load balanced by Avi Vantage may exist within the same virtualization environment or be bare-metal, non-virtualized servers.

Avi supports the ability to manage multiple cloud environments from a single Controller cluster.
