---
title: DataScript: avi.vs.port
layout: default
---
**Function** **avi.vs.port()** **Description** Returns the virtual service port that received the request or connection. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String containing the virtual service port number. **Example** Close the connection if the HTTP request did not arrive on port 443.
if avi.vs.port() ~= "443" then avi.http.close_conn() end

1

2
3 if  avi . vs . port ( )  ~ =  "443"  then

   avi . http . close_conn ( )
end