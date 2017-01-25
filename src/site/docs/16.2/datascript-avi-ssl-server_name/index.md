---
title: DataScript&#58; avi&#46;ssl&#46;server_name
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.ssl.server_name()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the domain name requested through SNI (Server Name Indication). This name is pulled from the SSL Hello request, and may be different from the HTTP hostname field.</td>
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
<td>A string of the requested SNI name.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Insert a header declaring the SNI name requested by the client.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.add_header("X-SNI ", avi.ssl.server_name())</code></pre> 
<!-- [Format Time: 0.0010 seconds] --></td>
</tr>
</tbody>
</table> 