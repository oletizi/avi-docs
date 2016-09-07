---
title: DataScript: avi.http.scheme
layout: default
---
**Function** **avi.http.scheme()** **Description** Returns the HTTP protocol as a string concatenated with ‘://’. For plain HTTP ‘http://’ is returned and ‘https://’ for secure HTTPS. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** Returns ‘http://’ or ‘https://’ **Example** Redirect clients to test.com on the same protocol the were received on.
if avi.http.hostname() ~= "test.com" then avi.http.redirect(avi.http.scheme() .. "test.com" .. avi.http.get_uri()) end

1

2
3 if  avi . http . hostname ( )  ~ =  "test.com"  then

   avi . http . redirect ( avi . http . scheme ( )  . .  "test.com"  . .  avi . http . get_uri ( ) )
end