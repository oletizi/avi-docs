---
title: DataScript&#58; string&#46;lower
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>string.lower(source)</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Converts the source string to all lowercase characters.  Avi operators are case sensitive, so "a" does not equal "A".</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>All</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td><strong><em>source</em> </strong>is the string to be converted</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>The source string in lowercase</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Evaluate a string from the HTTP path as all lower case characters.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.lower(avi.http.get_path() == "/sales" then
   ...</code></pre> 
<!-- [Format Time: 0.0018 seconds] --></td>
</tr>
</tbody>
</table> 