---
title: DataScript: avi.http.get_path_tokens
layout: default
---
**Function** **avi.http.get_path_tokens( [start [, end]] )** **Description** Retrieve individual path sections, or tokens, from the URI’s path (aka strings separated by the delimiter ‘/’). The command provides the flexibility to get a slice of path tokens (see examples below) when start and/or end indices are provided. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***start***and ***end***indices allow parsing out section of the path. These parameters are expressed as an integer. **Returns** If no start and end indices are specified, returns a Lua table of all the path tokens. If either start index is specified or both start and end indices are specified, returns a string. **Example** Example: *https://www.avinetworks.com**/a/b/c/d/e.htm***

Returns a table which is an array with values ‘a’, ‘b’, ‘c’, ‘d’, ‘e.htm’. All tokens are returned.
avi.http.get_path_tokens()

1 avi . http . get_path_tokens ( )
  Returns ‘a/b/c/d/e.htm’
avi.http.get_path_tokens(1)

1 avi . http . get_path_tokens ( 1 )
  Returns ‘c/d/e.htm’
avi.http.get_path_tokens(3)

1 avi . http . get_path_tokens ( 3 )
  Returns ‘b/c’
avi.http.get_path_tokens(2,3)

1 avi . http . get_path_tokens ( 2 , 3 )
  Returns ‘nil’
avi.http.get_path_tokens(7)

1 avi . http . get_path_tokens ( 7 )