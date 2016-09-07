---
title: DataScript: avi.http.redirect
layout: default
---
**Function** **avi.http.redirect( uri [,status] )** **Description** Issues an HTTP redirect to a specified URI with a specified status code. This command is available only in the HTTP_REQ event. If a redirect needs to be performed in HTTP_RESP event, use <a href="/datascript-avi-http-response/">avi.http.response()</a> which can be used to craft a response. **Events** HTTP_REQ **Parameter** ***uri***is a string which will be the new URI to redirect the current request to.

Optional ***status***code is a number for the redirect status code. Use either the status code number or the constant string. Supported status codes are:

*  301 avi.HTTP_MOVED_PERMANENTLY
*  302 avi.HTTP_MOVED_TEMPORARILY
*  307 avi.HTTP_TEMPORARY_REDIRECT

When no status code is provided, the default is 302. **Returns** No return value **Example** Redirect an HTTP request received on service port 80 to port 443.
if avi.vs.port() ~= "443" then avi.http.redirect("https://" .. avi.vs.host() .. avi.http.get_uri()) end

1

2
3 if  avi . vs . port ( )  ~ =  "443"  then

   avi . http . redirect ( "https://"  . .  avi . vs . host ( )  . .  avi . http . get_uri ( ) )
end