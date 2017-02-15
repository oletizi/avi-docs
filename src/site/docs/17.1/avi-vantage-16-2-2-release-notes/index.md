---
title: Avi Vantage 16.2.2 Release Notes
layout: layout171
---
This article describes the new features, changes, and fixes in Avi Vantage release 16.2.2.

## What’s New in 16.2.2

* <a href="{% vpath %}/avi-vantage-integration-with-safenet-network-hsm/#use-data-network">Ability to perform HSM SSL handshake via data path or management path</a>
* <a href="{% vpath %}/avi-vantage-integration-with-safenet-network-hsm/#multiple-HSM-profiles">Support for multiple SafeNet HSM Groups</a>
* <a href="{% vpath %}/certificate-management-integration-for-csr-automation/#automated-CSR-workflow-for-HSM">Automated CSR workflow for SafeNet HSM</a>
* <a href="{% vpath %}/bgp-support-for-virtual-services/#BGP-profile-modifications">Ability to handle BGP peer changes gracefully</a>
* <a href="{% vpath %}/openstack-external-networks">In OpenStack, support for using an external network for Controller, virtual service and pool</a>
* <a href="{% vpath %}/verifying-notification-settings">Ability to verify SNMP trap configuration</a>
* <a href="{% vpath %}/verifying-notification-settings">Ability to verify syslog profile configuration</a>
* <a href="{% vpath %}/verifying-notification-settings">Ability to verify email profile configuration</a>
* <a href="{% vpath %}/verifying-notification-settings">Ability to verify SMTP configuration</a>

## Issues Resolved in 16.2.2

* AV-12300: Location value is not saved in response policies
* AV-11933: Cannot edit virtual service policy rule
* AV-11745: Long tenant name overruns into the area below the UI header area
* AV-11764: UI does not throw an error when setting disk size too small in an SE group
* AV-11846: LDAP is not mapping groups correctly
* AV-11886: Bare-metal Controller shows source IP as 127.0.0.1 in TACACS
* AV-12187: Client body timeout of 0 is immediate, rather than infinite
* AV-11981: DataScript refers to a pool that has already been deleted
* AV-12224: In OpenStack, port garbage collection is not happening soon enough 

## What’s New in 16.2.1

* SR-IOV and VLAN filtering for Cisco CSP 
* Ability to specify a Service Engine's disk configuration to VMware vCenter 
* <a href="{% vpath %}/ipam-and-dns-16-2-x/"><span class="s1">IPAM/DNS for VMware read-only cloud</span></a>
* SE configuration controls to support dedicated dispatcher and socket placement 
* BGP selective advertisement for VIP/SNAT 
* Support for multiple BGP peers in a single network  

## Issues Resolved in 16.2.1

* AV-11118: Remote desktop gateway RDS 2012 fails with HTTPS VIP
* AV-11190: No install logs available for bare metal install
* AV-11445: Handle port-security and Allowed-Address-pair settings appropriately
* AV-11456: Post-upgrade to 16.2 cause CC_IP_ATTACH_FAILURE events
* AV-11457: All client logs are deleted on a single node cluster during upgrade
* AV-11483: Unable to edit system access settings if large banner is used in UI
* AV-11577: SE crashes when "Always Send" is enabled in Persistence Profile
* AV-11644: Auth Groups not assigning correct privileges to LDAP users 

## What’s New in 16.2

This section summarizes the enhancements in 16.2. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="{% vpath %}/">knowledge base</a>.

* Linux server (bare metal) support enhancements  
    * <a href="{% vpath %}/installation-guides/installing-avi-vantage-for-a-linux-server-cloud/">Linux server cloud</a> - Orchestration of Service Engines deployed on Linux servers
    * <a href="{% vpath %}/vlan-configuration-on-bare-metal/">VLAN trunking</a> - Multiple VLAN interfaces per physical link
    * <a href="{% vpath %}/upgrading-the-avi-vantage-software/">Upgrade support</a>
* Networking features  
    * <a href="{% vpath %}/bgp-support-for-virtual-services/">BGP with route health injection (RHI) and equal cost multi-path (ECMP)</a> for increased high availability and horizontal scaling of virtual services
    * <a href="{% vpath %}/vrf-support-for-vcenter-deployments/">Multiple route domains (VRF-defined)</a> support in VMware vCenter environments
