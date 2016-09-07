---
title: DataScript: string.upper
layout: default
---
**Function** **string.upper(source)** **Description** Converts the source string to all uppercase characters.  Avi operators are case sensitive, so "a" does not equal "A".  This command enables case insensitivity. **Events** All **Parameter** ***source***is the string to be converted **Returns** The source string in uppercase **Example** Evaluate the client's path as upper case characters. Client may have sent /Sales, /sales, or /SaLeS.  All would be marked true.
if string.upper(avi.http.get_path() == "/SALES" then ...

1

2 if  string . upper ( avi . http . get_path ( )  ==  "/SALES"  then

   . . .