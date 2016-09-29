---
title: DataScript&#58; avi&#46;http&#46;get_path
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_path( [false] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the client request’s parsed URI path, i.e. the part of the URI without the query which starts with the first ‘/’ and up to but excluding the ‘?’.<p></p> <p>The highlighted portion of the request is included in the path:<br> <em>http://www.avinetworks.com<strong>/path1/path2/index.html</strong>?a=b&amp;c=d</em></p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>When the optional flag is set to <strong><em>false</em></strong>, the returned URI path is unparsed, i.e. is not URI decoded.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>A string value of the URI path</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>For an IIS shop, drop bots searching for PHP backdoors<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.endswith(avi.http.get_path(), ".php") then
   avi.http.close_conn(true)
end</code></pre> 
<!-- [Format Time: 0.0017 seconds] --></td>
</tr>
</tbody>
</table> 