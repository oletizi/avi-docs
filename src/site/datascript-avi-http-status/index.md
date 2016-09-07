---
title: DataScript: avi.http.status
layout: default
---
**Function** **avi.http.status()** **Description** Response status code that will be sent to the client. This may be different than the status code sent back from the server as a DataScript could override. See the example for avi.var.server_status. **Events** HTTP_RESP **Parameter** None **Returns** String of the status code, such as 200. **Example** if avi.http.status() == "400" then avi.http.response("404") end

1

2
3 if  avi . http . status ( )  ==  "400"  then

   avi . http . response ( "404" )
end