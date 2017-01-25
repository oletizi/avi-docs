---
title: DataScript&#58; avi&#46;vs&#46;client_port
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.vs.client_port()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the client's source port.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>None</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>String containing client’s source port.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Simple way to provide A/B testing by distributing 1/10th of connections to pool1.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.endswith(avi.vs.client_port(), "0") then
   avi.pool.select("Pool1")
else avi.pool.select("Pool2")
end</code></pre> 
<!-- [Format Time: 0.0019 seconds] --></td>
</tr>
</tbody>
</table> 