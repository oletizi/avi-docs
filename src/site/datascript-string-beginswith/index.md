---
title: DataScript: string.beginswith
layout: default
---
**Function** **string.beginswith(source, target)** **Description** Check if the source string begins with the target string. **Events** All **Parameter** ***source***is the string to be checked.

***target***is the string the source is matched against. **Returns** Boolean *true* if the source string begins with the target string, else *false*. **Example** If the path starts with “/sales/” redirect to a new URL
path = avi.http.get_path() if string.beginswith(path, "/sales/") then avi.http.redirect("http://sales.test.com/index.html") end

1

2
3

4 path  =  avi . http . get_path ( )

if  string . beginswith ( path ,  "/sales/" )  then
   avi . http . redirect ( "http://sales.test.com/index.html" )

end