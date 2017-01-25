---
title: HTTP Request Policy
layout: 16.3
---
HTTP request policies allow manipulation of HTTP requests. These requests may be modified before they are forwarded to the server, used as a basis for content switching, or discarded. The HTTP request policies may only be applied to a layer 7 virtual service configured with an HTTP profile. The table below lists the match criteria available under HTTP request, as well as the actions that can be configured to occur upon a match being made.

 

<table class=" table table-bordered table-hover">  
<tbody>                
<tr>   
<td rowspan="10"><strong>Match</strong></td>
<td><b>Client IP:</b><span class="Apple-converted-space"> </span>Client IP address or a group of client addresses.<p></p> 
<ul> 
 <li>Use a "<b>-</b>" to specify a range: 10.0.0.0-10.1.255.255</li> 
 <li>Use a "<b>/</b>" to specify a netmask: 10.0.0.0/24</li> 
</ul></td>
</tr>
<tr>  
<td><b>Service Port:</b><span class="Apple-converted-space"> </span>The ports the virtual service is listening on.</td>
</tr>
<tr>  
<td><b>Protocol Type:</b><span class="Apple-converted-space"> </span>HTTP or HTTPS.<br> Example:<span class="Apple-converted-space"> </span><i><b>https:</b>//www.avinetworks.com/marketing/index.html?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>HTTP Method:</b><span class="Apple-converted-space"> </span>The method used by the client request. The match is true if any one of the methods that an administrator specifies is true.</td>
</tr>
<tr>  
<td><b>HTTP Version:</b><span class="Apple-converted-space"> </span>True if the client version is .9, 1.0, or 1.1</td>
</tr>
<tr>  
<td><b>Path:</b><span class="Apple-converted-space"> </span>The path or a group of paths. Paths do not need to begin with a ‘/’.<br> Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/<b>marketing/index.html</b>?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>Query:</b><span class="Apple-converted-space"> </span>A query or a group of queries. Do not add the leading ‘?’ or ‘&amp;’ characters to a match.<br> Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/marketing/index.html?<b>a=1&amp;b=2</b></i></td>
</tr>
<tr>  
<td><b>Headers:</b><span class="Apple-converted-space"> </span>True if a header exists, or if it exists and contains a specified value</td>
</tr>
<tr>  
<td><b>Cookie:</b><span class="Apple-converted-space"> </span>True if a cookie exists, or if it exists and contains a specified value</td>
</tr>
<tr>  
<td><b>Host Header:</b><span class="Apple-converted-space"> </span>The request’s host header.<br> Example:<span class="Apple-converted-space"> </span><i>https://<b>www.avinetworks.com</b>/marketing/index.html?a=1&amp;b=2</i></td>
</tr>
<tr>   
<td rowspan="5"><strong>Actions</strong></td>
<td><b>Logging:</b><span class="Apple-converted-space"> </span>Selecting the logging checkbox causes Vantage to log when an action has been invoked.</td>
</tr>
<tr>  
<td><b>Redirect URL:</b><span class="Apple-converted-space"> </span>Redirects a client to a different protocol, port, host, or path. By default the host, path, and query are not altered unless an administrator populates those fields. The path field does not require a leading “/” slash character. To create a simple HTTP to HTTPS redirect, simply set the protocol to HTTPS. NOTE: The redirect action may not be stacked with other actions.</td>
</tr>
<tr>  
<td><b>Modify Header:</b><span class="Apple-converted-space"> </span>Allows adding, replacing, or removing of an HTTP header or cookie.</td>
</tr>
<tr>  
<td><b>Rewrite URL:</b><span class="Apple-converted-space"> </span>Similar to ProxyPass functionality, this action allows for the client’s requested URL to be rewritten into a URL that the server understands. For instance, the client should use<i>www.avinetworks.com/sales</i>, while the server may be configured for<span class="Apple-converted-space"> </span><i>sales.avinetworks.com</i>. The path field does not require a leading "<b>/</b>" slash character.</td>
</tr>
<tr>  
<td><b>Content Switch:</b><span class="Apple-converted-space"> </span>Forward matched requests to a pool, or a specific server with that pool. Alternatively, Vantage can serve an HTTP response using HTTP status code 200 (success), 403 (unauthorized), 404 (file not found), or 429 (too many requests). A default page is sent for each of these status codes, or a custom html file may uploaded.</td>
</tr>
</tbody>
</table> 

 

