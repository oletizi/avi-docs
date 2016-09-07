---
title: DataScript: string.lower
layout: default
---
**Function** **string.lower(source)** **Description** Converts the source string to all lowercase characters.  Avi operators are case sensitive, so "a" does not equal "A". **Events** All **Parameter** ***source***is the string to be converted **Returns** The source string in lowercase **Example** Evaluate a string from the HTTP path as all lower case characters.
if string.lower(avi.http.get_path() == "/sales" then ...

1

2 if  string . lower ( avi . http . get_path ( )  ==  "/sales"  then

   . . .