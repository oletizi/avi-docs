---
title: DataScript&#58; avi&#46;http&#46;response
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.http.response( status, [headers, [body]] )</b></span></td>
</tr>
<tr>   
<td><h4><span id="Description"><strong>Description</strong></span></h4></td>
<td>Responds to the HTTP request with a custom HTTP response.</td>
</tr>
<tr>   
<td><h4><span id="Events"><strong>Events</strong></span></h4></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><h4><span id="Parameter"><strong>Parameter</strong></span></h4></td>
<td><strong><em>status</em> </strong>is used to specify the HTTP status code. See list for supported status codes below.<p></p> <p>Optional <em><strong>headers</strong> </em>are used to specify a table to add headers in the response. The default content-type used is “text/plain”. Hence if the body is some other mime-type such as “text/html”, the headers parameter should be used to specify the corresponding content-type.</p> <p>Otional <strong><em>body</em> </strong>flag is a string used to specify a custom HTTP response body.</p></td>
</tr>
<tr>   
<td><h4><span id="Supported_Status_Code"><strong>Supported Status Code</strong></span></h4></td>
<td>200 HTTP Ok<br> 301 Moved Permanently<br> 302 Found<br> 303 See Other<br> 307 Temporary Redirect<br> 400 Bad Request<br> 401 Unauthorized<br> 403 Forbidden<br> 404 Not Found<br> 405 Method Not Allowed<br> 413 Request Entity Too Large<br> 414 Request-URI Too Long<br> 429 Too Many Requests<br> 501 Not Implemented<br> 503 Service Unavailable</td>
</tr>
<tr>   
<td><h4><span id="Returns"><strong>Returns</strong></span></h4></td>
<td>No return value</td>
</tr>
<tr>   
<td><h4><span id="Example"><strong>Example</strong></span></h4></td>
<td>Prevent shell shock attack and notify the attacker with a friendly message.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">local h = avi.http.get_headers()
for k, v in pairs(h) do
   if string.sub(v, 1, 2) == "()" and #v &gt; 2 then
      avi.http.response(404, {content_type="text/html"},
      "Blocking Shellshock Attack!")
   end
end</code></pre> 
<!-- [Format Time: 0.0013 seconds] --></td>
</tr>
</tbody>
</table> 