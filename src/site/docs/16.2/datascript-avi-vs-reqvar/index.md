---
title: DataScript&#58; avi&#46;vs&#46;reqvar
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.reqvar.*</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Sets (write) or gets (read) a variable. These variables have scope across the HTTP_REQ and HTTP_RESP events. Their lifetime is limited to that of the HTTP request/response transaction, so it does not need to be manually unset. Any Lua value can be stored within this variable.<p></p> <p>For variable data that is only required during the current event, simply map the variable to the data.<br> 
 <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">var = 1
if var == 1 then ...</code></pre> 
<!-- [Format Time: 0.0010 seconds] --> For variable data that needs to be saved across connections or mirrored to other Service Engines for the virtual service use <a href="/docs/16.2/datascript-avi-vs-table_insert">avi.vs.table_insert()</a></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>None</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>Boolean <em>true</em> upon refresh success and <em>false</em> upon refresh failure.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>HTTP_REQ event:<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.vs.reqvar.foo = 10</code></pre> 
<!-- [Format Time: 0.0010 seconds] --> HTTP_RESP event:<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.vs.reqvar.foo == 10 then
   avi.vs.log("Foo=" .. avi.vs.reqvar.foo)
end</code></pre> 
<!-- [Format Time: 0.0017 seconds] --></td>
</tr>
</tbody>
</table> 