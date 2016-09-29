---
title: Avi Vantage 16.2 Release Notes 
layout: default
---
This article describes the new features and fixes in Avi Vantage release 16.2. See the following sections: <a name="162"></a> 

### NEW FEATURES IN 16.2

This section summarizes the enhancements in Vantage 16.2. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

* Core ADC features  
    * <a href="/docs/16.2.2/http-server-reselect">HTTP server reselect</a>: Vantage can be configured to retry an HTTP request that results in a 4*xx* or 5*xx* error code from the back-end server.
    * <a href="/docs/16.2.2/tcp-health-monitor">TCP health monitor with half open</a>: For applications that do not gracefully handle quick termination. The monitor sends a SYN and upon receipt of an ACK, the server is marked up and the monitor responds with a RST. By never completing the handshake, the application is not touched.
    * <a href="/docs/16.2.2/detecting-server-maintenance-mode-with-a-health-monitor">Health monitor - receive disable</a>: Health monitor uses information in the health-check response to detect when a server is in maintenance mode.
    * <a href="/docs/16.2.2/disabling-back-end-servers-for-maintenance">Graceful pool server disable with infinite timeout</a>: When a server is disabled for maintenance, an option has been added to wait for the existing sessions to end gracefully with no timeout.
    * <a href="/docs/16.2.2/http-cookie-persistence">User-configurable timeouts for cookie persistence</a>: Users can configure a persistence timeout, which sets the maximum amount of time a persistence cookie is valid.
    * <a href="/docs/16.2.2/http-cookie-persistence">Encrypt cookie used in cookie persistence</a>: Vantage encrypts the HTTP cookie with AES-256.
    * <a href="/docs/16.2.2/proxy-protocol-support">PROXY protocol support for L4 VS and L4 SSL VS</a>: For layer 4 applications, the PROXY protocol conveys original connection parameters to back-end servers.
* SSL enhancements  
    * <a href="/docs/16.2.2/layer-4-ssl-support">Layer 4 SSL support</a>: SSL/TLS is now supported for layer 4 virtual services.
    * <a href="/docs/16.2.2/certificate-management-integration-for-csr-automation">Certificate management integration for CSR automation</a>: Automate request, renewal, and installation of a certificate signed by a certificate authority (CA).
    * <a href="/docs/16.2.2/multi-level-domain-support-for-ssl">Multi-level domain support for SSL</a>: Support for server certificate CN/SAN verification against a list of user-configurable domain names.
    * <a href="/docs/16.2.2/ssl-certificates">Subject alternate name support</a>: The Subject Alternate Name (SAN) lets you specify additional host names to be protected by a single SSL certificate, such as example.com and example.org.
    * Support for SNI extension in TLS handshakes to pool servers: Vantage can be configured to send a TLS SNI extension to the server to request certificates for specific user-configurable domain name.
    * <a href="/docs/16.2.2/wildcard-sni-matching-for-virtual-hosting">Wildcard SNI matching for virtual hosting</a>: Wildcards can be used to match on the beginning or end of the domain field of a child VS configuration (SNI).
    * <a href="/docs/16.2.2/support-for-sni-extension-in-tls-handshakes-to-pool-servers">TLS SNI supported for connections to pool servers</a>: The SNI extension can be sent as part of the handshake. Optionally, a FQDN can be specified to be used in the extension.
    * <a href="/docs/16.2/avi-vantage-integration-with-safenet-network-hsm/">SafeNet HSM support</a>: Vantage can use the key generation and encryption/decryption services provided by SafeNet Network HSM.
* HA features  
    * <a href="/docs/16.2.2/legacy-ha-for-avi-service-engines">Legacy HA mode support</a>: An Active/Standby HA mode useful for migrating from hardware appliance-based solutions.  
        * <a href="/docs/16.2.2/legacy-ha-for-avi-service-engines">Single IP address for the active/standby SE pair</a>
        * <a href="/docs/16.2.2/gateway-monitoring-for-legacy-ha">Monitoring of default gateway for failover to standby</a>
