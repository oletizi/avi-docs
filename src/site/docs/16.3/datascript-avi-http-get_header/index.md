---
title: DataScript&#58; avi&#46;http&#46;get_header
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.get_header( [[name] [context]] )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns a table holding all the headers and their values as a key/value pair in a table. By default, the command will be executed against server response headers for an HTTP_RESP event, and against client request headers when executed within an HTTP_REQ event.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>By default a table of all headers and their values are returned. When a header <strong><em>name</em> </strong>is specified, only the value of the specified header is returned as a string.<br> The context flag allows inspecting of header values from the <strong><em>avi.HTTP_REQUEST</em></strong> or <strong><em>avi.HTTP_RESPONSE</em></strong> events. For instance, during an HTTP_RESP event, the client request headers may be inspected.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>A table of headers and their values, or a string for a specific header value.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>The following example can be used to prevent a Shell Shock attack. This attack embeds a client header which starts with () characters.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">headers = avi.http.get_header()                -- get all the HTTP headers
for key,val in pairs(headers) do               -- iterate through all headers
   if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
      avi.http.close_conn()                    -- reset the TCP connection
   end
end</code></pre> 
<!-- [Format Time: 0.0035 seconds] --></td>
</tr>
</tbody>
</table> 