---
title: Overview of SSL/TLS Termination
layout: default
---
Avi Vantage fully supports termination of SSL- and TLS-encrypted HTTPS traffic. The SSL and TLS names are used interchangeably throughout the documentation unless otherwise noted.

Using Vantage as the endpoint for SSL enables it to maintain full visibility into the traffic and also to apply advanced traffic steering, security, and acceleration features. The following deployment architectures are supported for SSL:

* **None**: SSL traffic is handled as pass-through (layer 4), flowing through Vantage without terminating the encrypted traffic.
* **Client-side**: Traffic from the client to Vantage is encrypted, with unencrypted HTTP to the back-end servers.
* **Server-side**: Traffic from the client to Vantage is unencrypted HTTP, with encrypted HTTPS to the back-end servers.
* **Both**: Traffic client the client to Vantage is encrypted and terminated at Vantage, which then re-encrypts traffic to the back-end server.
* **Intercept**:  Terminate client SSL traffic, send it unencrypted over the wire for taps to intercept, then encrypt  to the destination server. 

 

### Configuring SSL/TLS Termination

Vantage supports multiple architectures for terminating SSL traffic.  For client to Vantage SSL, the configuration will be done in the virtual service page.  For Vantage to server SSL encryption, the configuration is performed by editing the pool. For either, a virtual service or pool must be configured with an SSL Profile and an SSL Certificate, described below.

* Virtual Service Configuration
* <a href="/docs/16.3/configuration-guide/applications/pools/">Pool Configuration</a>
* <a href="/docs/16.3/server-name-indication">Server Name Indication (SNI)</a> 

 

### SSL Profile

The profile contains the settings for the SSL-terminated connections.  This includes the list of supported ciphers and their priority, the supported versions of SSL/TLS, and a few other options.

* <a href="/docs/16.3/ssl-tls-profile">SSL Profile</a>
* <a href="/docs/16.3/app-transport-security">App Transport Security</a>
* <a href="/docs/16.3/ssl-tls-version-support">SSL Version Support</a>
* <a href="/docs/16.3/configure-stronger-ssl-cipher-strength">Configure Strong SSL Cipher Strength</a> 

 

### SSL Certificate

An SSL certificate is presented to a client to authenticate the application.  A virtual service may be configured with two certificates at the same time, one each of RSA and elliptic curve cryptography (ECC).  A certificate may also be used for authenticating Vantage to back-end servers.

* <a href="/docs/16.3/ssl-certificates">SSL Certificates</a>
* <a href="/docs/16.3/ecc-versus-rsa-certificate-priority">EC versus RSA Certificate Priority</a>
* <a href="/docs/16.3/notification-of-ssl-certificate-expiration">Notification of Certificate Expiration</a>
* <a href="/docs/16.3/client-ssl-certificate-validation">Client Certificate Validation / PKI Profile</a>
* <a href="/docs/16.3/physical-security-for-ssl-keys">Physical Security for SSL Certificates</a>
* <a href="/docs/16.3/thales-nshield-integration-2">Thales nShield Integration</a> 

 

### SSL Performance

The performance of SSL-terminated traffic is dependent on the underlying hardware allocated to the Avi Service Engine, the number of SEs available to handle the virtual service, and the certificate and ciphers settings negotiated. As a general rule of thumb, each vCPU core can handle about 500 RSA transactions per second (TPS) or 2000 ECC TPS.  A vCPU core can push about 1 Gb/s SSL throughput.  SSL-terminated concurrent connections are more expensive than straight HTTP or layer 4 connections, and may necessitate additional memory to sustain high concurrency.

* <a href="/docs/16.3/ssl-performance">SSL Performance</a>
* <a href="/docs/16.3/se-memory-consumption">SE Memory Consumption</a> 

 

### Additional Topics

SSL is a complicated subject, occasionally requiring redirects, rewrites, and other manipulation of HTTP to ensure proper traffic flow. Vantage includes a number of useful tools for troubleshooting and correcting SSL-related issues. They are described in the articles below.

* <a href="/docs/16.3/ssl-everywhere">SSL Everywhere</a>
* <a href="/docs/16.3/redirect-http-to-https">HTTP to HTTPS Redirect</a>
* <a href="/docs/16.3/ssl-visibility-and-troubleshooting">SSL Visibility and Troubleshooting</a> 