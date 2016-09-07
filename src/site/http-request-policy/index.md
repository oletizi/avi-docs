---
title: HTTP Request Policy
layout: default
---
HTTP request policies allow manipulation of HTTP requests. These requests may be modified before they are forwarded to the server, used as a basis for content switching, or discarded. The HTTP request policies may only be applied to a layer 7 virtual service configured with an HTTP profile. The table below lists the match criteria available under HTTP request, as well as the actions that can be configured to occur upon a match being made.

 
**Match** **Client IP:** Client IP address or a group of client addresses.

* Use a "**-**" to specify a range: 10.0.0.0-10.1.255.255
* Use a "**/**" to specify a netmask: 10.0.0.0/24 **Service Port:** The ports the virtual service is listening on. **Protocol Type:** HTTP or HTTPS.
Example: **https:**//www.avinetworks.com/marketing/index.html?a=1&b=2 **HTTP Method:** The method used by the client request. The match is true if any one of the methods that an administrator specifies is true. **HTTP Version:** True if the client version is .9, 1.0, or 1.1 **Path:** The path or a group of paths. Paths do not need to begin with a ‘/’.
Example: https://www.avinetworks.com/**marketing/index.html**?a=1&b=2 **Query:** A query or a group of queries. Do not add the leading ‘?’ or ‘&’ characters to a match.
Example: https://www.avinetworks.com/marketing/index.html?**a=1&b=2** **Headers:** True if a header exists, or if it exists and contains a specified value **Cookie:** True if a cookie exists, or if it exists and contains a specified value **Host Header:** The request’s host header.
Example: https://**www.avinetworks.com**/marketing/index.html?a=1&b=2 **Actions** **Logging:** Selecting the logging checkbox causes Vantage to log when an action has been invoked. **Redirect URL:** Redirects a client to a different protocol, port, host, or path. By default the host, path, and query are not altered unless an administrator populates those fields. The path field does not require a leading “/” slash character. To create a simple HTTP to HTTPS redirect, simply set the protocol to HTTPS. NOTE: The redirect action may not be stacked with other actions. **Modify Header:** Allows adding, replacing, or removing of an HTTP header or cookie. **Rewrite URL:** Similar to ProxyPass functionality, this action allows for the client’s requested URL to be rewritten into a URL that the server understands. For instance, the client should usewww.avinetworks.com/sales, while the server may be configured for sales.avinetworks.com. The path field does not require a leading "**/**" slash character. **Content Switch:** Forward matched requests to a pool, or a specific server with that pool. Alternatively, Vantage can serve an HTTP response using HTTP status code 200 (success), 403 (unauthorized), 404 (file not found), or 429 (too many requests). A default page is sent for each of these status codes, or a custom html file may uploaded.

 