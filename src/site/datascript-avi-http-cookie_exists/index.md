---
title: DataScript&#58; avi.http.cookie_exists
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.cookie_exists( name, [context] )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns true if the cookie name exists in the HTTP request or response. The context determines the req/resp, when no context is specified the defualt context is based on the event the DataScript was executed from.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>name</em> </strong>is a string specifying the cookie name.<p></p> <p><strong><em>context</em> </strong>is the optional argument specifying either avi.HTTP_REQUEST or avi.HTTP_RESPONSE.</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">Boolean <em>true</em> if the cookie name exists else <em>false</em>.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If the ServerIP cookie exists, send the request to the server IP address defined within the cookie.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.cookie_exists("ServerIP") then
   avi.pool.select("Pool1", avi.http.get_cookie("ServerIP"))
end</code></pre> 
    <!-- [Format Time: 0.0020 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>