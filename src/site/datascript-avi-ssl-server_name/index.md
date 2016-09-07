---
title: DataScript: avi.ssl.server_name
layout: default
---
**Function** **avi.ssl.server_name()** **Description** Returns the domain name requested through SNI (Server Name Indication). This name is pulled from the SSL Hello request, and may be different from the HTTP hostname field. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** A string of the requested SNI name. **Example** Insert a header declaring the SNI name requested by the client.
avi.http.add_header("X-SNI ", avi.ssl.server_name())

1 avi . http . add_header ( "X-SNI " ,  avi . ssl . server_name ( ) )