* Networking features  
    * <a href="/docs/16.2.2/port-channeling-on-linux-server-hosts-2">Port channel (LACP) support for bare metal</a>
    * <a href="/docs/16.2.2/bgp-support-for-virtual-services">Support for 2 BGP router peers with different subnets</a>
    * <a href="/docs/16.2.2/source-nat-for-application-identification">SNAT IP ver VS</a> - Each virtual service can be configured with a unique SNAT IP address. SNAT IP can be advertised via BGP.
* IPAM/DNS  
    * <a href="/docs/16.2.2/vip-allocation-using-ipam-or-dns">Internal and external IPAM and DNS support for various clouds</a>
    * Support for multiple DNS Search domains
* Security  
    * <a href="/docs/16.2.2/tacacs-for-avi-vantage-users">TACACS+ support for user login to Avi Controller</a>
    * <a href="/docs/16.2.2/remote-users-authen-authrz">Flexible tenant and role mapping for LDAP and TACACS+</a>
    * <a href="/docs/16.2.2/securing-management-ip-access">Security enhancements for Avi Controller</a>: Configure allowed IP list for SSH &amp; REST access to Avi Controller and customer cipher list for SSH
* Operations  
    * <a href="/docs/16.2.2/disable-se">Graceful SE disable for non-disruptively migrating virtual services to other SEs</a>
    * <a href="/docs/16.2.2/login-banner-and-message-of-the-day">Configurable "banner" at CLI/UI login</a>
    * <a href="/docs/16.2.2/rolling-back-the-system">Ability to rollback the system from the REST API</a>
    * <a href="/docs/16.2.2/installing-avi-vantage-for-a-linux-server-cloud-16-2">Configurable mount folder for Avi Controller in Linux Server Cloud</a>
    * <a href="/docs/16.2.2/alert-config">Metrics based Alerts</a>: Generate alerts based on metrics hitting specific thresholds or ranges
    * <a href="/docs/16.2.2/terms-of-avi-vantage-license">Updated terms of Avi Vantage software license</a>
* Ecosystem support  
    * <a href="/docs/16.2.2/configuring-a-tag-for-auto-created-ses-in-aws">AWS: Support for custom tags for AWS SE instances</a>: useful for automatically passing AWS a single key-value pair to better control the instantiation of SEs in EC2.
    * <a href="/docs/16.2.2/installing-avi-vantage-for-csp-2100">Cisco Cloud Services Platform (CSP) support</a>
    * Juniper Contrail SDN support
    * <a href="/docs/16.2.2/installing-avi-vantage-with-open-dcos-or-enterprise-dcos">Open DC/OS packaging support for Avi Vantage</a>
* UI enhancements  
    * Ability to choose metrics for display in virtual services list view
    * New design and navigation
* API  
    * <a href="/docs/16.2.2/api-http-patch-support">Support for HTTP PATCH to update scalar fields and for adding/removing elements from a repeated list</a>
* Miscellaneous  
    * F5 configuration conversion tool, versions v10 and v11 

### ISSUES RESOLVED IN 16.2

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

<a name="upgrade"></a>

## PERFORMING THE UPGRADE

Upgrade prerequisite: current version of Avi Controller must be 15.3.x or 16.1.x.

* <a href="/docs/16.2.2/upgrading-the-vantage-software/">Upgrade Instructions</a>
* <a href="/docs/16.2.2/protocol-ports-used-by-avi-vantage-for-management-communication">Protocol Ports Used by Vantage for Management Communication</a> 

<a name="sptdplatforms"></a>

## SUPPORTED PLATFORMS

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

<a name="otherdocs"></a>

## PRODUCT DOCUMENTATION

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### INSTALLATION GUIDES

* <a href="/docs/16.2.2/installation-guides/">Avi Vantage Installation Guides</a> 

<a name="opensourceinfo"></a>

## OPEN SOURCE PACKAGE INFORMATION

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a>and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

  This article describes the new features and fixes in Avi Vantage release 16.2. See the following sections: <a name="162"></a> 

### NEW FEATURES IN 16.2

This section summarizes the enhancements in Vantage 16.2. For more information, click on the feature names. They are hyperlinks to additional information in the Avi Networks <a href="/">knowledge base</a>.

