---
title: DataScript: avi.http_host_tokens
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.http.get_host_tokens( [start [, end]] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">Retrieve individual host sections, or tokens, from the hostname (aka strings separated by the delimiter ‘.’) when called without arguments. The command provides the flexibility to get a slice of host tokens (see examples below) when start and/or end indices are provided.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600"><strong><em>start</em> </strong>and/or <em><strong>end</strong> </em>indices, which allow parsing out section of the host header.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">If no start and end indices are specified, returns a table of all the host tokens. If either start index is specified or both start and end indices are specified, returns a string.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">Example host header: <em>http://<strong>www.avinetworks.com</strong>/a/b/index.htm?avi=true</em><p></p> <p>Returns ‘www.avinetworks.com’<br> 
     <!-- Crayon Syntax Highlighter v2.7.1 --> </p><pre><code class="language-lua">avi.http.get_host_tokens(1) avi.http.get_host_tokens(2,2) avi.http.get_host_tokens(6) domain = avi.http.get_host_tokens(2, 3)
if domain ~= "avinetworks.com" then
   avi.http.redirect("new.avinetworks.com")
end</code></pre> 
    <!-- [Format Time: 0.0006 seconds] --> Returns ‘avinetworks’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_host_tokens(1) avi.http.get_host_tokens(2,2) avi.http.get_host_tokens(6) domain = avi.http.get_host_tokens(2, 3)
if domain ~= "avinetworks.com" then
   avi.http.redirect("new.avinetworks.com")
end</code></pre> 
    <!-- [Format Time: 0.0007 seconds] --> Returns ‘nil’<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_host_tokens(1) avi.http.get_host_tokens(2,2) avi.http.get_host_tokens(6) domain = avi.http.get_host_tokens(2, 3)
if domain ~= "avinetworks.com" then
   avi.http.redirect("new.avinetworks.com")
end</code></pre> 
    <!-- [Format Time: 0.0009 seconds] --> Validate the second and third fields of the hostname are ‘avinetworks.com’.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">avi.http.get_host_tokens(1) avi.http.get_host_tokens(2,2) avi.http.get_host_tokens(6) domain = avi.http.get_host_tokens(2, 3)
if domain ~= "avinetworks.com" then
   avi.http.redirect("new.avinetworks.com")
end</code></pre> 
    <!-- [Format Time: 0.0017 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>