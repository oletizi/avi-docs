---
title: DataScript&#58; avi&#46;http&#46;hostname
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.hostname()</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the host name from the request. This field could be learned from the following sources, in the following order of precedence:<p></p> 
<ul> 
 <li>Host name from the request line</li> 
 <li>Host name from the ‘Host’ request header field</li> 
 <li>The server name matching a request</li> 
</ul> <p>NOTE: Host name does not include the port, even in case of a request line or host header of the form hostname:port</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>None</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>String of the hostname requested by the client.  It does not include the port.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 1</strong></span></td>
<td>If there is no host name, close the TCP connection.<p></p> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">host = avi.http.hostname()
if not host then
   avi.http.close_conn()
end</code></pre> 
<!-- [Format Time: 0.0005 seconds] --> <p> </p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 2</strong></span></td>
<td>Rewrite the location header for relative redirects to absolute, while changing them to HTTPS. This DataScript should be applied to the HTTP Response event.<p></p> <p>The rewritten headers should look like:<br> <em>  https://www.test.com/index.htm</em><br> 
 <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">loc = avi.http.get_header("Location")
if loc and string.beginswith(loc, "/") then
   loc = "https://" .. avi.http.hostname() .. loc
   avi.http.replace_header("Location", loc)
end</code></pre> 
<!-- [Format Time: 0.0009 seconds] --></td>
</tr>
</tbody>
</table> 