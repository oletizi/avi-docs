---
title: DataScript: avi.vs.client_ip
layout: default
---
**Function** **avi.vs.client_ip()** **Description** Returns the client's IP address. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String containing the client’s source IP address. **Example** Insert the source IP address of a client into an HTTP header.
avi.http.add_header("XFF", avi.vs.client_ip())

1 avi . http . add_header ( "XFF" ,  avi . vs . client_ip ( ) )