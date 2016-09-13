---
title: DataScript&#58; avi.http.set_uri
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.set_uri( new_uri )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Rewrites the current HTTP request’s URI to the <strong><em>new_uri</em></strong> before the request is sent to a server. This action is generally transparent to the client, as opposed to a redirect, which forces a client to send a new request and incurs a round trip time cost.<p></p> <p>The highlighted portion of the request is included in the URI:<br> <em>http://www.avinetworks.com<strong>/path1/path2/index.html?a=b&amp;c=d</strong></em></p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600">The new URI must be specified.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">No return value</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Save a redirect RTT by proactively adding the '/' character to a blank URI.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_uri() == nil then
   avi.http.set_uri("/")
end</code></pre> 
    <!-- [Format Time: 0.0017 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>