* Core ADC features  
    * <a href="/docs/16.2.2/http-server-reselect">HTTP server reselect</a>: Vantage can be configured to retry an HTTP request that results in a 4*xx* or 5*xx* error code from the back-end server.
    * <a href="/docs/16.2.2/tcp-health-monitor">TCP health monitor with half open</a>: For applications that do not gracefully handle quick termination. The monitor sends a SYN and upon receipt of an ACK, the server is marked up and the monitor responds with a RST. By never completing the handshake, the application is not touched.
    * <a href="/docs/16.2.2/detecting-server-maintenance-mode-with-a-health-monitor">Health monitor - receive disable</a>: Health monitor uses information in the health-check response to detect when a server is in maintenance mode.
    * <a href="/docs/16.2.2/disabling-back-end-servers-for-maintenance">Graceful pool server disable with infinite timeout</a>: When a server is disabled for maintenance, an option has been added to wait for the existing sessions to end gracefully with no timeout.
    * <a href="/docs/16.2.2/http-cookie-persistence">User-configurable timeouts for cookie persistence</a>: Users can configure a persistence timeout, which sets the maximum amount of time a persistence cookie is valid.
    * <a href="/docs/16.2.2/http-cookie-persistence">Encrypt cookie used in cookie persistence</a>: Vantage encrypts the HTTP cookie with AES-256.
    * <a href="/docs/16.2.2/proxy-protocol-support">PROXY protocol support for L4 VS and L4 SSL VS</a>: For layer 4 applications, the PROXY protocol conveys original connection parameters to back-end servers.
* SSL enhancements  
    * <a href="/docs/16.2.2/layer-4-ssl-support">Layer 4 SSL support</a>: SSL/TLS is now supported for layer 4 virtual services.
    * <a href="/docs/16.2.2/certificate-management-integration-for-csr-automation">Certificate management integration for CSR automation</a>: Automate request, renewal, and installation of a certificate signed by a certificate authority (CA).
    * <a href="/docs/16.2.2/multi-level-domain-support-for-ssl">Multi-level domain support for SSL</a>: Support for server certificate CN/SAN verification against a list of user-configurable domain names.
    * <a href="/docs/16.2.2/ssl-certificates">Subject alternate name support</a>: The Subject Alternate Name (SAN) lets you specify additional host names to be protected by a single SSL certificate, such as example.com and example.org.
    * Support for SNI extension in TLS handshakes to pool servers: Vantage can be configured to send a TLS SNI extension to the server to request certificates for specific user-configurable domain name.
    * <a href="/docs/16.2.2/wildcard-sni-matching-for-virtual-hosting">Wildcard SNI matching for virtual hosting</a>: Wildcards can be used to match on the beginning or end of the domain field of a child VS configuration (SNI).
    * <a href="/docs/16.2.2/support-for-sni-extension-in-tls-handshakes-to-pool-servers">TLS SNI supported for connections to pool servers</a>: The SNI extension can be sent as part of the handshake. Optionally, a FQDN can be specified to be used in the extension.
    * <a href="/docs/16.2.2/avi-vantage-integration-with-safenet-network-hsm/">SafeNet HSM support</a>: Vantage can use the key generation and encryption/decryption services provided by SafeNet Network HSM.
* HA features  
    * <a href="/docs/16.2.2/legacy-ha-for-avi-service-engines">Legacy HA mode support</a>: An Active/Standby HA mode useful for migrating from hardware appliance-based solutions.  
        * <a href="/docs/16.2.2/legacy-ha-for-avi-service-engines">Single IP address for the active/standby SE pair</a>
        * <a href="/docs/16.2.2/gateway-monitoring-for-legacy-ha">Monitoring of default gateway for failover to standby</a>
* Networking features  
    * <a href="/docs/16.2.2/port-channeling-on-linux-server-hosts-2">Port channel (LACP) support for bare metal</a>
    * <a href="/docs/16.2.2/bgp-support-for-virtual-services">Support for 2 BGP router peers with different subnets</a>
    * <a href="/docs/16.2.2/source-nat-for-application-identification">SNAT IP ver VS</a> - Each virtual service can be configured with a unique SNAT IP address. SNAT IP can be advertised via BGP.
* IPAM/DNS  
    * <a href="/docs/16.2.2/vip-allocation-using-ipam-or-dns">Internal and external IPAM and DNS support for various clouds</a>
    * Support for multiple DNS Search domains
