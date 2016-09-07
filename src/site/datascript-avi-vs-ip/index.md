---
title: DataScript: avi.vs.ip
layout: default
---
**Function** **avi.vs.ip()** **Description** Returns the virtual service IP address which accepted the request or connection. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** Dotted decimal IP address string. **Example** Insert a header informing the server which VS traffic originated from.
avi.http.add_header("VS_IP", avi.vs.ip())

1 avi . http . add_header ( "VS_IP" ,  avi . vs . ip ( ) )