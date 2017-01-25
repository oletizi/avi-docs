---
title: TACACS+ Authentication
layout: default
---
Avi Vantage supports authentication and authorization of Vantage users with TACACS+. TACACS+ is an open standards protocol that handles authentication and accounting (the first two "A"s in "AAA").

## TACACS+ AAA Settings

* **TACACS+ Servers:** TACACS+ server IP. Multiple servers can be specified. If the first server does not respond, Vantage tries the next server. If that server also does not reply, the next server is tried, in round-robin fashion. Click Add Item to add a server.
* **Port:** TACACS+ server port (default 49).
* **Password:** TACACS+ server shared secret.
* **TACACS+ Service:** TACACS+ service type, used in all authentication and authorization queries.
* **TACACS+ Authorization attributes:** Set of attribute value pairs to identify the host. The TACACS+ server configures user-level authorization based on these attributes. Cisco Access Control Servers (ACSs) typically expect authorization attribute values for “service” and “protocol” to be populated in order to identify and authorize a Vantage user. Authorization attributes from a TACACS+ server can be used to map Vantage users to various roles and tenants. If the attribute is required, click Mandatory. Click Add Attribute to add additional name-value pairs. 

## Authentication and Authorization Walkthrough

Authentication and authorization of a Vantage user with TACACS+ takes place as follows:
<ol> 
 <li>AUTHEN START packet from Vantage to TACACS+ server. Contains: 
  <ul> 
   <li>action=login</li> 
   <li>authen_type=ascii</li> 
   <li>service=</li> 
   <li>user=</li> 
   <li>remote_addr=</li> 
  </ul> </li> 
 <li>AUTHEN REPLY packet from TACACS+ server to Vantage. Contains status of type GETPASS indicating that password needs to be supplied for the user message field with text “Password.”</li> 
 <li>AUTHEN CONTINUE packet from Vantage to TACACS+ server. Contains user message field with actual password from user.</li> 
 <li>AUTHEN REPLY packet from TACACS+ server to Vantage. Contains: 
  <ul> 
   <li>SUCCESS status if password is valid and user is allowed</li> 
   <li>FAILED status</li> 
  </ul> </li> 
 <li>AUTHOR START packet from Vantage to TACACS+ server. Contains: 
  <ul> 
   <li>Username of the user</li> 
   <li>Remote address of the user</li> 
   <li>Authorization attribute name, value and whether or not they are mandatory</li> 
   <li>An authorization attribute string “abc=xyz” that indicates an attribute named “abc” is mandatory and has value “xyz”</li> 
   <li>An authorization attribute string “abc*xyz” that indicates an attribute named “abc” is optional and has value “xyz”</li> 
  </ul> </li> 
 <li>AUTHOR REPLY packet from TACACS+ server to Vantage. Contains one of the following: 
  <ul> 
   <li>PASS_ADD or PASS_REPL status, which authorizes the successfully authenticated user with attribute value pairs to be added or replaced.</li> 
   <li>FAIL status, indicating the user is not authorized.</li> 
  </ul> </li> 
</ol> 

### Encryption

All TACACS+ packets are encrypted, whereas the 12-byte header is passed in the clear. Encryption is part of the TACACS+ standard and is compatible with all TACACS+ servers.

### Error Handling

If an error is indicated in the Status field of any reply packet during this process, the user login is rejected and results in a failure.

### Other Articles of Interest:

<a href="/docs/17.1/tacacs-configuration-examples/">TACACS+ Configuration Examples</a>
