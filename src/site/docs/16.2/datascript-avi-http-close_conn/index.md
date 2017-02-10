---
title: DataScript&#58; avi&#46;http&#46;close_conn
layout: layout162
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.close_conn( [reset] )</b></span></td>
</tr>
<tr>   
<td><h4><span id="Description"><strong>Description</strong></span></h4></td>
<td>Closes the current TCP connection.</td>
</tr>
<tr>   
<td><h4><span id="Events"><strong>Events</strong></span></h4></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><h4><span id="Parameter"><strong>Parameter</strong></span></h4></td>
<td>The <strong><em>reset</em> </strong>flag will RST the connection, rather than use the default FIN.</td>
</tr>
<tr>   
<td><h4><span id="Returns"><strong>Returns</strong></span></h4></td>
<td>No return value</td>
</tr>
<tr>   
<td><h4><span id="Example"><strong>Example</strong></span></h4></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.client_ip() == "10.1.1.1" then
   avi.http.close_conn()
end</code></pre> 
<!-- [Format Time: 0.0013 seconds] --></td>
</tr>
</tbody>
</table> 