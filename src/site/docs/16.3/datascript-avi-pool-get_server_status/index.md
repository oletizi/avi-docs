---
title: DataScript&#58; avi&#46;pool&#46;get_server_status
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.pool.get_server_status(pool, server, port)</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Determine the status of the server listening at a specified port.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>All three parameter fields are required.<p></p> <p><strong><em>pool</em> </strong>can be a specific pool name or an expression that evaluates to a valid pool name.</p> <p>The <strong><em>server</em> </strong>flag is the IP address or host name of the server, in quotes.</p> <p>The <strong><em>port</em> </strong>flag forwards the connection to a specific service port of the server. The port must be a number between 0 and 65536, or an expression that evaluates to a valid port number..</p></td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Return value of 0 indicates the server is down. Return value of 1 indicates the server is up.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>If a server is down, redirect traffic elsewhere.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.pool.get_server_status("web-pool", "10.1.1.1", "80") == 0 then
   avi.http.redirect("backupsite.com" .. avi.http.get_uri())
 end</code></pre> 
<!-- [Format Time: 0.0020 seconds] --></td>
</tr>
</tbody>
</table> 