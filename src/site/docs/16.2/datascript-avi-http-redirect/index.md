---
title: DataScript&#58; avi&#46;http&#46;redirect
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.redirect( uri [,status] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Issues an HTTP redirect to a specified URI with a specified status code. This command is available only in the HTTP_REQ event. If a redirect needs to be performed in HTTP_RESP event, use <a href="/docs/16.2/datascript-avi-http-response">avi.http.response()</a> which can be used to craft a response.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>uri</em> </strong>is a string which will be the new URI to redirect the current request to.<p></p> <p>Optional <em><strong>status</strong> </em>code is a number for the redirect status code. Use either the status code number or the constant string. Supported status codes are:</p> 
<ul> 
 <li> 301 avi.HTTP_MOVED_PERMANENTLY</li> 
 <li> 302 avi.HTTP_MOVED_TEMPORARILY</li> 
 <li> 307 avi.HTTP_TEMPORARY_REDIRECT</li> 
</ul> <p>When no status code is provided, the default is 302.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>No return value</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Redirect an HTTP request received on service port 80 to port 443.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.port() ~= "443" then
   avi.http.redirect("https://" .. avi.vs.host() .. avi.http.get_uri())
end</code></pre> 
<!-- [Format Time: 0.0039 seconds] --></td>
</tr>
</tbody>
</table> 