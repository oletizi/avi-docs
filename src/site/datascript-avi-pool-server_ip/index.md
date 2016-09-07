---
title: DataScript: avi.pool.server_ip
layout: default
---
**Function** **avi.pool.server_ip()** **Description** Returns the IP address of the server for this request or response. Keep in mind that with content switching or multiplexing, a single client connection may have multiple requests, each distributed to a different server. **Events** HTTP_RESP **Parameter** None **Returns** Returns a string of the server's IP address **Example** avi.http.add_header("Server", avi.pool.server_ip())

1 avi . http . add_header ( "Server" ,  avi . pool . server_ip ( ) )