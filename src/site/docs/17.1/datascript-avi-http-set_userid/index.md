---
title: DataScript&#58; avi&#46;http&#46;set_userid
layout: layout171
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.http.set_userid()</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Sets the user ID associated with a connection. Setting this field with this command will overwrite the field if it was populated via HTTP Basic Auth or via a Client Certificate.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>None</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>No value returned</td>
</tr>
<tr>   
<td><font size="3"><strong>Example</strong></font></td>
<td>If userid does not exist, populated it with the JSessionID cookie value.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if not avi.http.get_userid() then
   if avi.http.get_cookie("jsessionid") then
      avi.http.set_userid(avi.http.get_cookie("jsessionid"))
   else avi.http.set_userid("Unknown")
   end
end</code></pre> 
<!-- [Format Time: 0.0030 seconds] --></td>
</tr>
</tbody>
</table> 