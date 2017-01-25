---
title: DataScript&#58; avi&#46;ssl&#46;protocol
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.ssl.protocol()</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the protocol of an established SSL connection. For example: “TLSv1.1”.</td>
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
<td>Returns a string of the SSL/TLS version or 'unknown'</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.ssl.protocol() == "TLSv1.0" then
   avi.http.response(404, {content_type="text/html"},
   "Your browser's SSL version, <b>" .. avi.ssl.protocol() .. "</b> is old. Upgrade your browser and try again.")
end</code></pre> 
<!-- [Format Time: 0.0023 seconds] --></td>
</tr>
</tbody>
</table> 