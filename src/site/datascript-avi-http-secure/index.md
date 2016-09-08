---
title: DataScript: avi.http.secure
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.secure()</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns the string ‘on’ if client to the Virtual Service connection operates in SSL/TLS mode, or an empty string if false.</td> 
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
   <td width="600">String, ‘<em>on</em>’ if true, ‘<em>nil</em>’ if false.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If the HTTP request is not SSL then redirect it to secure HTTPS.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.secure() ~= "on" then
   avi.http.redirect("https://" ..
   avi.http.hostname() ..
   avi.http.get_uri())
end</code></pre> 
    <!-- [Format Time: 0.0031 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>