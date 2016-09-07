---
title: DataScript: avi.vs.name
layout: default
---
**Function** **avi.vs.name()** **Description** Returns the name of the virtual service which accepted the request or connection. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String containing the virtual service name. **Example** Insert a header in traffic sent to the server:
X-Source: www.avi.com-10.1.1.1
avi.http.add_header("X-Source", avi.vs.name() .. "-" .. avi.vs.ip())

1 avi . http . add_header ( "X-Source" ,  avi . vs . name ( )  . .  "-"  . .  avi . vs . ip ( ) )