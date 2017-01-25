---
title: DataScript&#58; avi&#46;http&#46;get_cookie_names
layout: layout163
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.get_cookie_names ( [context] )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns all the cookies present in the HTTP request or response, determined by the context flag.  When context is not specified, the context is chosen based on the event which executed the DataScript.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td><strong><em>context</em> </strong>is the optional argument specifying either avi.HTTP_REQUEST or avi.HTTP_RESPONSE.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>A table containing the cookie names, and a number to indicate the number of cookies present.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cookies, count = avi.http.get_cookie_names()
if count == 0 then
   -- No cookies found, do something
end</code></pre> 
<!-- [Format Time: 0.0013 seconds] --></td>
</tr>
</tbody>
</table> 