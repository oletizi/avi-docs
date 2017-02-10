---
title: Access Settings for Clients of the Avi Controller
layout: layout162
---
Select Administration &gt; Settings &gt; Access Settings to view or edit a range of settings mainly related to access to the Controller itself from the outside.

The following options are classified as System Access Settings:

* **HTTPS Access to System:** Enables SSL/TLS access to Vantage GUI and REST API. When this option is enabled, the SSL Profile and SSL/TLS Certificate fields must be populated. You can specify an **HTTPS Port** other than the default (443) if you wish.
* **HTTP Access to System:** Enables HTTP access to the Vantage GUI and REST API. This option is insecure and not recommended. You can specify an **HTTP Port** other than the default (80) if you wish.
* **Allow Basic Authentication**: You can enable/disable this simple technique for enforcing access controls to the Vantage UI and REST API. Using it causes HTTP to prompt the Vantage user for a username and password, and to return the values to Vantage for authentication and authorization. Basic authentication (BA) doesn't require cookies, session identifiers, or login pages; rather, it uses standard, base64-encoded fields in the HTTP header, which are not encrypted or hashed in any way. If used, it is recommended that HTTPS be used in conjunction.
* **Redirect HTTP to HTTPS:** When HTTP Access to System is disabled, enabling this option will automatically redirect administrators to the HTTPS interface for the Vantage UI and API.
* **SSL Profile:** Select an SSL Profile to complement the choice of HTTPS Access to System. This profile is from Templates &gt; Security &gt; SSL Profiles, which is also referenced by SSL-enabled virtual services.
* **SSL/TLS Certificate:** Select an SSL certificate to present to clients connecting to the Vantage GUI. RSA and or Elliptic Curve (EC) are supported.
* **Allowed Ciphers:** Allowed ciphers list for SSH to the management interface on the Controller and SEs. If this is not specified, all the default ciphers are allowed.
* **Allowed HMACs:** Allowed HMAC list for SSH to the management interface on the Controller and SEs. If this is not specified, all the default HMACs are allowed. 

The following option is related to **SNMP**:

* **SNMP Community:** The string to be furnished by an external SNMP v2c manager wishing to query the SNMP daemon running on the Avi Controller leader. Refer to the <a href="/docs/16.2/snmp-support-in-avi-vantage">SNMP Support in Avi Vantage</a> article for additional information. 

The **Client Management Access to Avi Controller** section specifies four kinds of clients that can be enumerated as legitimate accessors of the system:

<ol> 
 <li>SSH Clients</li> 
 <li>CLI Shell Clients</li> 
 <li>External HTTP(S) Clients</li> 
 <li>External SNMP Clients</li> 
</ol> 

For each one can flexibly specify clients by IP address and/or string/IP groups.

The following options govern two **Banners** that Vantage will display if set:

* **Message of the Day**: Shown to users after a successful login, be it via the UI, CLI, or SSH.
* **Login Banner**: Displayed prior to logging in via SSH or UI. 