---
title: DataScript: avi.http.protocol
layout: default
---
**Function** **avi.http.protocol()** **Description** Returns the HTTP protocol of the connection as a string, ‘http’ for plain HTTP or ‘https’ for HTTPS. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** Returns ‘http’ or ‘https’ **Example** If the HTTP request is not SSL then redirect it to secure HTTPS.
if avi.http.protocol() ~= "https" then avi.http.redirect("https://" .. avi.http.hostname() .. avi.http.get_uri()) end

1

2
3

4
5 if  avi . http . protocol ( )  ~ =  "https"  then

   avi . http . redirect ( "https://"  . .
   avi . http . hostname ( )  . .

   avi . http . get_uri ( ) )
end