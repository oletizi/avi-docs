---
title: DataScript&#58; avi.http.close_conn
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.close_conn( [reset] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"> <h4><span id="Description"><strong>Description</strong></span></h4> </td> 
   <td width="600">Closes the current TCP connection.</td> 
  </tr> 
  <tr> 
   <td width="100"> <h4><span id="Events"><strong>Events</strong></span></h4> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <h4><span id="Parameter"><strong>Parameter</strong></span></h4> </td> 
   <td width="600">The <strong><em>reset</em> </strong>flag will RST the connection, rather than use the default FIN.</td> 
  </tr> 
  <tr> 
   <td width="100"> <h4><span id="Returns"><strong>Returns</strong></span></h4> </td> 
   <td width="600">No return value</td> 
  </tr> 
  <tr> 
   <td width="100"> <h4><span id="Example"><strong>Example</strong></span></h4> </td> 
   <td width="600"> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.client_ip() == "10.1.1.1" then
   avi.http.close_conn()
end</code></pre> 
    <!-- [Format Time: 0.0015 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>