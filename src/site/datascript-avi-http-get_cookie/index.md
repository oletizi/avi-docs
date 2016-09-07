---
title: DataScript: avi.http.get_cookie
layout: default
---
**Function** **avi.http.get_cookie( name [, context] )** **Description** Returns the value of a specific cookie from the client request or server response header. **Events** HTTP_REQ
HTTP_RESP **Parameter** Specify the ***name***of the cookie to inspect.
Rather than inspect the cookie from the current event context, specify the context of either ***avi.HTTP_REQUEST*** or ***avi.HTTP_RESPONSE*** to inspect cookies from those events.  For instance, during an HTTP response event, check for a cookie sent by the client during the request event. **Returns** String of the cookie’s value if it exists, else *nil*. **Example** Check the value of cookie named ‘foo’. If the value is not ‘bar’, then do something.
if avi.http.get_cookie("foo") ~= "bar" then -- do something with the cookie header end

1

2
3 if  avi . http . get_cookie ( "foo" )  ~ =  "bar"  then

   -- do something with the cookie header
end