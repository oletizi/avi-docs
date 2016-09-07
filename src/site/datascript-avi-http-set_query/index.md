---
title: DataScript: avi.http.set_query
layout: default
---
**Function** **avi.http.set_query( integer | string | table )** **Description** Sets the request’s URI query.

The highlighted portion of the request is included in the query:
*http://www.avinetworks.com/path1/path2/index.html?**a=b&c=d***
From the example a=b, a is the argument, b is the value **Events** HTTP_REQ **Parameter** The new query may be an ***integer***, a ***string***, or a ***table***. When the input is a string, it should not be prefixed with a ‘?’ character. When the input is a table, the query string is formed by treating the keys as arguments and the values as the value of the corresponding argument. **Returns** No value returned **Example** if avi.http.get_path() == "/sales" then avi.http.set_path("/") avi.http.set_query("sales=true") end

1

2
3

4 if  avi . http . get_path ( )  ==  "/sales"  then

   avi . http . set_path ( "/" )
   avi . http . set_query ( "sales=true" )

end