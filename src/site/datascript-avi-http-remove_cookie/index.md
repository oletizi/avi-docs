---
title: DataScript: avi.http.remove_cookie
layout: default
---
**Function** **avi.http.remove_cookie( name1, [name2, ...] )** **Description** Removes the given cookie(s) from either in the HTTP request or response based on the current context the function was executed from within. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***name*** is a string of the cookie name. **Returns** None **Example** Remove two cookies from the request or response.
avi.http.remove( "jsessionid", "lang" )

1 avi . http . remove (  "jsessionid" ,  "lang"  )