---
title: DataScript&#58; avi&#46;http&#46;method
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.method()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the client’s request method, such as ‘GET’ or ‘POST’.</td>
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
<td>String of the method</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">method = avi.http.method()
if method ~= "GET" or method ~= "POST" then
   avi.http.response("403")
end</code></pre> 
<!-- [Format Time: 0.0018 seconds] --></td>
</tr>
</tbody>
</table> 