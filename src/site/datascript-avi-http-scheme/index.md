---
title: DataScript: avi.http.scheme
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.scheme()</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Returns the HTTP protocol as a string concatenated with ‘://’. For plain HTTP ‘http://’ is returned and ‘https://’ for secure HTTPS.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600">None</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">Returns ‘http://’ or ‘https://’</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Redirect clients to test.com on the same protocol the were received on.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.hostname() ~= "test.com" then
   avi.http.redirect(avi.http.scheme() .. "test.com" .. avi.http.get_uri())
end</code></pre> 
    <!-- [Format Time: 0.0022 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>