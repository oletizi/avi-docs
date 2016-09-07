---
title: DataScript: avi.http.get_path
layout: default
---
**Function** **avi.http.get_path( [false] )** **Description** Returns the client request’s parsed URI path, i.e. the part of the URI without the query which starts with the first ‘/’ and up to but excluding the ‘?’.

The highlighted portion of the request is included in the path:
*http://www.avinetworks.com**/path1/path2/index.html**?a=b&c=d* **Events** HTTP_REQ
HTTP_RESP **Parameter** When the optional flag is set to ***false***, the returned URI path is unparsed, i.e. is not URI decoded. **Returns** A string value of the URI path **Example** For an IIS shop, drop bots searching for PHP backdoors
if string.endswith(avi.http.get_path(), ".php") then avi.http.close_conn(true) end

1

2
3 if  string . endswith ( avi . http . get_path ( ) ,  ".php" )  then

   avi . http . close_conn ( true )
end