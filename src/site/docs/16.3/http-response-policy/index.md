---
title: HTTP Response Policy
layout: layout163
---
HTTP response policies evaluate responses from the server, and can be used to modify the server’s response headers. These policies are generally used to rewrite redirects or used in conjunction with HTTP request policies to provide a client to server name rewriting capability similar to Apache’s ProxyPass. If the intent is to create a hostname mapping from internal to external, consider using the more straightforward Host Name Translation feature within the advanced section of a virtual service. During the HTTP response match, the match criteria that are based on client data are evaluated against the original client request. For instance, if the client requested /fruit.htm, and a request policy modified the path to /cheese.htm, the response match rule for path would compare against the unmodified, original path sent from the client, /fruit.htm. The table below lists the match criteria available under HTTP response, as well as the actions that can be configured to occur upon a match being made.  

<table class=" table table-bordered table-hover">  
<tbody>                 
<tr>   
<td rowspan="13"><strong>Match</strong></td>
<td><b>Client IP:</b><span class="Apple-converted-space"> </span>Client IP address or a group of client addresses. 
<ul> 
 <li> Use a "<b>-</b>" to specify a range: 10.0.0.0-10.1.255.255 </li> 
 <li> Use a "<b>/</b>" to specify a netmask: 10.0.0.0/24 </li> 
</ul></td>
</tr>
<tr>  
<td><b>Service Port:</b><span class="Apple-converted-space"> </span>The ports the virtual service is listening on.</td>
</tr>
<tr>  
<td><b>Protocol Type:</b><span class="Apple-converted-space"> </span>HTTP or HTTPS. Example:<span class="Apple-converted-space"> </span><i><b>https:</b>//www.avinetworks.com/marketing/index.html?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>HTTP Method:</b><span class="Apple-converted-space"> </span>The method used by the client request. The match is true if any one of the methods that an administrator specifies is true.</td>
</tr>
<tr>  
<td><b>HTTP Version:</b><span class="Apple-converted-space"> </span>True if the client version is .9, 1.0, or 1.1</td>
</tr>
<tr>  
<td><b>Path:</b><span class="Apple-converted-space"> </span>The path or a group of paths. Paths do not need to begin with a ‘/’. Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/<b>marketing/index.html</b>?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>Query:</b><span class="Apple-converted-space"> </span>A query or a group of queries. Do not add the leading ‘?’ or ‘&amp;’ characters to a match. Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/marketing/index.html?<b>a=1&amp;b=2</b></i></td>
</tr>
<tr>  
<td><b>Headers:</b><span class="Apple-converted-space"> </span>True if a header exists, or if it exists and contains a specified value</td>
</tr>
<tr>  
<td><b>Cookie:</b><span class="Apple-converted-space"> </span>True if a cookie exists, or if it exists and equals a specified value</td>
</tr>
<tr>  
<td><b>Host Header:</b><span class="Apple-converted-space"> </span>The request’s host header. Example:<span class="Apple-converted-space"> </span><i>https://<b>www.avinetworks.com</b>/marketing/index.html?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>Location Header:</b><span class="Apple-converted-space"> </span>The location header may not exist for every website.</td>
</tr>
<tr>  
<td><b>HTTP Status:</b><span class="Apple-converted-space"> </span>The status of the response, such as 200 (success), 404 (file not found), or similar. The statuses can be separated by commas, or be a range. For example: 301, 302, 307, 308, 300-599</td>
</tr>
<tr>  
<td><b>Response Header:</b><span class="Apple-converted-space"> </span>Match based on a specific header sent by the server.</td>
</tr>
<tr>   
<td rowspan="4"><strong>Actions</strong></td>
<td><b>Logging:</b><span class="Apple-converted-space"> </span>Selecting the logging checkbox causes Vantage to log when an action has been invoked.</td>
</tr>
<tr>  
<td><b>Modify Header:</b><span class="Apple-converted-space"> </span>Allows for the addition, replacement, or removal of an HTTP header or cookie.</td>
</tr>
<tr>  
<td><b>Rewrite Location Header:</b><span class="Apple-converted-space"> </span>Changes the location header. Useful for proxying between internal and external names, such as<span class="Apple-converted-space"> </span><i>www.avinetworks.com/sales</i><span class="Apple-converted-space"> </span>to<span class="Apple-converted-space"> </span><i>sales.avinetworks.com/</i></td>
</tr>
</tbody>
</table> 

 

