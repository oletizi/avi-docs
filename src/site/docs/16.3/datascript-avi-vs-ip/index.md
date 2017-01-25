---
title: DataScript&#58; avi&#46;vs&#46;ip
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.ip()</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the virtual service IP address which accepted the request or connection.</td>
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
<td>Dotted decimal IP address string.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Insert a header informing the server which VS traffic originated from.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.add_header("VS_IP", avi.vs.ip())</code></pre> 
<!-- [Format Time: 0.0009 seconds] --></td>
</tr>
</tbody>
</table> 