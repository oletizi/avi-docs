---
title: Avi Vantage 16&#46;3&#46;2 Release Notes
layout: default
---
This article describes the enhancements and fixes in Avi Vantage release 16.3.2.

### What’s New in 16.3.2

This section summarizes the enhancements in 16.3.2. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

* <a href="/docs/16.3/installing-avi-vantage-for-csp-2100/#dedicated-hsm-network.">Support in a CSP configuration for a dedicated HSM network</a>
* <a href="/docs/16.3/mac-masquerade/">Support for a floating MAC address for back-end connectivity when in legacy active/standby mode</a>
* Support for up to 2048 service ports in a virtual service
* Support for Ubuntu 16.04 and 16.04.1 in Linux server cloud 

### Issues Resolved in 16.3.2

* AV-15100: API should reject if more than 2 certificates are attached to the virtual service
* AV-15234: SE failure when DoS events are reported for an SNI chld virtual service
* AV-15259: GSLB inventory calls fail, and hence UI fails
* AV-15345: Conditional PUT requests generate 412 errors
* AV-15386: Same service name across OpenShift projects/Kubernetes namespaces causes IP allocation failure
* AV-15392: Controller health status does not work correctly when health monitor for a non-Avi virtual service is specified
* AV-15411: Storage verification not working in avi_baremetal.sh script with Docker ver 1.9
* AV-15418: Support "Disable port translation" feature in pools for L7 and l4 SSL virtrual service
* AV-15428: Controller version incorrectly displayed on GSLB UI
* AV-15431: Alert for server down within a specific pool also triggers server down in other pools
* AV-15516: Non-admin user login into CLI shell is broken
* AV-15547: Cloud connector did not recover after IAM permissions were restored to Avi Controller
* AV-15620: UI: edit of FQDN not allowed
* AV-15624: Unable to bind cluster VIP to NIC - Numerical result out of range
* AV-15671: Handle different SSH user-ids for multiple clouds 

### Issues Resolved in 16.3.1

* AV-11682: Unable to specify 'and' when searching logs for inequality
* AV-12481: Length of time a user is logged in is inaccurate
* AV-13450: UI does not allow changing NTP config if no DNS is configured
* AV-15060: VS IP change does not trigger RHI updates
* AV-15145: Unable to connect to vCenter cloud after upgrade to 16.3
* AV-15163: Multiple, unnecessary scale out ready events reported
* AV-15191: Remote users not able to login after upgrade to 16.3
* AV-15194: Packet drops seen when a BGP virtual service is migrated
* AV-15198: If Avi Controller and SE are on the same host, sometimes the SE upgrade hangs, causing a disruptive reboot
* AV-15223: Add correct port mapping for SNMP (161/UDP) for Controller on bare-metal host 

### What’s New in 16.3

This section summarizes the enhancements in 16.3. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

### Core ADC Features

* <a href="/docs/16.3/vi-gslb-architecture">Global Server Load Balancing (GSLB)</a> - Active/DR and Active/Active GSLB, centralized provisioning and visibility, hybrid cloud support
* <a href="/docs/16.3/pool-groups/">Pool Groups and Priorities</a> - Support for multiple pools with priorities and min-servers capability; enhanced support for A/B pool testing
* Ability to exclude HTTP status code ranges or wildcard status codes in the <a href="/docs/architectural-overview/templates/profiles/analytics-profile/#exclude-http-status-codes">Analytics Profile for a Virtual Service</a>
* Ability to forward <a href="/docs/16.3/application-profile/#forward-application-keep-alive-timeout-to-client">application keep-alive timeout value</a> to clients 

### IPAM/DNS

* <a href="/docs/16.3/avi-dns-architecture/">DNS</a> implemented as a virtual service, capable of hosting GSLB, virtual service DNS records, and manually configured DNS records; DNS visibility and analytics
* Comprehensive support for <a href="/service-discovery-using-ipam-and-dns-16-3/">IPAM/DNS services</a>, including integrated Avi Vantage IPAM/DNS, Infoblox, and cloud-native solutions across all cloud infrastructures 

### Networking

* <a href="/docs/16.3/default-gateway-ip-routing-on-avi-se/">Ability to perform IP routing on SEs (default gateway)</a>
* <a href="/docs/16.3/reserve-client-ip">Preserve Client IP (no SNAT) for virtual service traffic</a>
* <a href="/docs/16.3/rf-support-for-service-engine-deployment-on-bare-metal-servers">Multiple VRF (Virtual routing and forwarding) instances in Linux server and no-access clouds</a>
* <a href="/docs/16.3/bgp-support-for-virtual-services/#flow-resiliency-during-scale-out-in">Resilient flow handing for BGP-based scale-out</a> 

### Cloud Connectors

* AWS: <a href="/docs/16.3/ws-cross-account-assumerole-support/">Support for IAM AssumeRole across multiple AWS accounts</a>
* <a href="/docs/16.3/vi-vantage-openshift-installation-guide/">OpenShift and Kubernetes support</a> (Tech Preview)
* OpenStack  
    * Mitaka release qualification
    * Keystone 3.0 support
    * LBaas v2 support
    * Heat resources for Avi Vantage
    * <a href="/openstack-vip-modes-allowed-address-pairs-and-interface-secondary-ips/">Support for interface-secondary IPs (as an alternative to allowed address pairs) for VIP address</a> 
