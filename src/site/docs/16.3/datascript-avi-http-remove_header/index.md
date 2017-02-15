---
title: DataScript&#58; avi&#46;http&#46;remove_header
layout: layout163
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.remove_header( name )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Removes all the instances of a specified HTTP header from the current request or response, depending on the event the script is executed within.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td><strong><em>name</em> </strong>is a string specifying the header name. The name is treated as case insensitive.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>No return value</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>Remove a server response header that can identify which potential server vulnerabilities.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.remove_header("Server")</code></pre> 
<!-- [Format Time: 0.0008 seconds] --></td>
</tr>
</tbody>
</table> 