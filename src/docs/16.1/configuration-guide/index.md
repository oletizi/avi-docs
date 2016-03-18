---
layout: configuration-guide
title: Configuration Guide
---

## Contents ##

* [Overview](#architecture)
* Applications
  * [Virtual Services](virtual-services)
    * [Analytics](virtual-service-analytics)
    * [Logs](virtual-service-logs)
    * [Health Monitoring](virtual-service-health-monitoring)
    * [Client Information](virtual-service-client-information)
    * [Security](virtual-service-security)
    * [Events Log](virtual-service-events-log)
    * [Alerts](virtual-service-alerts)
    * [Create a Virtual Service](virtual-service-create)
  * [Virtual Service Scaling](virtual-service-scaling)
  * [Virtual Service Policies](virtual-service-policies)
  * [Pools](apps-pools)
  * [Servers](apps-servers)
* Operations
  * [Alerts](ops-alerts)
  * [Events](ops-events)
  * [Services](ops-services)
  * [Traffic Capture](ops-traffic-capture)
* [Templates](templates)
  * [Profiles](templates-profiles)
  * [Groups](templates-groups)
  * [Security](templates-security)
  * [Scripts](templates-scripts)
* [Infrastructure](infrastructure)
* [Administration](administration)
  * [User Accounts](admin-user-accounts)
  * [Settings](admin-settings)
  * [Controller](admin-controller)


<a name="architecture"></a>

## Architecture ##

Avi Vantage is built using a modern software defined network (SDN) architecture that centralizes the control plane while distributing the data plane. This allows network services to scale near infinitely without the added complexity of managing hundreds of disparate appliances.

Avi Vantage consists of the following key components:

<img src="img/gears_orange.jpg" alt="Controller" width="60" height="60" class="alignleft size-full wp-image-1952" />**Controller:** The Controller is a virtual machine that functions as the manager and single point of access for configuration, visibility, and logs for each Avi Service Engine (SE). Avi Vantage supports three Controllers in a redundant cluster to provide scale and fault tolerance. The Controller is the single point of management for Avi Vantage, via the web interface, REST API, or CLI. By default, the web interface is accessible via HTTPS. (This is [configurable][1].) Internet Explorer (IE) version 11 or later, or any reasonably recent version of Firefox, Safari, Opera or Chrome is supported.

<img src="img/service_engine.jpg" alt="Service Engine" width="60" height="60" class="alignleft size-full wp-image-1954" />**Service Engine:** Avi SEs handle all data plane operations within Vantage by receiving and executing instructions from the Controller. The SEs perform load balancing and all client- and server-facing network interactions. High availability is supported.

In a typical load balancing scenario, a client will communicate with a virtual service, which is an IP address and port hosted in Vantage by an SE. The virtual service internally passes the connection through a number of profiles. For HTTP traffic, the SE may terminate and proxy the client TCP connection, terminate SSL, and proxy the HTTP request. Once the request has been validated, it will be forwarded internally to a pool, which will choose an available server. A new TCP connection then originates from the SE, using an IP address of the SE on the internal network as the request's source IP address. Return traffic takes the same path back. The client communicates exclusively with the virtual service IP address, not the real server IP.

<img src="img/architecture_1-1.jpg" alt="Architecture" width="746" height="142" class="alignnone size-full wp-image-1957" />

The Controller managing the Vantage system is typically a redundant three-node cluster. The entire Vantage system is managed through a centralized point (and IP address) regardless of the number of new applications being load balanced and the number of SEs required to handle the load. The Vantage web interface provides visibility into all applications configured. Controllers can automatically create and configure new SEs as new applications are configured via virtual services (in write access mode deployments).

<img src="img/architecture_2.jpg" alt="Architecture" width="406" height="265" class="alignright size-full wp-image-1960" />
Controllers continually exchange information securely with the SEs and with one other. The SEs perform data plane operations such as load balancing. The SEs also report server health, client connection statistics, and client-request logs to the Controllers, which share the processing of the logs and analytics information. The Controllers also send commands down to the SEs, such as configuration changes. Controllers and SEs communicate over their management IP addresses. (Click [here][2] for a list of the protocol ports Vantage uses for management.)

<img src="img/architecture_3.jpg" alt="Architecture 3" width="452" height="145" class="alignright size-full wp-image-1965" />
Virtual services may be scaled across one or more SEs. When a virtual service is scaled across multiple SEs, each of those SEs share the load. This sharing may not be equal, because the actual workload distribution depends on the available CPU and other resources that may be required of the SE. SEs typically process traffic for more than one virtual service at a time.

One SE will be the primary for a given virtual service and will advertise that virtual service's IP address from the SE's own MAC address. The primary SE may either process and load balance a client connection itself, or it may forward the connection via layer 2 to the MAC address of another SE that has available capacity.

Each SE will load balance and forward traffic to servers using its own IP address within the server network as the source IP address of the client connection. This ensures that even though multiple SEs may be sending traffic to the same pool of servers, return traffic takes the same path from the servers back through the same SE. When deployed in a VMware environment and the SEs are scaled out, the secondary SEs will respond directly back to clients without passing the return traffic back through the primary SE. In OpenStack, the secondary SEs will return client responses back through the primary SE.

## System Requirements: Ecosystem ##

### Hypervisor Support: ###

*   VMware vSphere 5.1, 5.5, 6.0
*   KVM - RHEL/CentOS 6.4, Ubuntu 12.04, 14.04
*   Amazon Web Services (AWS)
*   Docker containers

### VMware Orchestrator Support: ###

*   VMware vCenter 5.1, 5.5, 6.0
*   OpenStack Version Support: Havana, Icehouse, Juno, Kilo

### OpenStack Vendor Support: ###

*   Trunk
*   RedHat
*   Mirantis
*   Canonical/Ubuntu

### Cisco APIC Support: ###

*   Version 1.03(f) or later

### CloudStack Version Support: ###

*   CloudStack 4.5.1

Avi Vantage may be deployed in various environments with write (recommended), read, or no access integration with the virtualization orchestrator. The primary difference among these modes is the level of automation performed by Vantage and the cloud orchestrator compared to the level of manual configuration required of administrators. There are no differences in hardware or system requirements among these modes. Servers being load balanced by Avi Vantage may exist within the same virtualization environment or be bare-metal, non-virtualized servers.

Avi supports the ability to manage multiple cloud environments from a single Controller cluster.

## System Requirements: Hardware ##

Avi Vantage runs on standard x86-based servers, with no requirement for special-purpose hardware. In general, adding hardware capacity will greatly expand overall system capacity, for both SEs and Controllers. Please consult an Avi sales engineer or Avi technical support for recommendations tailored to meet the specific needs of your applications and environment.

The minimum hardware requirements are:

*   **Controller:** 4 vCPU cores, 12 GB RAM, and 64 GB of storage.

*   **Service Engine:** 2 vCPU cores, 2 GB RAM, and 10 GB of storage.

A typical deployment will have three Controllers in a redundant Controller cluster. The number of SEs required will depend on the number of applications being served by Avi Vantage and the configured level of redundancy.

**Notes:**

*   Reservation for CPU and memory is strongly preferred, but not required.

*   Modifying resource settings on VMs, such as CPU cores or RAM, requires powering down the VM, making the changes, and then powering the VM back on.

 [1]: http://kb.avinetworks.com/2015/11/25/redirect-http-to-https/
 [2]: http://kb.avinetworks.com/2016/02/02/protocol-ports-used-by-vantage-for-management-communication/
