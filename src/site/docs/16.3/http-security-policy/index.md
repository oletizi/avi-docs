---
title: HTTP Security Policy
layout: 16.3
---
The following table lists both the available HTTP security match criteria and the configurable actions that can occur when a match is made.  

<table class=" table table-bordered table-hover">  
<tbody>                
<tr>   
<td rowspan="10"><strong>Match</strong></td>
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
<td><b>Path:</b><span class="Apple-converted-space"> </span>The path or a group of paths. Paths do not need to begin with a ‘/’. For comparison purposes, Vantage automatically omits any initial slash specified in the match field. Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/<b>marketing/index.html</b>?a=1&amp;b=2</i></td>
</tr>
<tr>  
<td><b>Query:</b><span class="Apple-converted-space"> </span>A query or a group of queries. Do not add the leading ‘?’ or ‘&amp;’ characters to a match. Example:<span class="Apple-converted-space"> </span><i>https://www.avinetworks.com/marketing/index.html?<b>a=1&amp;b=2</b></i></td>
</tr>
<tr>  
<td><b>Headers:</b><span class="Apple-converted-space"> </span>True if a header exists, or if it exists and contains a specified value</td>
</tr>
<tr>  
<td><b>Cookie:</b><span class="Apple-converted-space"> </span>True if a cookie exists, or if it exists and contains a specified value</td>
</tr>
<tr>  
<td><b>Host Header:</b><span class="Apple-converted-space"> </span>The request’s host header. Example:<span class="Apple-converted-space"> </span><i>https://<b>www.avinetworks.com</b>/marketing/index.html?a=1&amp;b=2</i></td>
</tr>
<tr>   
<td rowspan="5"><strong>Actions</strong></td>
<td><b>Logging:</b><span class="Apple-converted-space"> </span>Selecting the logging checkbox causes Vantage to log when an action has been invoked.</td>
</tr>
<tr>  
<td><b>Action Allow:</b><span class="Apple-converted-space"> </span>Allows matched requests to continue on to further policies or to the destination pool servers.</td>
</tr>
<tr>  
<td><b>Action Close Conn:</b><span class="Apple-converted-space"> </span>Matched requests will cause Vantage to close the TCP connection that received the request via a FIN. Many browsers open multiple connections, which are not closed unless requests sent over those connections also trigger a close connection action.</td>
</tr>
<tr>  
<td><b>Redirect To HTTPS:</b><span class="Apple-converted-space"> </span>Respond to the request with a temporary redirect to the desired port for SSL.</td>
</tr>
<tr>  
<td><b>Action Send Response:</b> Vantage may serve an HTTP response using HTTP status code 200 (success), 403 (unauthorized), or 404 (file not found). A default page is rendered by the browser for each of these status codes, or you may upload a custom .html file. This file may have links to images or other files, but only the initial html file will be stored and served via the Send Response.</td>
</tr>
</tbody>
</table> 

 

