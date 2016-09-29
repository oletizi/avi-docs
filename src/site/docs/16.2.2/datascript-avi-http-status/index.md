---
title: DataScript&#58; avi&#46;http&#46;status
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.status()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Response status code that will be sent to the client. This may be different than the status code sent back from the server as a DataScript could override. See the example for avi.var.server_status.</td>
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
<td>String of the status code, such as 200.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.status() == "400" then
   avi.http.response("404")
end</code></pre> 
<!-- [Format Time: 0.0013 seconds] --></td>
</tr>
</tbody>
</table> 