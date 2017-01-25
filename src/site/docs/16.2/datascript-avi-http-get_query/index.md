---
title: DataScript&#58; avi&#46;http&#46;get_query
layout: layout162
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.get_query( [arg_name | avi.QUERY_TABLE] [, decode] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Returns the query from the URI, or an individual query value.<p></p> <p>The highlighted portion of the request is included in the query:<br> <em>http://www.avinetworks.com/path1/path2/index.html?<strong>a=b&amp;c=d</strong></em><br> From the example a=b, a is the argument, b is the value</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>When no parameter is specified, the full query is returned.<br> If an <em><strong>arg_name</strong></em> is specified, and if that argument is present in the query, then its value is returned.<br> When the flag <strong><em>avi.QUERY_TABLE</em></strong> is specified, a table is returned with all the arguments.<p></p> 
<ul> 
 <li>Arguments in this table are always URI decoded.</li> 
 <li>If an argument occurs multiple times within the query, the corresponding value of the key will be a table holding the values of the key.</li> 
 <li>If the argument key has no value, the value returned is a Boolean true.</li> 
 <li>If the argument is presented with an empty value (/index.htm?a=&amp;c=d) then the key will have an empty value.</li> 
</ul> <p>By default, the query is returned as URI encoded. For instance, %2F rather than ‘/’. The <strong><em>decode</em> </strong>parameter will URI decode the returned value.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>A string for the returned query, an individual argument and value, or a table holding all arguments and values where the argument names are the keys.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 1</strong></span></td>
<td><!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_query("intro", "true") == "hello%20world" then
   avi.http.add_header("intro", "true")
end</code></pre> 
<!-- [Format Time: 0.0015 seconds] --></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example 2</strong></span></td>
<td>Return all URI query arguments to the client via local response page.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">local qa = avi.http.get_query(avi.QUERY_TABLE)
local resp = ""
for k, v in pairs(qa) do
   if type(v) == table then
      resp = resp .. k .. ":" .. table.concat(v, ",") .. ", "
   else
      resp = resp .. k .. ":" .. tostring(v) .. ", "
      -- when v is bool tostring() converts to string
   end
end
avi.http.response(200, {}, resp)</code></pre> 
<!-- [Format Time: 0.0055 seconds] --> For request: https://demo.avinetworks.com/path1/index.html?a=b&amp;c=&amp;d=e<br> The following is returned: a:b, d:e, c:,</td>
</tr>
</tbody>
</table> 