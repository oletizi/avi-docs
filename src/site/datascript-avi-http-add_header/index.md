---
title: DataScript: avi.http.add_header
layout: default
---
**Function** **avi.http.add_header( name, value )** **Description** Adds a header with a specified name and value into the client HTTP request headers or the server HTTP response headers. If a header already exists with the same name, a new header with the same name will be appended to the end of the list of existing headers. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***name***is a string specifying the new header’s name.
***value***is a string specifying the new header’s value. **Returns** No return value **Example** Add header named “X-Foo” with value “Bar” in the HTTP request if the user agent contains “Mozilla".
ua = avi.http.get_header("user-agent") i,j = string.find(ua, "Mozilla") if i then avi.http.add_header("X-Foo", "Bar") end

1

2
3

4
5 ua  =  avi . http . get_header ( "user-agent" )

i , j  =  string . find ( ua ,  "Mozilla" )
if  i  then

   avi . http . add_header ( "X-Foo" ,  "Bar" )
end