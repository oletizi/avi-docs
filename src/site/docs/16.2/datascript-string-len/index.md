---
title: DataScript&#58; string&#46;len
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>string.len(source)</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the number of characters of the source string.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>All</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td><strong><em>source</em> </strong>is the string to be checked</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Numeric value</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Log the number of characters from the path of the client's request<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.vs.log(string.len(avi.http.get_path()))</code></pre> 
<!-- [Format Time: 0.0014 seconds] --></td>
</tr>
</tbody>
</table> 