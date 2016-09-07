---
title: DataScript: avi.http.get_cookie_names
layout: default
---
**Function** **avi.http.get_cookie_names ( [context] )** **Description** Returns all the cookies present in the HTTP request or response, determined by the context flag.  When context is not specified, the context is chosen based on the event which executed the DataScript. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***context***is the optional argument specifying either avi.HTTP_REQUEST or avi.HTTP_RESPONSE. **Returns** A table containing the cookie names, and a number to indicate the number of cookies present. **Example** cookies, count = avi.http.get_cookie_names() if count == 0 then -- No cookies found, do something end

1

2
3

4 cookies ,  count  =  avi . http . get_cookie_names ( )

if  count  ==  0  then
   -- No cookies found, do something

end