---
title: DataScript&#58; avi&#46;pool&#46;get_servers
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.pool.get_servers( pool )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Check the number of servers with 'up' status and total number of servers configured within a specified pool.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td><strong><em>pool</em> </strong>can be a pool name or an expression that evaluates to a valid pool name.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Returns the number of up servers and the number of total servers within the pool.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Forward the request to an explicit destination.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">servers_up, servers_total = avi.pool.get_servers("web-pool")
   if servers_up == 0 then
   avi.http.response(503)
end</code></pre> 
<!-- [Format Time: 0.0028 seconds] --></td>
</tr>
</tbody>
</table> 