---
title: Avi Vantage 16.1.1 Release Notes
layout: default
---
This article describes the new features, changes, and fixes in Avi Vantage release 16.1.1.

## What’s New in 16.1.1

Avi Vantage 16.1.1 adds support for Internet Explorer (IE) version 11.

## Issues Resolved in 16.1.1

* AV-8251 The SE did not receive a certificate bundle from the Controller in some cases.
* AV-8212 CLI: Maximum transmission unit (MTU) could not be set for a cloud using the CLI.
* AV-8208 OpenStack: Upload of SE image would fail if raw image format was used.
* AV-8163 The Host header was mistakenly omitted from client logs.
* AV-8086 SE could stop working during very heavy test load of SSL traffic.
* AV-8071 The Controller allowed multiple instances of the same health monitor to be attached to the same pool, which is an invalid configuration.
* AV-7924 Web interface: The port number not preserved when editing a pool. If the port number was edited and the field was then cleared again, the previous port number was not retained and had to be typed into the field.

## What’s New in 16.1

This section summarizes the enhancements in 16.1. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

* Linux server (bare metal) support enhancements

* <a href="/2016/03/08/installing-avi-vantage-for-a-linux-server-cloud/">Linux server cloud</a> - Orchestration of Service Engines deployed on Linux servers
* <a href="/2016/03/07/vlan-configuration-on-bare-metal/">VLAN trunking</a> - Multiple VLAN interfaces per physical link
* <a href="/2016/03/07/upgrading-the-vantage-software/">Upgrade support</a>
* Networking features

* <a href="/2016/03/07/bgp-support-for-virtual-services/">BGP with route health injection (RHI) and equal cost multi-path (ECMP)</a> for increased high availability and horizontal scaling of virtual services
* <a href="/2016/03/09/vrf-support-for-vcenter-deployments/">Multiple route domains (VRF-defined)</a> support in VMware vCenter environments
* Core ADC features

* <a href="/2016/03/02/http-request-queuing/">HTTP request queueing</a> to absorb bursts of traffic, by adding requests in a queue if all the servers of a pool have reached their maximum connection limit
* <a href="/2016/03/06/ab-pool-feature/">A/B pool testing</a> of applications sends a percentage of traffic to a secondary (B) pool; useful for gradually transitioning from one version of the application to another
* Dictionary/map support for HTTP policies:Policies can perform lookups against a list of items stored in a string group, and the lookup result can be used for the URL-rewrite action
* Regular expression support for HTTP policies with RegEx match operations against a string list in a string group
* <a href="/2016/03/08/logging-all-headers-in-client-server-http-traffic/">Full logging of request/response headers for clients</a> via HTTP policies: Policies can selectively log all HTTP headers (request/response) to the client logs
* SSL enhancements

* <a href="/2016/03/10/datascript-avi-ssl-cipher/">DataScript and policy support for SSL cipherlist:</a> SSL/TLS session information between clients and virtual services is accessible by DataScripts and HTTP policies
* <a href="/2016/03/02/crl-validation-options/">PKI profile certificate revocation (CRL) verification option:</a> CRL verification of only the leaf certificate, or the full chain of certificates
* <a href="/2016/03/03/thales-nshield-integration-2">Thales nShield Hardware Security Module (HSM)</a> support
* Containers

* <a href="/2016/03/07/service-discovery-for-mesos/">Service discovery</a> in Mesos/Marathon environment
* <a href="/2016/03/07/upgrading-the-vantage-software/">Upgrade support</a> in Mesos/Marathon deployments
* UI enhancements

* <a href="/2016/03/07/upgrading-the-vantage-software/">Upgrade supported through web interface</a>
* <a href="/2016/03/13/all-tenants-view/">All-tenant view: </a>Ability by the admin user to view objects within all tenants for the admin user
* Ecosystem support

* OpenStack Liberty
* <a href="/2016/03/13/vantage-installation-on-nutanix-acropolis-hypervisor/">Nutanix Acropolis</a>
* Other features

* <a href="/2016/03/07/ldap-auth-profile-test/">LDAP authentication profile testing</a>
* Python SDK
* <a href="/2016/02/26/cli-installing-the-cli-shell/">Standalone CLI shell package</a>

## Issues Resolved in 16.1

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

## Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 15.2 or later.

<a href="/2016/03/07/upgrading-the-vantage-software/">Upgrade Instructions</a>

<a href="/2016/02/02/protocol-ports-used-by-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a>

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

* Docker 1.4.1
* Mesosphere DCOS 1.6
* Mesos 0.23.0, 0.23.1, 0.24.0, 0.24.1, 0.25.0, 0.26.0, 0.27.0, and 0.27.1
* Marathon 0.13.x, 0.14.x, 0.15.0, 0.15.1, 0.15.2, and 0.15.3
* Fleet 0.10.5
* Nutanix Acropolis 4.6

## Product Documentation

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### Installation Guides

* <a href="/docs/installation-guides/">Avi Vantage Installation Guides</a>

## Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>]

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>