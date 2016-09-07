---
title: DataScript: avi.http_host_tokens
layout: default
---
**Function** **avi.http.get_host_tokens( [start [, end]] )** **Description** Retrieve individual host sections, or tokens, from the hostname (aka strings separated by the delimiter ‘.’) when called without arguments. The command provides the flexibility to get a slice of host tokens (see examples below) when start and/or end indices are provided. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***start***and/or ***end***indices, which allow parsing out section of the host header. **Returns** If no start and end indices are specified, returns a table of all the host tokens. If either start index is specified or both start and end indices are specified, returns a string. **Example** Example host header: *http://**www.avinetworks.com**/a/b/index.htm?avi=true*

Returns ‘www.avinetworks.com’
avi.http.get_host_tokens(1)

1 avi . http . get_host_tokens ( 1 )
  Returns ‘avinetworks’
avi.http.get_host_tokens(2,2)

1 avi . http . get_host_tokens ( 2 , 2 )
  Returns ‘nil’
avi.http.get_host_tokens(6)

1 avi . http . get_host_tokens ( 6 )
  Validate the second and third fields of the hostname are ‘avinetworks.com’.
domain = avi.http.get_host_tokens(2, 3) if domain ~= "avinetworks.com" then avi.http.redirect("new.avinetworks.com") end

1

2
3

4 domain  =  avi . http . get_host_tokens ( 2 ,  3 )

if  domain  ~ =  "avinetworks.com"  then
   avi . http . redirect ( "new.avinetworks.com" )

end