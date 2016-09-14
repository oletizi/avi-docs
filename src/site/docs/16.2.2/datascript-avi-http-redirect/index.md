---
title: DataScript: avi.http.redirect
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.redirect( uri [,status] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Issues an HTTP redirect to a specified URI with a specified status code. This command is available only in the HTTP_REQ event. If a redirect needs to be performed in HTTP_RESP event, use <a href="/docs/latest/datascript-avi-http-response">avi.http.response()</a> which can be used to craft a response.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600"><strong><em>uri</em> </strong>is a string which will be the new URI to redirect the current request to.<p></p> <p>Optional <em><strong>status</strong> </em>code is a number for the redirect status code. Use either the status code number or the constant string. Supported status codes are:</p> 
    <ul> 
     <li> 301 avi.HTTP_MOVED_PERMANENTLY</li> 
     <li> 302 avi.HTTP_MOVED_TEMPORARILY</li> 
     <li> 307 avi.HTTP_TEMPORARY_REDIRECT</li> 
    </ul> <p>When no status code is provided, the default is 302.</p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">No return value</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Redirect an HTTP request received on service port 80 to port 443.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.port() ~= "443" then
   avi.http.redirect("https://" .. avi.vs.host() .. avi.http.get_uri())
end</code></pre> 
    <!-- [Format Time: 0.0033 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>