---
title: Avi Vantage 16&#46;1&#46;7 Release Notes
layout: default
---
This article describes the changes and fixes in Avi Vantage release 16.1 and its maintenance releases.

See the following sections:

* Release details:  
    * <a href="#1617">Avi Vantage 16.1.7</a>
    * <a href="#1616">Avi Vantage 16.1.6</a>
    * <a href="#1615">Avi Vantage 16.1.5</a>
    * <a href="#1614">Avi Vantage 16.1.4</a>
    * <a href="#1613">Avi Vantage 16.1.3</a>
    * <a href="#1612">Avi Vantage 16.1.2</a>
    * <a href="#1611">Avi Vantage 16.1.1</a>
    * <a href="#161">Avi Vantage 16.1</a>
* <a href="#upgrade">Performing the Upgrade</a>
* <a href="#sptdplatforms">Supported Platforms</a>
* <a href="#otherdocs">Product Documentation</a>
* <a href="#opensourceinfo">Open Source Package Information</a> 

<a name="1617"></a>

## Avi Vantage 16.1.7

This release contains fixes but no new features.

### Issues Resolved in 16.1.7

* AV-10806: VIP port numbers higher than 6000 did not work.
* AV-10785: Avi Service Engine (SE) could fail if the X-Forwarded-For (XFF) field in the HTTP header of a packet was too long.
* AV-10765: Following upgrade, the primary SE for a virtual service did not accept TCP connections. 

<a name="1616"></a>

## Avi Vantage 16.1.6

This release contains fixes but no new features.

### Issues Resolved in 16.1.6

* AV-10642: Avi Service Engines (SEs) did not correctly handle TCP out-of-band (OOB) data.
* AV-10635: Packet buffer leak could occur when back-end UDP servers were down.
* AV-10572: Configuration change to TCP/UDP profile could cause the ending port number of the virtual service port range to be incorrectly set to 0. 

<a name="1615"></a>

## Avi Vantage 16.1.5

This release contains a fix but no new features.

### Issues Resolved in 16.1.5

* AV-10631: APIC: VRF associated with Bridge Domains was not updated in the Avi Controller upon upgrade. 

<a name="1614"></a>

## Avi Vantage 16.1.4

This release contains fixes but no new features.

### Issues Resolved in 16.1.4

* AV-10520: Postgres failure during Avi Controller upgrade causes the upgrade to be aborted.
* AV-10362: APIC: Logical interface (LIf) sharing did not work across Virtual Routing Frameworks (VRFs) for APIC graph instances. 

<a name="1613"></a>

## Avi Vantage 16.1.3

This release adds a new cookie persistence option, to enable or disable including Set-Cookie headers in every request of a connection that is not using the Cookie header.

Note: In 16.1.3, this new option is supported only in the REST API.

### Issues Resolved in 16.1.3

* AV-10313: When a virtual service was scaled out across two or more Avi SEs, packets could be dropped between the primary SE and the secondary SE due to maximum transmission unit (MTU) limits.
* AV-9584: Error threshold for packets with TCP window size 0 adjusted to reduce unnecessary significant logs. (Default threshold changed to a minimum of 5 events or 2% of total traffic for the virtual service.)
* AV-9579: In certain circumstances, the postgres database could fail to start on a follower Avi Controller node in a 3-node Controller cluster. This caused the configuration on the follower node to go out of sync.
* AV-9481: OpenSSL upgraded to v1.0.2h.
* AV-9319: Accept-Encoding headers for gzip packets were incorrectly rewritten.
* AV-9315: IP forwarding for the Avi Controller was unnecessarily enabled in non-container infrastructures.
* AV-9248: (OpenStack) If a project’s UUID changed (for example, because a project was recreated in Keystone), but an older tenant with the same UUID still existed in Vantage, this caused issues with logging into the newly created tenant.
* AV-9022: If an Avi SE failed to reconnect following upgrade, the upgrade could take longer.
* AV-9005: Long Certificate Revocation Lists (CRLs) could cause an Avi SE to stop working. 

<a name="1612"></a>

## Avi Vantage 16.1.2

This release contains fixes but no new features.

### Issues Resolved in 16.1.2

