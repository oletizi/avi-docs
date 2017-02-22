---
title: DataScript&#58; avi&#46;vs&#46;port
layout: layout163
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.vs.port()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the virtual service port that received the request or connection.</td>
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
<td>String containing the virtual service port number.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Close the connection if the HTTP request did not arrive on port 443.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.port() ~= "443" then
   avi.http.close_conn()
end</code></pre> 
<!-- [Format Time: 0.0020 seconds] --></td>
</tr>
</tbody>
</table> 