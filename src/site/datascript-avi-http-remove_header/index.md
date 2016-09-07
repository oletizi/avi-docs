---
title: DataScript: avi.http.remove_header
layout: default
---
**Function** **avi.http.remove_header( name )** **Description** Removes all the instances of a specified HTTP header from the current request or response, depending on the event the script is executed within. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***name***is a string specifying the header name. The name is treated as case insensitive. **Returns** No return value **Example** Remove a server response header that can identify which potential server vulnerabilities.
avi.http.remove_header("Server")

1 avi . http . remove_header ( "Server" )