* AV-8761 APIC: Use of Avi Vantage Service Graphs across VRFs was not supported.
* AV-8718 Mesos: Setting the A/B pool ratio caused task restart and service disruption. This occurred when labels were used. Vantage 16.1.2 supports using the API to set the A/B ratio for Mesos.
* AV-8717 APIC: VIPs are registered as part of the Device Selection Policy for the APIC DSR feature.
* AV-8709 Vantage did not support TCP SYNs in which the Explicit Congestion Notification (ECN) or Congestion Window Reduced (CWR) features were enabled. SYNs in which either the ECN or CWR option was enabled were dropped.
* AV-8701 OpenStack: If the management session was switched to a non-admin tenant, private SE group flavors did not appear in the SE group edit window.
* AV-8614 Web interface: If the advanced workflow (Create Virtual Service > Advanced Setup) was used to create a virtual service for an OpenStack or AWS cloud, the configuration failed.
* AV-8496 Upgrade: If the pool down action for a pool was set to local response, upgrade from a previous version to 16.1.x would fail. If this occurred, the following exception (error) message was generated: Enum POOL_DOWN_HTTP_STATUS_CODE_503 not found in enum type FailHttpStatusCode 

<a name="1611"></a>

## Avi Vantage 16.1.1

Avi Vantage 16.1.1 adds support for Internet Explorer (IE) version 11, and contains the following fixes.

### Issues Resolved in 16.1.1

* AV-8251 The SE did not receive a certificate bundle from the Controller in some cases.
* AV-8212 CLI: Maximum transmission unit (MTU) could not be set for a cloud using the CLI.
* AV-8208 OpenStack: Upload of SE image would fail if raw image format was used.
* AV-8163 The Host header was mistakenly omitted from client logs.
* AV-8086 SE could stop working during very heavy test load of SSL traffic.
* AV-8071 The Controller allowed multiple instances of the same health monitor to be attached to the same pool, which is an invalid configuration.
* AV-7924 Web interface: The port number not preserved when editing a pool. If the port number was edited and the field was then cleared again, the previous port number was not retained and had to be typed into the field. 

<a name="161"></a>

## Avi Vantage 16.1

This section summarizes the enhancements in Vantage 16.1. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

* Linux server (bare metal) support enhancements  
    * <a href="/docs/latest/installing-avi-vantage-for-a-linux-server-cloud/">Linux server cloud</a> - Orchestration of Service Engines deployed on Linux servers
    * <a href="/docs/latest/vlan-configuration-on-bare-metal/">VLAN trunking</a> - Multiple VLAN interfaces per physical link
    * <a href="/docs/latest/upgrading-the-vantage-software/">Upgrade support</a>
* Networking features  
    * <a href="/docs/latest/bgp-support-for-virtual-services/">BGP with route health injection (RHI) and equal cost multi-path (ECMP)</a> for increased high availability and horizontal scaling of virtual services
    * <a href="/docs/latest/vrf-support-for-vcenter-deployments/">Multiple route domains (VRF-defined)</a> support in VMware vCenter environments
* Core ADC features  
    * <a href="/docs/latest/http-request-queuing/">HTTP request queueing</a> to absorb bursts of traffic, by adding requests in a queue if all the servers of a pool have reached their maximum connection limit
    * <a href="/docs/latest/ab-pool-feature/">A/B pool testing</a> of applications sends a percentage of traffic to a secondary (B) pool; useful for gradually transitioning from one version of the application to another
    * Dictionary/map support for HTTP policies:Policies can perform lookups against a list of items stored in a string group, and the lookup result can be used for the URL-rewrite action
    * Regular expression support for HTTP policies with RegEx match operations against a string list in a string group
    * <a href="/docs/latest/logging-all-headers-in-client-server-http-traffic/">Full logging of request/response headers for clients</a> via HTTP policies: Policies can selectively log all HTTP headers (request/response) to the client logs
* SSL enhancements  
    * <a href="/docs/latest/datascript-avi-ssl-cipher/">DataScript and policy support for SSL cipherlist:</a> SSL/TLS session information between clients and virtual services is accessible by DataScripts and HTTP policies
    * <a href="/docs/latest/crl-validation-options/">PKI profile certificate revocation (CRL) verification option:</a> CRL verification of only the leaf certificate, or the full chain of certificates
    * <a href="/docs/latest/thales-nshield-integration-2">Thales nShield Hardware Security Module (HSM)</a> support
* Containers  
    * <a href="/docs/latest/service-discovery-for-mesos/">Service discovery</a> in Mesos/Marathon environment
    * <a href="/docs/latest/upgrading-the-vantage-software/">Upgrade support</a> in Mesos/Marathon deployments
