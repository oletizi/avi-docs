---
title: DataScript: avi.ssl.protocol
layout: default
---
**Function** **avi.ssl.protocol()** **Description** Returns the protocol of an established SSL connection. For example: “TLSv1.1”. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** Returns a string of the SSL/TLS version or 'unknown' **Example** if avi.ssl.protocol() == "TLSv1.0" then avi.http.response(404, {content_type="text/html"}, "Your browser's SSL version, <b>" .. avi.ssl.protocol() .. "</b> is old. Upgrade your browser and try again.") end

1

2
3

4 if  avi . ssl . protocol ( )  ==  "TLSv1.0"  then

   avi . http . response ( 404 ,  { content_type = "text/html" } ,
   "Your browser's SSL version, <b>"  . .  avi . ssl . protocol ( )  . .  "</b> is old. Upgrade your browser and try again." )

end