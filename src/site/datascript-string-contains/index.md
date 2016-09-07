---
title: DataScript: string.contains
layout: default
---
**Function** **string.contains(source, target)** **Description** Check if the source string contains the target string. **Events** All **Parameter** ***source***is the string to be checked.
***target***is the string the source is matched against. **Returns** Boolean *true* if the source string begins with the target string, else *false*. **Example** If the path contains "/finance/" prompt client for authentication.
path = avi.http.get_path() if string.contains(path, "/finance/") then avi.http.response(401) end

1

2
3

4 path  =  avi . http . get_path ( )

if  string . contains ( path ,  "/finance/" )  then
   avi . http . response ( 401 )

end