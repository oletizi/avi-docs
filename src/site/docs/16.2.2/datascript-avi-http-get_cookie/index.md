---
title: DataScript&#58; avi&#46;http&#46;get_cookie
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.get_cookie( name [, context] )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the value of a specific cookie from the client request or server response header.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>Specify the <strong><em>name</em> </strong>of the cookie to inspect.<br> Rather than inspect the cookie from the current event context, specify the context of either <strong><em>avi.HTTP_REQUEST</em></strong> or <strong><em>avi.HTTP_RESPONSE</em></strong> to inspect cookies from those events.  For instance, during an HTTP response event, check for a cookie sent by the client during the request event.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>String of the cookie’s value if it exists, else <em>nil</em>.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Check the value of cookie named ‘foo’. If the value is not ‘bar’, then do something.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_cookie("foo") ~= "bar" then
   -- do something with the cookie header
end</code></pre> 
<!-- [Format Time: 0.0011 seconds] --></td>
</tr>
</tbody>
</table> 