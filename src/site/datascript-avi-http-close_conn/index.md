---
title: DataScript: avi.http.close_conn
layout: default
---
**Function** **avi.http.close_conn( [reset] )** ### **Description**

 Closes the current TCP connection. ### **Events**

 HTTP_REQ
HTTP_RESP ### **Parameter**

 The ***reset***flag will RST the connection, rather than use the default FIN. ### **Returns**

 No return value ### **Example**

 if avi.vs.client_ip() == "10.1.1.1" then avi.http.close_conn() end

1

2
3 if  avi . vs . client_ip ( )  ==  "10.1.1.1"  then

   avi . http . close_conn ( )
end