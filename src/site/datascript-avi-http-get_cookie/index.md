---
title: DataScript&#58; avi.http.get_cookie
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.get_cookie( name [, context] )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns the value of a specific cookie from the client request or server response header.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600">Specify the <strong><em>name</em> </strong>of the cookie to inspect.<br> Rather than inspect the cookie from the current event context, specify the context of either <strong><em>avi.HTTP_REQUEST</em></strong> or <strong><em>avi.HTTP_RESPONSE</em></strong> to inspect cookies from those events.&nbsp; For instance, during an HTTP response event, check for a cookie sent by the client during the request event.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">String of the cookie’s value if it exists, else <em>nil</em>.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Check the value of cookie named ‘foo’. If the value is not ‘bar’, then do something.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_cookie("foo") ~= "bar" then
   -- do something with the cookie header
end</code></pre> 
    <!-- [Format Time: 0.0013 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>