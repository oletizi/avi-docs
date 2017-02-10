---
title: DataScript&#58; Events
layout: layout162
---
### About Events

DataScripts execute when various events are triggered by data plane traffic.  A single rule may execute different code during different events.

Many functions are only available within specific events.  For instance, avi.http.redirect may only be used within an HTTP request event, whereas the avi.http.response may be used within the HTTP request or the HTTP response events.

Some functions, such as avi.http.method may be used in either the request or response events, even though the data returned is specifically from the client's HTTP request.

Some functions may contain a context parameter, which means that while the function may be called during any event, it is grabbing data from an explicit event. Executing the avi.http.get_header function during an HTTP response event will return headers from the server's response.  However, adding the context parameter, headers from the client request may be retrieved and evaluated during the response event.

<pre><code class="language-lua">if avi.http.get_header("my_header", avi.HTTP_REQUEST) then
 avi.http.close_conn()
end</code></pre>  

While the DataScript above could be applied to either the HTTP request or response events, it is explicitly inspecting headers from the client's request due to the optional context parameter.

 

### Supported Events

* HTTP_REQ - This event triggers when all the headers of the HTTP request have been parsed successfully, but before any potential POST body has been received. 
* HTTP_RESP - This event triggers when all headers of the HTTP response have been parsed successfully, but before the response body has been received. 