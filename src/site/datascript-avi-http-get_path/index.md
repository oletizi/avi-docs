---
title: DataScript&#58; avi.http.get_path
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.get_path( [false] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Returns the client request’s parsed URI path, i.e. the part of the URI without the query which starts with the first ‘/’ and up to but excluding the ‘?’.<p></p> <p>The highlighted portion of the request is included in the path:<br> <em>http://www.avinetworks.com<strong>/path1/path2/index.html</strong>?a=b&amp;c=d</em></p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600">When the optional flag is set to <strong><em>false</em></strong>, the returned URI path is unparsed, i.e. is not URI decoded.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">A string value of the URI path</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">For an IIS shop, drop bots searching for PHP backdoors<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.endswith(avi.http.get_path(), ".php") then
   avi.http.close_conn(true)
end</code></pre> 
    <!-- [Format Time: 0.0021 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>