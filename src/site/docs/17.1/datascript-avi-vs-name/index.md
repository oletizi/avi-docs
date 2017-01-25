---
title: DataScript&#58; avi&#46;vs&#46;name
layout: layout171
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.vs.name()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the name of the virtual service which accepted the request or connection.</td>
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
<td>String containing the virtual service name.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Insert a header in traffic sent to the server:<br> X-Source: www.avi.com-10.1.1.1<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.add_header("X-Source", avi.vs.name() .. "-" .. avi.vs.ip())</code></pre> 
<!-- [Format Time: 0.0019 seconds] --></td>
</tr>
</tbody>
</table> 