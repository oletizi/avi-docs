---
title: DataScript: avi.http.response
layout: default
---
**Function** **avi.http.response( status, [headers, [body]] )** ### **Description**

 Responds to the HTTP request with a custom HTTP response. ### **Events**

 HTTP_REQ
HTTP_RESP ### **Parameter**

 ***status***is used to specify the HTTP status code. See list for supported status codes below.

Optional ***headers***are used to specify a table to add headers in the response. The default content-type used is “text/plain”. Hence if the body is some other mime-type such as “text/html”, the headers parameter should be used to specify the corresponding content-type.

Otional ***body***flag is a string used to specify a custom HTTP response body. ### **Supported Status Code**

 200 HTTP Ok
301 Moved Permanently
302 Found
303 See Other
307 Temporary Redirect
400 Bad Request
401 Unauthorized
402 Forbidden
404 Not Found
405 Method Not Allowed
413 Request Entity Too Large
414 Request-URI Too Long
429 Too Many Requests
501 Not Implemented
503 Service Unavailable ### **Returns**

 No return value ### **Example**

 Prevent shell shock attack and notify the attacker with a friendly message.
local h = avi.http.get_headers() for k, v in pairs(h) do if string.sub(v, 1, 2) == "()" and /#v > 2 then avi.http.response(404, {content_type="text/html"}, "Blocking Shellshock Attack!") end end

1

2
3

4
5

6
7 local  h  =  avi . http . get_headers ( )

for  k ,  v  in  pairs ( h )  do
   if  string . sub ( v ,  1 ,  2 )  ==  "()"  and  /# v  >  2  then

       avi . http . response ( 404 ,  { content_type = "text/html" } ,
       "Blocking Shellshock Attack!" )

   end
end