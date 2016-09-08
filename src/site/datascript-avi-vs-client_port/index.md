---
title: DataScript&#58; avi.vs.client_port
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.vs.client_port()</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Returns the client's source port.</td> 
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
   <td width="600">String containing client’s source port.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Simple way to provide A/B testing by distributing 1/10th of connections to pool1.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.endswith(avi.vs.client_port(), "0") then
   avi.pool.select("Pool1")
else avi.pool.select("Pool2")
end</code></pre> 
    <!-- [Format Time: 0.0024 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>