* Security  
    * <a href="/docs/16.2.2/tacacs-for-avi-vantage-users">TACACS+ support for user login to Avi Controller</a>
    * <a href="/docs/16.2.2/remote-users-authen-authrz">Flexible tenant and role mapping for LDAP and TACACS+</a>
    * <a href="/docs/16.2.2/securing-management-ip-access">Security enhancements for Avi Controller</a>: Configure allowed IP list for SSH &amp; REST access to Avi Controller and customer cipher list for SSH
* Operations  
    * <a href="/docs/16.2.2/disable-se">Graceful SE disable for non-disruptively migrating virtual services to other SEs</a>
    * <a href="/docs/16.2.2/login-banner-and-message-of-the-day">Configurable "banner" at CLI/UI login</a>
    * <a href="/docs/16.2.2/rolling-back-the-system">Ability to rollback the system from the REST API</a>
    * <a href="/docs/16.2.2/installing-avi-vantage-for-a-linux-server-cloud-16-2">Configurable mount folder for Avi Controller in Linux Server Cloud</a>
    * <a href="/docs/16.2.2/alert-config">Metrics based Alerts</a>: Generate alerts based on metrics hitting specific thresholds or ranges
    * <a href="/docs/16.2.2/terms-of-avi-vantage-license">Updated terms of Avi Vantage software license</a>
* Ecosystem support  
    * <a href="/docs/16.2.2/configuring-a-tag-for-auto-created-ses-in-aws">AWS: Support for custom tags for AWS SE instances</a>: useful for automatically passing AWS a single key-value pair to better control the instantiation of SEs in EC2.
    * <a href="/docs/16.2.2/installing-avi-vantage-for-csp-2100">Cisco Cloud Services Platform (CSP) support</a>
    * Juniper Contrail SDN support
    * <a href="/docs/16.2.2/installing-avi-vantage-with-open-dcos-or-enterprise-dcos">Open DC/OS packaging support for Avi Vantage</a>
* UI enhancements  
    * Ability to choose metrics for display in virtual services list view
    * New design and navigation
* API  
    * <a href="/docs/16.2.2/api-http-patch-support">Support for HTTP PATCH to update scalar fields and for adding/removing elements from a repeated list</a>
* Miscellaneous  
    * F5 configuration conversion tool, versions v10 and v11 

### ISSUES RESOLVED IN 16.2

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

<a name="upgrade"></a>

## PERFORMING THE UPGRADE

Upgrade prerequisite: current version of Avi Controller must be 15.3.x or 16.1.x.

* <a href="/docs/16.2.2/upgrading-the-vantage-software/">Upgrade Instructions</a>
* <a href="/docs/16.2.2/protocol-ports-used-by-avi-vantage-for-management-communication">Protocol Ports Used by Vantage for Management Communication</a> 

<a name="sptdplatforms"></a>

## SUPPORTED PLATFORMS

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

<a name="otherdocs"></a>

## PRODUCT DOCUMENTATION

For more information, please see the following documents, also available within this <a href="/">knowledge base</a>.

### INSTALLATION GUIDES

* <a href="/docs/16.2.2/installation-guides/">Avi Vantage Installation Guides</a> 

<a name="opensourceinfo"></a>

## OPEN SOURCE PACKAGE INFORMATION

* Copyright Information [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/copyrights.pdf</a>]
* Packages used [<a href="https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf">https://s3.amazonaws.com/aviopensource/16.1.3/packages.pdf</a>] 

Avi Networks software, Copyright © 2013-2016 by Avi Networks, Inc. All rights reserved. The copyrights to certain works contained in this software are owned by other third parties and used and distributed under license. Certain components of this software are licensed under the GNU General Public License (GPL) version 2.0 or the GNU Lesser General Public License (LGPL) Version 2.1. A copy of each such license is available at <a href="http://www.opensource.org/licenses/gpl-2.0.php">http://www.opensource.org/licenses/gpl-2.0.php</a>and <a href="http://www.opensource.org/licenses/lgpl-2.1.php">http://www.opensource.org/licenses/lgpl-2.1.php</a>

