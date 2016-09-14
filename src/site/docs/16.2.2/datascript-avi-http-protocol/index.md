---
title: DataScript&#58; avi.http.protocol
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.protocol()</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns the HTTP protocol of the connection as a string, ‘http’ for plain HTTP or ‘https’ for HTTPS.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600">None</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">Returns ‘http’ or ‘https’</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If the HTTP request is not SSL then redirect it to secure HTTPS.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.protocol() ~= "https" then
   avi.http.redirect("https://" ..
   avi.http.hostname() ..
   avi.http.get_uri())
end</code></pre> 
    <!-- [Format Time: 0.0038 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>