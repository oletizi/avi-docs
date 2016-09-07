---
title: DataScript: avi.http.replace_cookie
layout: default
---
**Function** **avi.http.replace_cookie( table )** **Description** Replaces a cookie from either in the HTTP request or response based on the current context the function was executed from within. Supplied parameters allow for a modifying an existing cookies attributes.

If the specified cookie already exists then the function first removes all the existing instances of the cookie and adds the new cookie with the specified value.

If the cookie does not already exist, the command behaves the same as *avi.http.add_cookie*. **Events** HTTP_REQ
HTTP_RESP **Parameter** A ***table*** of a cookie name-value pairs (for HTTP request context) and optionally other cookie attribute value pairs such as path, domain, etc (for HTTP response). **Request Parameter** HTTP Request event:  The cookie values are replaced in the Cookie header of the HTTP request, and if no such header exists then the Cookie header is added.

*avi.http.replace_cookie( name1, value1 [, name2, value2] )*

***name*** is the name of the cookie to be modified.
***value*** is the new value for the cookie.

In the HTTP request context, all arguments are treated as cookie name value pairs, i.e. the function ignores cookie attributes such as "Domain", "Path", etc. and will treat them as another cookie to be replaced. **Response Parameter** HTTP Response event:  When called in an HTTP response context, the cookie values are replaced in the Set-Cookie header of the HTTP response. If no such header exists the Set-Cookie header is created.

In the HTTP response context, only the first two arguments are treated as cookie name value pairs and the subsequent arguments are interpreted as cookie attributes such as Domain",  "Path", etc. and their corresponding values.

*avi.http.replace_cookie( name, value, path, domain, expires, max-age, httponly, secure )*

***name*** is the name of the cookie to be modified.
***value*** is the new value or data field of the cookie.
***path*** is the value (a string) of the path attribute
***domain*** is the value (a string) of the domain attribute
***expires*** is the value (an integer) of the expires attribute
***max-age*** is the value (an integer) of the max-age attribute
***httponly*** is the value (a boolean) of the httponly attribute
***secure*** is the value (a boolean) of the secure attribute **Returns** None **HTTP Request Example** Example method 1:  Replace the values of two cookies: jsessionid=123 and lang=en

cookie_table = {jsessionid="123", lang="en"} avi.http.replace_cookie( cookie_table )

1

2 cookie_table  =  { jsessionid = "123" ,  lang = "en" }

avi . http . replace_cookie (  cookie _table  )

Example method 2:  Replace two cookies: jsessionid=123 and lang=en

avi.http.replace_cookie( "jsessionid", "123", "lang", "en" )

1 avi . http . replace_cookie (  "jsessionid" ,  "123" ,  "lang" ,  "en"  ) **HTTP Response Example** Example 1:  Replace the cookie jsessionid with value 123 and attributes of path=/ and domain=www.avinetworks.com to produce the following header in the HTTP response:

Set-Cookie: jsessionid=123; path=/; domain=www.avinetworks.com
cookie_table = {jsessionid="123", path="/", domain="www.avinetworks.com"} avi.http.replace_cookie( cookie_table )

1

2 cookie_table  =  { jsessionid = "123" ,  path = "/" ,  domain = "www.avinetworks.com" }

avi . http . replace_cookie (  cookie _table  )
  Example 2:  In this format, the order matters. The third argument must be path, fourth must be domain, fifth must be expires, sixth must be max-age, seventh must be httponly flag and the eighth must be secure flag.
avi.http.replace_cookie( "jsessionid", "123", "/", "www.avinetworks.com" )

1 avi . http . replace_cookie (  "jsessionid" ,  "123" ,  "/" ,  "www.avinetworks.com"  )
  If expires and max-age attributes are not desired, values 0 are passed as argument.
avi.http.replace_cookie( "jsessionid", "123", "/", "a.b.c", 0, 0, true, true})

1 avi . http . replace_cookie (  "jsessionid" ,  "123" ,  "/" ,  "a.b.c" ,  0 ,  0 ,  true ,  true } )