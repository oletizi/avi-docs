---
title: DataScript&#58; avi.http.set_userid
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.set_userid()</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Sets the user ID associated with a connection. Setting this field with this command will overwrite the field if it was populated via HTTP Basic Auth or via a Client Certificate.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600">None</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">No value returned</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If userid does not exist, populated it with the JSessionID cookie value.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if not avi.http.get_userid() then
   if avi.http.get_cookie("jsessionid") then
      avi.http.set_userid(avi.http.get_cookie("jsessionid"))
   else avi.http.set_userid("Unknown")
   end
end</code></pre> 
    <!-- [Format Time: 0.0042 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>