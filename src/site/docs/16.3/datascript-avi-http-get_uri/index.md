---
title: DataScript&#58; avi&#46;http&#46;get_uri
layout: layout163
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>       
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_uri( [false] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the full, original client requested URI (including the path and query).<p></p> <p>The highlighted portion of the request is included in the URI:<br> <em>http://www.avinetworks.com</em><strong><em>/path1/path2/index.html?a=b&amp;c=d</em></strong></p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>When the optional <strong><em>flag</em> </strong>is set to false, the returned URI is unparsed, i.e. is not URI decoded.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>A string value of the URI</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>Check for layered URI <a href="http://www.owasp.org/index.php/Double_Encoding">double encoding attack</a> embedded in the request<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if string.contains(avi.http.get_uri(false), "%") then
   avi.vs.log("Probable Double Encoding attack, conn closed.")
   avi.http.close_conn()
end</code></pre> 
<!-- [Format Time: 0.0018 seconds] --></td>
</tr>
</tbody>
</table> 