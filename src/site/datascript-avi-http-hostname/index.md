---
title: DataScript&#58; avi.http.hostname
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.hostname()</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns the host name from the request. This field could be learned from the following sources, in the following order of precedence:<p></p> 
    <ul> 
     <li>Host name from the request line</li> 
     <li>Host name from the ‘Host’ request header field</li> 
     <li>The server name matching a request</li> 
    </ul> <p>NOTE: Host name does not include the port, even in case of a request line or host header of the form hostname:port</p></td> 
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
   <td width="600">String of the hostname requested by the client.&nbsp; It does not include the port.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If there is no host name, close the TCP connection.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">host = avi.http.hostname()
if not host then
   avi.http.close_conn()
end</code></pre> 
    <!-- [Format Time: 0.0022 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>