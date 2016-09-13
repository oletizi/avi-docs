---
title: DataScript&#58; avi.http.set_query
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.set_query( integer | string | table )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Sets the request’s URI query.<p></p> <p>The highlighted portion of the request is included in the query:<br> <em>http://www.avinetworks.com/path1/path2/index.html?<strong>a=b&amp;c=d</strong></em><br> From the example a=b, a is the argument, b is the value</p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600">The new query may be an <strong><em>integer</em></strong>, a <em><strong>string</strong></em>, or a <strong><em>table</em></strong>. When the input is a string, it should not be prefixed with a ‘?’ character. When the input is a table, the query string is formed by treating the keys as arguments and the values as the value of the corresponding argument.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">No value returned</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600"> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_path() == "/sales" then
   avi.http.set_path("/")
   avi.http.set_query("sales=true")
end</code></pre> 
    <!-- [Format Time: 0.0021 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>