* UI enhancements  
    * <a href="/docs/latest/upgrading-the-vantage-software/">Upgrade supported through web interface</a>
    * <a href="/docs/latest/all-tenants-view/">All-tenant view: </a>Ability by the admin user to view objects within all tenants for the admin user
* Ecosystem support  
    * OpenStack Liberty
    * <a href="/docs/latest/vantage-installation-on-nutanix-acropolis-hypervisor/">Nutanix Acropolis</a>
* Other features  
    * <a href="/docs/latest/ldap-auth-profile-test/">LDAP authentication profile testing</a>
    * Python SDK
    * <a href="/docs/latest/cli-installing-the-cli-shell/">Standalone CLI shell package</a> 

### Issues Resolved in 16.1

* AV-7937 Web interface: The Consistent Hash selection from the Load Balance pull-down menu was not preserved when editing a pool.
* AV-7924 Web interface: After configuring a virtual service using the Basic popup, if the server port number was edited in the pool configuration popup and then cleared again in the popup, the field did not re-inherit the port number from the Basic virtual service popup. Instead, an error message appeared.
* AV-7819 OpenStack: Avi-LBaaS CLI did not work for non-admin users.
* AV-7777 OpenStack Horizon: The Analytics tab header could not be removed (Red Hat Juno version).
* AV-7724 [Enhancement] Custom profiles created in the admin tenant can be shared by other tenants.
* AV-7690 [Enhancement] AWS: Greatly reduced the number of tags for a VM in AWS.
* AV-7532 Health monitoring traffic was included by default in the packet captures (pcap) for a virtual service.
* AV-7474 Web interface: The edit popup for PKI profiles contained an empty row at the end of the CRL list.
* AV-7466 Role names could not contain special characters.
* AV-7427 API: Cluster-configuration requests using the API failed if the cluster was already configured (already running).
* AV-7422 Web interface: In the Pool configuration popup, the Service Engine Client Certificate pull-down list included CA certificates, which are not applicable to this part of the configuration.
* AV-7413 APIC: A maximum of 3 CPUs per SE was supported.
* AV-7404 Web interface: The web interface always set the redirect action for a down pool to HTTPS, even if changed by the Vantage user. The change was not saved.
* AV-7393 The software allowed an SE group to have more than its maximum allowed number of SEs.
* AV-7386 If a primary SE was up, the Controller would send health checks to its secondary SEs even if the pools in those SEs were down.
* AV-7337 OpenStack: The web interface could sometimes fail to show the Select by Network option (part of virtual service configuration).
* AV-7310 SE names could not contain underscores.
* AV-7261 [Enhancement] Support for multiple Syslog servers.
* AV-3207 Client insights could show the incorrect protocol. For example, "http" could be listed as the protocol for an HTTPS-only port.
* AV-700 OpenStack: Garbage collection could reduce Controller availability. 

<a name="upgrade"></a>

## Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 16.1.7.

* <a href="/docs/latest/upgrading-the-vantage-software/">Upgrade Instructions</a>
* <a href="/docs/latest/protocol-ports-used-by-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a> 

<a name="sptdplatforms"></a>

## Supported Platforms

* VMware  
    * vCenter 5.1, 5.5, and 6.0
    * vCloud Air
    * vCO and vCAC
* OpenStack Havana, Icehouse, Juno, Kilo, Liberty releases
* Bare metal host running OEL7.0, 7.2, RHEL7.0, 7.2, and CentOS 7.2
* Amazon Web Services (AWS)
* Cisco APIC 1.0.3f and later
* Containers  
    * Docker UCP version 1.1.1
    * Rancher (Server/Agent): v1.0.0; Cattle: v0.159.2
    * Mesosphere DCOS 1.6
    * Mesos 0.23.0, 0.23.1, 0.24.0, 0.24.1, 0.25.0, 0.26.0, 0.27.0, and 0.27.1
    * Marathon 0.13.x, 0.14.x, 0.15.0, 0.15.1, 0.15.2, and 0.15.3
    * Fleet 0.10.5
* Nutanix Acropolis 4.6 

<a name="otherdocs"></a>

## Product Documentation

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### Installation Guides

* <a href="/docs/latest/installation-guides/">Avi Vantage Installation Guides</a> 

<a name="opensourceinfo"></a>

## Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

