---
title: DataScript: string.len
layout: default
---
**Function** **string.len(source)** **Description** Returns the number of characters of the source string. **Events** All **Parameter** ***source***is the string to be checked **Returns** Numeric value **Example** Log the number of characters from the path of the client's request
avi.vs.log(string.len(avi.http.get_path()))

1 avi . vs . log ( string . len ( avi . http . get_path ( ) ) )