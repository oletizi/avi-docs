---
title: DataScript&#58; avi&#46;pool&#46;select
layout: layout162
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>         
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.pool.select( pool [, server [, port]] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Selects a pool or a specific server within a pool for the current request. The selection does not take effect if an HTTP Request Policy was also configured with a switching action to select a pool or a specific server in a pool. The switching action of the HTTP Request Policy takes <a href="/docs/16.2/datascript-guide/datascript-precedence/">precedence</a> over the DataScript's pool selection.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>pool</em> </strong>can be a specific pool name or an expression that evaluates to a valid pool name.<p></p> <p>The optional <strong><em>server</em> </strong>flag is the IP address or host name of the server, in quotes.</p> <p>The optional <strong><em>port</em> </strong>flag forwards the connection to a specific service port of the server. The port must be a number between 0 and 65536, or an expression that evaluates to a valid port number.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Caveats</strong></span></td>
<td>The pool name, server name or IP, and the server port may be called explicitly, or dynamically determined based on a Lua expression. If the pool name, server, or server port do not exist or are not able to be referenced by the virtual service, an error is generated.<p></p> 
<ul> 
 <li><em>Explicit</em> reference: A configuration error will be generated while saving the DataScript.</li> 
 <li><em>Dynamically</em> generated reference: A runtime error is generated, which results in a 500 error return to the client.</li> 
</ul></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>No value returned</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 1</strong></span></td>
<td>Forward the request to an explicit destination.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_path() == "/sales/" then
   avi.pool.select("sales-pool")
elseif avi.http.get_path () == "/engineering/" then
   avi.pool.select("engineering-pool", "apache1")
elseif avi.http.get_path () == "/marketing/" then
   avi.pool.select("marketing", "10.10.31.201")
end</code></pre> 
<!-- [Format Time: 0.0035 seconds] --></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 2</strong></span></td>
<td>Forward the request to a dynamically generated destination.<br> <em>www.avi.com/<strong>support</strong>/index.htm</em> would go to the support pool<br> <em>www.avi.com/<strong>sales</strong>/apac/index.htm</em> would go to the sales pool<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.pool.select(avi.http.get_path_tokens(1, 1))</code></pre> 
<!-- [Format Time: 0.0010 seconds] --></td>
</tr>
</tbody>
</table> 