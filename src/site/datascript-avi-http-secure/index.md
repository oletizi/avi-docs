---
title: DataScript: avi.http.secure
layout: default
---
**Function** **avi.http.secure()** **Description** Returns the string ‘on’ if client to the Virtual Service connection operates in SSL/TLS mode, or an empty string if false. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String, ‘*on*’ if true, ‘*nil*’ if false. **Example** If the HTTP request is not SSL then redirect it to secure HTTPS.
if avi.http.secure() ~= "on" then avi.http.redirect("https://" .. avi.http.hostname() .. avi.http.get_uri()) end

1

2
3

4
5 if  avi . http . secure ( )  ~ =  "on"  then

   avi . http . redirect ( "https://"  . .
   avi . http . hostname ( )  . .

   avi . http . get_uri ( ) )
end