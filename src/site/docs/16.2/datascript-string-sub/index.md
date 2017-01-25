---
title: DataScript&#58; string&#46;sub
layout: 16.2
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>          
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>string.sub(source, begin, [end])</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Extracts part of a string from a source string.  Characters are count starting with a 1 for the first character, 2 for the second, etc.  Characters may also be negative.  So -1 is the last character of the source string, -2 is the second to last, etc.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>All</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td><strong><em>source</em> </strong>is the string to be inspected<p></p> <p><strong><em>begin</em> </strong>is the first character for the desired result</p> <p><strong><em>end</em> </strong>is the final character for the desired result.  If no end it specified, the new string will be from the begin till the last character.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>A portion of the original string.  May return the entire original string, or <em>nil</em> if no match</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 1</strong></span></td>
<td>Extract the 2nd through the 4th characters.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, 2, 4))</code></pre> 
<!-- [Format Time: 0.0017 seconds] --> DataScript Log: [string "Test-Rule"]:2: <strong>bcd</strong></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 2</strong></span></td>
<td>Extract characters from the string, starting from the 99th to last till the 2nd to last.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">var = "abcdef"
avi.vs.log(string.sub(var, -99, 2))</code></pre> 
<!-- [Format Time: 0.0017 seconds] --> DataScript Log: [string "Test-Rule"]:2: <strong>abcde</strong></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 3</strong></span></td>
<td>Update a variable with the altered string.  A path always starts with a '/', which is removed prior to rule evaluation.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">path = avi.http.get_path()
path = string.sub(path, 2)
if path == "index.html" ...</code></pre> 
<!-- [Format Time: 0.0017 seconds] --></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 4</strong></span></td>
<td>The following example can be used to prevent a Shell Shock attack. This attack embeds a client header which starts with () characters.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">headers = avi.http.get_header()                -- get all the HTTP headers
for key,val in pairs(headers) do               -- iterate through all headers
   if #val &gt; 2 and string.sub(val, 1, 2) == "()" then
      avi.http.close_conn()                    -- close the TCP connection
   end
end</code></pre> 
<!-- [Format Time: 0.0037 seconds] --></td>
</tr>
</tbody>
</table> 