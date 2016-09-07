---
title: DataScript: string.endswith
layout: default
---
**Function** **string.endswith(source, target)** **Description** Check if the source string ends with the target string. **Events** All **Parameter** ***source***is the string to be checked.
***target***is the string the source is matched against. **Returns** Boolean *true* if the source string begins with the target string, else *false*. **Example** If the path ends with "/secure/" forbid access.
path = avi.http.get_path() if string.endswith(path, "/secure/") then avi.http.response(403) end

1

2
3

4 path  =  avi . http . get_path ( )

if  string . endswith ( path ,  "/secure/" )  then
   avi . http . response ( 403 )

end