---
title: DataScript: avi.http.replace_header
layout: default
---
**Function** **avi.http.replace_header( name, value )** **Description** Set an existing HTTP header to a specified value, overriding all existing headers of the same name. The header name is treated case insensitively for matching with existing headers. **Events** HTTP_REQ **Parameter** ***name***is a string specifying the header name.
***value***is a string specifying the new header value. **Returns** No return value **Example** Modify the header named “X-Forwarded-For” in the HTTP request to append the virtual service IP.
xff = avi.http.get_header("x_forwarded_for") if xff then avi.http.replace_header("X-Forwarded-For", xff ..", ".. avi.vs_ip()) end

1

2
3

4 xff  =  avi . http . get_header ( "x_forwarded_for" )

if  xff then
   avi . http . replace_header ( "X-Forwarded-For" ,  xff  . . ", " . .  avi . vs_ip ( ) )

end