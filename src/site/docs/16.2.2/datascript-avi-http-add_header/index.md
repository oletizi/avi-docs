---
title: DataScript&#58; avi.http.add_header
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.http.add_header( name, value )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Adds a header with a specified name and value into the client HTTP request headers or the server HTTP response headers. If a header already exists with the same name, a new header with the same name will be appended to the end of the list of existing headers.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>name</em> </strong>is a string specifying the new header’s name.<br> <strong><em>value</em> </strong>is a string specifying the new header’s value.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">No return value</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Add header named “X-Foo” with value “Bar” in the HTTP request if the user agent contains “Mozilla".<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">ua = avi.http.get_header("user-agent")
i,j = string.find(ua, "Mozilla")
if i then
   avi.http.add_header("X-Foo", "Bar")
end</code></pre> 
    <!-- [Format Time: 0.0035 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>