* SDN: Contrail support in OpenStack
* VMware vCenter: <a href="/docs/architectural-overview/infrastructure/#multi-cloud-deployments">Support for multiple vCenter clouds on a single Avi Controller</a> 

### Security

* <a href="/docs/16.3/venafi-integration/">Integration with Venafi Trust Protection Platform </a>for automation of SSL and TLS certificate life-cycle management
* <a href="/docs/16.3/ntp-settings/">Authentication of NTP servers</a>
* <a href="/ssh-users-and-keys/#ssh-key-based-controller-login">Support for key-based SSH access to Avi Controller for the admin account</a>
* <a href="/docs/16.3/ser-account-security/">User account security enhancements:</a> password history enforcement, user account lockout after failed-login-attempts, maximum concurrent login sessions per user, and user credential timeouts 

### Analytics

* <a href="/docs/16.3/avi-dns-architecture/">DNS visibility and analytics</a>
* Ability to disable "Significant Logs" in <a href="/docs/16.3/docs/architectural-overview/templates/profiles/analytics-profile/#enable-disable-significant-logs">Virtual Service Analytics Profile</a> 

### Operations

* <a href="/docs/16.3/upgrading-the-vantage-software/#rolling-service-engine-upgrade">Non-disruptive rolling upgrades for N+M and Active/Standby HA</a>
* <a href="/docs/16.3/ackup-and-restore-of-avi-vantage-configuration">Configuration Backup Scheduler: </a>System configuration backups can now be scheduled
* <a href="/docs/16.3/cluster-configuration-with-fqdn/">Support DNS name (FQDN) for Controller cluster members</a>
* <a href="/docs/16.3/collecting-tech-support-logs/">Capability to collect and download tech-support from the UI</a>
* <a href="/docs/16.3/customizing-notification-of-certificate-expiration">Customizable notification intervals for SSL certificate expiration</a> 

### CLI, API, and Automation

* <a href="/docs/16.3/openapi-swagger-2-0-specification-integration/">Swagger support for Avi Vantage REST API</a>
* <a href="/docs/16.3/cli-enhancements-in-avi-vantage-16-3/">CLI enhancements</a> for better automation, including new "script" and "Linux command line" modes
* API: <a href="/docs/16.3/api-http-patch-support/">Nested PATCH support for multi-nested HttpReqRule</a> 

### DataScript

* Support for <a href="/docs/16.3/string-group/">String Groups</a> and <a href="/docs/16.3/templates-groups-ip-group/">IP Groups</a> in <a href="/datascript-functions/">DataScripts</a> 

### Key Changes in 16.3

* In a VMware vCenter cloud, Avi Controller checks the connectivity to vCenter via ICMP Ping request before trying to login via SSH. Ensure firewall rules are updated to allow ICMP Ping requests from Avi Controller to vCenter. 

### Issues Resolved in 16.3

* AV-9672:   Incorrect virtual service metrics for post requests
* AV-10717: LDAP: User record needs to be updated with LDAP attributes for (user full name, email)
* AV-10805: vCenter password update should be allowed in default cloud
* AV-11160: SSL profile configuration shoud restart HTTP service for the Web UI
* AV-11846: LDAP not mapping groups correctly
* AV-11896: Can't migrate virtual services to different SE when multiple virtual services have the same IP but different ports
* AV-12384: Unable to update pool because of unreferenced HTTP policies
* AV-12596: Bare-metal script should check /var/lib/docker for space
* AV-13458: HTTP Response rule variables not displayed
* AV-13463: Changing one node of the cluster fails
* AV-13625: Prevent multiple simultaneous upgrades
* AV-14818: Change default pool placement network to VIP network in AWS
* AV-14936: OpenStack: "Concurrent Update Error" when using a script for LBaaS config
* AV-14997: DataScript fails to handle server status_code 202
* AV-15100: Virtual Service create/update API should fail the request if more than two SSL certificates are configured 

### Performing the Upgrade

Upgrade prerequisite: current version of Avi Controller must be 16.2 or later.

<a href="/docs/16.3/upgrading-the-vantage-software/">Upgrade Instructions</a>

<a href="/docs/16.3/protocol-ports-used-by-vantage-for-management-communication/">Protocol Ports Used by Vantage for Management Communication</a>

### Supported Platforms

Refer to <a href="/docs/16.3/system-requirements-ecosystem/">System Requirements: Ecosystem</a>

### Product Documentation

For more information, please see the following documents, also available within this knowledge base.

### Installation Guides

* <a href="/docs/16.3/installation-guides/">Avi Vantage Installation Guides</a> 

### Open Source Package Information

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.3.1/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.3.2/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.3.2/packages.pdf">https://s3.amazonaws.com/aviopensource/16.3.2/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a> and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

