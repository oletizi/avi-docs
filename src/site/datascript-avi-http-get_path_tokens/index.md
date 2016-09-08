---
title: DataScript&#58; avi.http.get_path_tokens
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.get_path_tokens( [start [, end]] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Retrieve individual path sections, or tokens, from the URI’s path (aka strings separated by the delimiter ‘/’). The command provides the flexibility to get a slice of path tokens (see examples below) when start and/or end indices are provided.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600"><strong><em>start</em> </strong>and <strong><em>end</em> </strong>indices allow parsing out section of the path. These parameters are expressed as an integer.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">If no start and end indices are specified, returns a Lua table of all the path tokens. If either start index is specified or both start and end indices are specified, returns a string.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Example: <em>https://www.avinetworks.com<strong>/a/b/c/d/e.htm</strong></em><p></p> <p>Returns a table which is an array with values ‘a’, ‘b’, ‘c’, ‘d’, ‘e.htm’. All tokens are returned.<br> 
     <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">avi.http.get_path_tokens() avi.http.get_path_tokens(1) avi.http.get_path_tokens(3) avi.http.get_path_tokens(2,3) avi.http.get_path_tokens(7)</code></pre> 
    <!-- [Format Time: 0.0007 seconds] --> Returns ‘a/b/c/d/e.htm’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens() avi.http.get_path_tokens(1) avi.http.get_path_tokens(3) avi.http.get_path_tokens(2,3) avi.http.get_path_tokens(7)</code></pre> 
    <!-- [Format Time: 0.0009 seconds] --> Returns ‘c/d/e.htm’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens() avi.http.get_path_tokens(1) avi.http.get_path_tokens(3) avi.http.get_path_tokens(2,3) avi.http.get_path_tokens(7)</code></pre> 
    <!-- [Format Time: 0.0008 seconds] --> Returns ‘b/c’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens() avi.http.get_path_tokens(1) avi.http.get_path_tokens(3) avi.http.get_path_tokens(2,3) avi.http.get_path_tokens(7)</code></pre> 
    <!-- [Format Time: 0.0007 seconds] --> Returns ‘nil’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_path_tokens() avi.http.get_path_tokens(1) avi.http.get_path_tokens(3) avi.http.get_path_tokens(2,3) avi.http.get_path_tokens(7)</code></pre> 
    <!-- [Format Time: 0.0009 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>