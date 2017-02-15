---
title: Client SSL Certificate Validation
layout: layout163
---
Avi Vantage can validate SSL certificates presented by clients against a trusted certificate authority and a configured client revocation list (CRL). Additional options support passing certificate information to the server through various HTTP headers. The certificate authentication requires configuring an HTTP application profile and an associated PKI profile, both defined below.

### HTTP Profile

Within the Templates > Profiles > HTTP Profile > Security page is the section for enabling Client SSL Certificate Validation.

### Validation Type

* **None**: When set to none, no validation of client certificates will be performed.  If the virtual service is terminating SSL/TLS connections, the client's certificate will be ignored.
* **Request**: This setting expects clients to present a client certificate. If a client does not present a certificate, or if the certificate fails the CRL check, the client connection and requests are still forwarded to the destination server in an HTTP header. This enables the server make the final determination to allow or deny the client.
* **Require**: Vantage requires a valid certificate be presented by the client. The certificate must pass the CRL check defined in the PKI profile. The client certificate, or relevant fields, may still be passed to the server through HTTP headers. 

### PKI Profile

The public key infrastructure (PKI) profile contains the configured certificate authorities (CA) and the CRL. A PKI profile is not necessary if validation is set to Request, but is required if validation is set to Require.

### HTTP Headers

Vantage may optionally insert the client's certificate, or parts of it, into a new HTTP header to be sent to the server. Using the plus icon, multiple headers may be inserted. These inserted headers may be in addition to any headers added or manipulated by the more granular HTTP policies or DataScripts.

* **HTTP Header Name**: Names the header to be inserted into the client request that is sent to the server.
* **HTTP Header Value**: Used with the HTTP Header Name field, this field is used to determine the field of the client certificate to insert into the HTTP header sent to the server. Several options are more general, such as the SSL Cipher, which lists the ciphers negotiated between the client and Vantage. These more general headers may be used for non-client certificate connections by setting the Validation Type to Request. 

 

### PKI Profile

The Templates > Security > Public Key Infrastructure (PKI) profile supports configuration of the client certificate revocation list (CRLs) and the process for updating the lists. The PKI profile may be used to validate clients or server certificates.

* **Client Certificate Validation**: Vantage supports the ability to validate client access to an HTTPS virtual service via client SSL certificates. Clients will present their certificate when accessing the VS, which will be matched against a CRL. If the certificate is valid and the clients are *not* on the list of revoked certificates, they will be allowed access to the HTTPS VS. Client certificate validation is enabled via the HTTP profile’s Authentication tab. The HTTP profile will reference the PKI profile for specifics on the certificate authority (CA) and the CRL. A single PKI profile may be referenced by multiple HTTP profiles.

* **Server Certificate Validation**: Similar to validating a client certificate, Vantage can validate the certificate presented by a server, such as when an HTTPS health check is sent to a server. Server certificate validation also uses a PKI profile to validate the certificate presented. Server certificate validation can be configured by enabling SSL within the desired pool, then specifying the PKI Profile.

### Basic Settings

* **Name**: The unique name for the profile
* **Ignore Peer Chain**: When set to true, the certificate validation will ignore any intermediate certificates that might be presented. The presented certificate is only checked against the final root certificate for revocation. When this option is disabled (default), the certificate must present a full chain which is traversed and validated, starting from the client- or server-presented cert to the terminal root cert. Each intermediate cert must be validated and matched against a CA cert included in the PKI profile.
* **Host Header Check**:  Ensures the virtual service's VIP field, when resolved using DNS, matches the domain name field of the certificate presented from a server to Vantage when back-end SSL is enabled. If the server's certificate does not match, it is considered insecure and marked down.
* **Enable CRL Check**:  When checked, client's certificate will be verified against the client revocation list. 

### Certificate Authority

Add a new certificate from a trusted Certificate Authority. If more than one CA are included in the PKI profile, then a client's certificate need only match one of them to be valid. A client's certificate must match the CA as the root of the chain. If the presented cert has an intermediate chain, then each link in the chain must be included here. See Ignore Peer Chain to ignore intermediate validation checking.

### Client Revocation List

The CRL allows invalidation of certificates, or more specifically the certificate's serial number. The revocation list may be updated by manually uploading a new CRL, or by periodically downloading from a CRL server. If a client or server certificate is found to be in the CRL, the SSL handshake will fail, with a resulting log created to provide further information about the handshake.

* **Leaf Certificate CRL validation only**: When enabled, Vantage will only validate the leaf certificate against the CRL. The leaf is the next cert in the chain up from the client cert. A chain may consist of multiple certificates. To validate all certs against the CRL disable this option. Disabling this option means you need to upload all the CRLs issued by each certificate in the chain. Even if one CRL is missing, the validation process will fail.
* **Server URL**:  Specify a server from which to download CRL updates. Access to this server will be done from the Avi Controller IP addresses, which means they will require firewall access to this destination. The CRL server may be identified by an IP address or an FQDN along with an HTTP path, such as https://www.avinetworks.com/crl.
* **Refresh Time**:  After the elapsed period of time, Vantage will automatically download an updated version of the CRL. If no time is specified, Vantage will download a new CRL at the current CRL's lifetime expiration.
* **Upload Certificate Revocation List File**: Navigate to a CRL file for upload. Subsequent CRL updates can be done by manually uploading newer lists, or configuring the Server URL and Refresh Time to automate the process. 