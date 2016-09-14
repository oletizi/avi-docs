---
title: DataScript&#58; string.upper
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>string.upper(source)</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">Converts the source string to all uppercase characters.  Avi operators are case sensitive, so "a" does not equal "A".  This command enables case insensitivity.</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">All</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>source</em> </strong>is the string to be converted</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">The source string in uppercase</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Evaluate the client's path as upper case characters. Client may have sent /Sales, /sales, or /SaLeS.  All would be marked true.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.upper(avi.http.get_path() == "/SALES" then
   ...</code></pre> 
    <!-- [Format Time: 0.0019 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>