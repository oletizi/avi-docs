---
title: Client IP Address and the X-Forwarded-For Header
layout: 16.2
---
For TCP / HTTP traffic, Avi Vantage Source NATs the client's IP address, replacing it with the IP address of the Service Engine that proxied the connection.  A common requirement is to access the real client address from the server.  For HTTP servers, this is done via the X-Forwarded-For header.  The XFF header is inserted by the Service Engine into client requests destined for the server.  HTTP servers can be configured to capture the XFF IP address rather than the layer 3 address of the connection.  Apache uses *mod_remoteip*, while Nginx uses *ngx_http_realip_module* for this purpose.

XFF may be enabled for a virtual service via a number of mechanisms.  The easiest is to enable XFF via the HTTP application profile attached to the virtual service.  This feature also allows choosing a custom header name.  Policies and DataScripts can also serve this purpose, enabling further customization.

 
