---
title: DataScript&#58; avi&#46;pool&#46;server_ip
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.pool.server_ip()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the IP address of the server for this request or response. Keep in mind that with content switching or multiplexing, a single client connection may have multiple requests, each distributed to a different server.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>None</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Returns a string of the server's IP address</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.add_header("Server", avi.pool.server_ip())</code></pre> 
<!-- [Format Time: 0.0019 seconds] --></td>
</tr>
</tbody>
</table> 