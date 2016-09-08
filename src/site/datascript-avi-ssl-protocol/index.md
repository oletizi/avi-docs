---
title: DataScript&#58; avi.ssl.protocol
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.ssl.protocol()</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Returns the protocol of an established SSL connection. For example: “TLSv1.1”.</td> 
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
   <td width="600">Returns a string of the SSL/TLS version or 'unknown'</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600"> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.ssl.protocol() == "TLSv1.0" then
   avi.http.response(404, {content_type="text/html"},
   "Your browser's SSL version, <b>" .. avi.ssl.protocol() .. "</b> is old. Upgrade your browser and try again.")
end</code></pre> 
    <!-- [Format Time: 0.0041 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>