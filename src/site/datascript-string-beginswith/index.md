---
title: DataScript&#58; string.beginswith
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>string.beginswith(source, target)</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Check if the source string begins with the target string.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">All</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>source</em> </strong>is the string to be checked.<p></p> <p><em><strong>target</strong> </em>is the string the source is matched against.</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">Boolean <em>true</em> if the source string begins with the target string, else <em>false</em>.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">If the path starts with “/sales/” redirect to a new URL<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">path = avi.http.get_path()
if string.beginswith(path, "/sales/") then
   avi.http.redirect("http://sales.test.com/index.html")
end</code></pre> 
    <!-- [Format Time: 0.0022 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>