---
title: DataScript: avi.http.cookie_exists
layout: default
---
**Function** **avi.http.cookie_exists( name, [context] )** **Description** Returns true if the cookie name exists in the HTTP request or response. The context determines the req/resp, when no context is specified the defualt context is based on the event the DataScript was executed from. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***name***is a string specifying the cookie name.

***context***is the optional argument specifying either avi.HTTP_REQUEST or avi.HTTP_RESPONSE. **Returns** Boolean *true* if the cookie name exists else *false*. **Example** If the ServerIP cookie exists, send the request to the server IP address defined within the cookie.
if avi.http.cookie_exists("ServerIP") then avi.pool.select("Pool1", avi.http.get_cookie("ServerIP")) end

1

2
3 if  avi . http . cookie_exists ( "ServerIP" )  then

   avi . pool . select ( "Pool1" ,  avi . http . get_cookie ( "ServerIP" ) )
end