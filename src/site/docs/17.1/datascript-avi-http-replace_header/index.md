---
title: DataScript&#58; avi&#46;http&#46;replace_header
layout: layout171
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.replace_header( name, value )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Set an existing HTTP header to a specified value, overriding all existing headers of the same name. If the header does not already exist, it will be added. The header name is treated case insensitively for matching with existing headers.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>name</em> </strong>is a string specifying the header name.<br> <em><strong>value</strong> </em>is a string specifying the new header value.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>No return value</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Modify the header named “X-Forwarded-For” in the HTTP request to append the virtual service IP.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">xff = avi.http.get_header("x_forwarded_for")
if xff then
   avi.http.replace_header("X-Forwarded-For", xff ..", ".. avi.vs_ip())
end</code></pre> 
<!-- [Format Time: 0.0007 seconds] --></td>
</tr>
</tbody>
</table> 