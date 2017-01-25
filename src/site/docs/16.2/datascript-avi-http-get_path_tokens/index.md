---
title: DataScript&#58; avi&#46;http&#46;get_path_tokens
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_path_tokens( [start [, end]] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Retrieve individual path sections, or tokens, from the URI’s path (aka strings separated by the delimiter ‘/’). The command provides the flexibility to get a slice of path tokens (see examples below) when start and/or end indices are provided.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>start</em> </strong>and <strong><em>end</em> </strong>indices allow parsing out section of the path. These parameters are expressed as an integer.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>If no start and end indices are specified, returns a Lua table of all the path tokens. If either start index is specified or both start and end indices are specified, returns a string.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Example: <em>https://www.avinetworks.com<strong>/a/b/c/d/e.htm</strong></em><p></p> <p>Returns a table which is an array with values ‘a’, ‘b’, ‘c’, ‘d’, ‘e.htm’. All tokens are returned.<br> 
 <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">avi.http.get_path_tokens()</code></pre> 
<!-- [Format Time: 0.0006 seconds] --> Returns ‘a/b/c/d/e.htm’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens(1)</code></pre> 
<!-- [Format Time: 0.0006 seconds] --> Returns ‘c/d/e.htm’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens(3)</code></pre> 
<!-- [Format Time: 0.0010 seconds] --> Returns ‘b/c’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens(2,3)</code></pre> 
<!-- [Format Time: 0.0010 seconds] --> Returns ‘nil’<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens(7)</code></pre> 
<!-- [Format Time: 0.0006 seconds] --></td>
</tr>
</tbody>
</table> 