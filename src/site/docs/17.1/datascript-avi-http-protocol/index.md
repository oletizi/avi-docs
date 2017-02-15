---
title: DataScript&#58; avi&#46;http&#46;protocol
layout: layout171
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.protocol()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the HTTP protocol of the connection as a string, ‘http’ for plain HTTP or ‘https’ for HTTPS.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>None</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Returns ‘http’ or ‘https’</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>If the HTTP request is not SSL then redirect it to secure HTTPS.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.protocol() ~= "https" then
   avi.http.redirect("https://" ..
   avi.http.hostname() ..
   avi.http.get_uri())
end</code></pre> 
<!-- [Format Time: 0.0025 seconds] --></td>
</tr>
</tbody>
</table> 