* Core ADC features  
    * <a href="{% vpath %}/http-request-queuing/">HTTP request queueing</a> to absorb bursts of traffic, by adding requests in a queue if all the servers of a pool have reached their maximum connection limit
    * <a href="{% vpath %}/ab-pool-feature/">A/B pool testing</a> of applications sends a percentage of traffic to a secondary (B) pool; useful for gradually transitioning from one version of the application to another
    * Dictionary/map support for HTTP policies:Policies can perform lookups against a list of items stored in a string group, and the lookup result can be used for the URL-rewrite action
    * Regular expression support for HTTP policies with RegEx match operations against a string list in a string group
    * <a href="{% vpath %}/logging-all-headers-in-client-server-http-traffic/">Full logging of request/response headers for clients</a> via HTTP policies: Policies can selectively log all HTTP headers (request/response) to the client logs
* SSL enhancements  
    * <a href="{% vpath %}/datascript-avi-ssl-cipher/">DataScript and policy support for SSL cipherlist:</a> SSL/TLS session information between clients and virtual services is accessible by DataScripts and HTTP policies
    * <a href="{% vpath %}/crl-validation-options/">PKI profile certificate revocation (CRL) verification option:</a> CRL verification of only the leaf certificate, or the full chain of certificates
    * <a href="{% vpath %}/thales-nshield-integration-2">Thales nShield Hardware Security Module (HSM)</a> support
* Containers  
    * <a href="{% vpath %}/service-discovery-for-mesos/">Service discovery</a> in Mesos/Marathon environment
    * <a href="{% vpath %}/upgrading-the-avi-vantage-software/">Upgrade support</a> in Mesos/Marathon deployments
* UI enhancements  
    * <a href="{% vpath %}/upgrading-the-avi-vantage-software/">Upgrade supported through web interface</a>
    * <a href="{% vpath %}/all-tenants-view/">All-tenant view: </a>Ability by the admin user to view objects within all tenants for the admin user
* Ecosystem support  
    * OpenStack Liberty
    * <a href="{% vpath %}/vantage-installation-on-nutanix-acropolis-hypervisor/">Nutanix Acropolis</a>
* Other features  
    * <a href="{% vpath %}/ldap-auth-profile-test/">LDAP authentication profile testing</a>
    * Python SDK
    * <a href="{% vpath %}/cli-installing-the-cli-shell/">Standalone CLI shell package</a>

## Issues Resolved in 16.2

* AV-8071 Multiple instances of the same health monitor were accepted in a pool configuration
* AV-8163 Host header was missing from client logs
* AV-8239 Servers would show as down in the UI, even though they were up
* AV-8698 Tech support upload to S3 did not work via the proxy server
* AV-8948 The dollar sign ($) was not allowed in an admin password input via the UI. The UI now accepts upper and lower case letters, numbers and **_ - + = % $ @**
* AV-8950 Import of certificate bundle would fail if there were expired certificates
* AV-8951 The UI should show only the first certificate of the bundle in a PKI profile
* AV-9003 The PKI profile update interval should be in minutes
* AV-9319 Accept-encoding header 'gzip' was being re-written to "Identity” even though compression was disabled
* AV-10114 A multiple packet response to a health check would not be parsed correctly, and the server would wrongly be marked down
* AV-10627 App response time for POST would include the client transfer time
* AV-11268 Virtual Service accepts TCP connections even when all servers are down 

## Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 15.2 or later.

<a href="{% vpath %}/upgrading-the-avi-vantage-software/">Upgrade Instructions</a>

<a href="{% vpath %}/protocol-ports-used-by-avi-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a>

## Supported Platforms

* VMware  
    * vCenter 5.1, 5.5, and 6.0
    * vCO and vCAC
* OpenStack Havana, Icehouse, Juno, Kilo, Liberty releases
* Bare metal host running OEL7.0, 7.2, RHEL7.0, 7.2, and CentOS 7.2
* Amazon Web Services (AWS)
* Cisco APIC 1.0.3f and later
* Juniper Contrail 3.0.2
* Containers  
    * Docker UCP version 1.1.1
    * Rancher (Server/Agent): v1.0.0; Cattle: v0.159.2
    * Mesosphere DCOS 1.6
    * Mesos 0.23.0, 0.23.1, 0.24.0, 0.24.1, 0.25.0, 0.26.0, 0.27.0, and 0.27.1
    * Marathon 0.13.x, 0.14.x, 0.15.0, 0.15.1, 0.15.2, and 0.15.3
    * Fleet 0.10.5
* Nutanix Acropolis 4.6 

## Product Documentation

For more information, please see the following documents, also available within this <a href="{% vpath %}/">knowledge base</a>.

### Installation Guides

* <a href="{% vpath %}/installation-guides/">Avi Vantage Installation Guides</a>

## Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.2.2/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.2.2/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.2.2/packages.pdf">https://s3.amazonaws.com/aviopensource/16.2.2/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

