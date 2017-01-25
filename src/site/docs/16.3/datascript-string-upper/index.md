---
title: DataScript&#58; string&#46;upper
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>string.upper(source)</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Converts the source string to all uppercase characters.  Avi operators are case sensitive, so "a" does not equal "A".  This command enables case insensitivity.</td>
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
<td>The source string in uppercase</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Evaluate the client's path as upper case characters. Client may have sent /Sales, /sales, or /SaLeS.  All would be marked true.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.upper(avi.http.get_path() == "/SALES" then
   ...</code></pre> 
<!-- [Format Time: 0.0012 seconds] --></td>
</tr>
</tbody>
</table> 