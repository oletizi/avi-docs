---
title: DataScript: avi.http.remove_cookie
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.remove_cookie( name1, [name2, ...] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600"><span style="font-weight: 400;">Removes the given cookie(s) from either in the HTTP&nbsp;request or response based on the&nbsp;<span style="font-family: inherit; font-size: inherit; line-height: 1.42857;">current context the function&nbsp;was executed from within.</span></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600"><strong><em>name</em></strong> is a string of the cookie name.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">None</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Remove two cookies from the request or response.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.remove( "jsessionid", "lang" )</code></pre> 
    <!-- [Format Time: 0.0008 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>