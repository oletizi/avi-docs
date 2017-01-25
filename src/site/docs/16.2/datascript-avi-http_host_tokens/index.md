---
title: DataScript&#58; avi&#46;http_host_tokens
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_host_tokens( [start [, end]] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Retrieve individual host sections, or tokens, from the hostname (aka strings separated by the delimiter ‘.’) when called without arguments. The command provides the flexibility to get a slice of host tokens (see examples below) when start and/or end indices are provided.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>start</em> </strong>and/or <em><strong>end</strong> </em>indices, which allow parsing out section of the host header.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>If no start and end indices are specified, returns a table of all the host tokens. If either start index is specified or both start and end indices are specified, returns a string.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Example host header: <em>http://<strong>www.avinetworks.com</strong>/a/b/index.htm?avi=true</em><p></p> <p>Returns ‘www.avinetworks.com’<br> 
 <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">avi.http.get_host_tokens(1)</code></pre> 
<!-- [Format Time: 0.0012 seconds] --> Returns ‘avinetworks’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_host_tokens(2,2)</code></pre> 
<!-- [Format Time: 0.0013 seconds] --> Returns ‘nil’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_host_tokens(6)</code></pre> 
<!-- [Format Time: 0.0008 seconds] --> Validate the second and third fields of the hostname are ‘avinetworks.com’.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">domain = avi.http.get_host_tokens(2, 3)
if domain ~= "avinetworks.com" then
   avi.http.redirect("new.avinetworks.com")
end</code></pre> 
<!-- [Format Time: 0.0023 seconds] --></td>
</tr>
</tbody>
</table> 