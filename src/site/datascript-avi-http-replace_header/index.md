---
title: DataScript&#58; avi.http.replace_header
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.replace_header( name, value )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Set an existing HTTP header to a specified value, overriding all existing headers of the same name. The header name is treated case insensitively for matching with existing headers.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>name</em> </strong>is a string specifying the header name.<br> <em><strong>value</strong> </em>is a string specifying the new header value.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">No return value</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Modify the header named “X-Forwarded-For” in the HTTP request to append the virtual service IP.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">xff = avi.http.get_header("x_forwarded_for")
if xff then
   avi.http.replace_header("X-Forwarded-For", xff ..", ".. avi.vs_ip())
end</code></pre> 
    <!-- [Format Time: 0.0027 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>