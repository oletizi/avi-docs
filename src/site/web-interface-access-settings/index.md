---
title: Web Interface Access Settings
layout: default
---
Select Administration > Settings > Access Settings to open the System Access tab.

These options control access to the Vantage web interface.

* 
**HTTPS Access to System:** Enables SSL/TLS access to the Avi Vantage's GUI and REST API. When this option is enabled, the SSL Profile and SSL/TLS Certificate fields must be populated.
* 
**HTTP Access to System:** Allow HTTP access to the Vantage web interface and REST API. This option is insecure and not recommended.
* 
**Redirect HTTP to HTTPS:** When HTTP Access to System is disabled, enabling this option will automatically redirect administrators to the HTTPS interface for the web interface and API.
* 
**SSL Profile:** Select an SSL Profile to complete the HTTPS Access. This profile is from Templates > Security > SSL Profiles, which is also referenced by SSL enabled virtual services.
* 
**SSL/TLS Certificate:** Select an SSL certificate to present to clients connecting to the web interface. RSA and or Elliptic Curve (EC) are supported.
* 
**Allow Basic Authentication:** Uses HTTP to prompt the Vantage user for a username and password, and to return hte values to Vantage for authentication and authorization.
* 
**Allowed Ciphers:** List of the ciphers supported for HTTP basic authentication.
* 
**Allowed HMACs:** List of the HMACs supported for HTTP basic authentication.