---
title: DataScript&#58; avi&#46;http&#46;get_userid
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_userid()</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the user ID associated with a connection. The userid may be used by the DataScript in a number of ways, such as evaluating a user against a white or blacklist. This field is also used in the client logs to populate the searchable UserID field. This field is populated via the following methods, prioritized in the following order:<p></p> 
<ol> 
 <li><strong>Custom</strong>: The userid may be explicitly set by a DataScript via the <a href="/datascript-avi-set_userid/">avi.http.set_userid()</a> command. For instance, DataScript may parse through a cookie to grab a user name or session ID, then insert that value into the user ID field.</li> 
 <li><strong>Basic Auth</strong>: If HTTP Basic Auth is enabled on the Virtual Service and a client authenticates, the username field will be used to populate the userid.</li> 
 <li><strong>Client Certificate</strong>: If client certificate authentication has been enabled, the userid will be populated with the user name field from the client certificate received during the SSL/TLS handshake.</li> 
</ol></td>
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
<td>String of the user ID, ‘nil’ if empty.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>If HTTP header 'username' exists, insert its value into the UserID field, else set the field to none.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if not avi.http.get_userid() then
   avi.http.redirect("http://login.foo.com")
end</code></pre> 
<!-- [Format Time: 0.0016 seconds] --></td>
</tr>
</tbody>
</table> 