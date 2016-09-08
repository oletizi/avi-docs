---
title: DataScript&#58; string.sub
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>string.sub(source, begin, [end])</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Extracts&nbsp;part of a string&nbsp;from a source string. &nbsp;Characters are count starting with a 1 for the first character, 2 for the second, etc. &nbsp;Characters may also be negative. &nbsp;So -1 is the last character of the source string, -2 is the second to last, etc.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">All</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600"><strong><em>source</em> </strong>is the string to be&nbsp;inspected<p></p> <p><strong><em>begin</em> </strong>is the first character for the desired result</p> <p><strong><em>end</em> </strong>is the final character&nbsp;for the desired result. &nbsp;If no end it specified, the new string will be from the begin till the last character.</p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">A portion of the original string. &nbsp;May return the entire original string, or <em>nil</em> if no match</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example 1</strong></span></td> 
   <td width="600">Extract the 2nd through the 4th characters.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, 2, 4)) var = "abcdef"
avi.vs.log(string.sub(var, -99, 2)) path = avi.http.get_path()
path = string.sub(path, 2)
if path == "index.html" ... headers = avi.http.get_header()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- get all the HTTP headers
for key,val in pairs(headers) do&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- iterate through all headers
&nbsp;&nbsp; if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avi.http.close_conn()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- close the TCP connection
&nbsp;&nbsp; end
end</code></pre> 
    <!-- [Format Time: 0.0012 seconds] --> DataScript Log: [string "Test-Rule"]:2: <strong>bcd</strong></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example 2</strong></span></td> 
   <td width="600">Extract characters from the string, starting from the 99th to last till the 2nd to last.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, 2, 4)) var = "abcdef"
avi.vs.log(string.sub(var, -99, 2)) path = avi.http.get_path()
path = string.sub(path, 2)
if path == "index.html" ... headers = avi.http.get_header()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- get all the HTTP headers
for key,val in pairs(headers) do&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- iterate through all headers
&nbsp;&nbsp; if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avi.http.close_conn()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- close the TCP connection
&nbsp;&nbsp; end
end</code></pre> 
    <!-- [Format Time: 0.0015 seconds] --> DataScript Log: [string "Test-Rule"]:2: <strong>abcde</strong></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example 3</strong></span></td> 
   <td width="600">Update a variable with the altered string. &nbsp;A path always starts with a '/', which is removed prior to rule evaluation.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, 2, 4)) var = "abcdef"
avi.vs.log(string.sub(var, -99, 2)) path = avi.http.get_path()
path = string.sub(path, 2)
if path == "index.html" ... headers = avi.http.get_header()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- get all the HTTP headers
for key,val in pairs(headers) do&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- iterate through all headers
&nbsp;&nbsp; if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avi.http.close_conn()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- close the TCP connection
&nbsp;&nbsp; end
end</code></pre> 
    <!-- [Format Time: 0.0025 seconds] --> </td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example 4</strong></span></td> 
   <td width="600">The following example can be used to prevent a Shell Shock attack. This attack embeds a client header which starts with () characters.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, 2, 4)) var = "abcdef"
avi.vs.log(string.sub(var, -99, 2)) path = avi.http.get_path()
path = string.sub(path, 2)
if path == "index.html" ... headers = avi.http.get_header()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- get all the HTTP headers
for key,val in pairs(headers) do&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- iterate through all headers
&nbsp;&nbsp; if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;avi.http.close_conn()&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- close the TCP connection
&nbsp;&nbsp; end
end</code></pre> 
    <!-- [Format Time: 0.0037 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>