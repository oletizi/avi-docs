---
title: DataScript: avi.http.method
layout: default
---
**Function** **avi.http.method()** **Description** Returns the client’s request method, such as ‘GET’ or ‘POST’. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String of the method **Example** method = avi.http.method() if method ~= "GET" or method ~= "POST" then avi.http.response("403") end

1

2
3

4 method  =  avi . http . method ( )

if  method  ~ =  "GET"  or  method  ~ =  "POST"  then
   avi . http . response ( "403" )

end