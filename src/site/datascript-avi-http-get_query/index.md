---
title: DataScript: avi.http.get_query
layout: default
---
**Function** **avi.http.get_query( [arg_name | avi.QUERY_TABLE] [, decode] )** **Description** Returns the query from the URI, or an individual query value.

The highlighted portion of the request is included in the query:
*http://www.avinetworks.com/path1/path2/index.html?**a=b&c=d***
From the example a=b, a is the argument, b is the value **Events** HTTP_REQ
HTTP_RESP **Parameter** When no parameter is specified, the full query is returned.
If an ***arg_name*** is specified, and if that argument is present in the query, then its value is returned.
When the flag ***avi.QUERY_TABLE*** is specified, a table is returned with all the arguments.

* Arguments in this table are always URI decoded.
* If an argument occurs multiple times within the query, the corresponding value of the key will be a table holding the values of the key.
* If the argument key has no value, the value returned is a Boolean true.
* If the argument is presented with an empty value (/index.htm?a=&c=d) then the key will have an empty value.

By default, the query is returned as URI encoded. For instance, %2F rather than ‘/’. The ***decode***parameter will URI decode the returned value. **Returns** A string for the returned query, an individual argument and value, or a table holding all arguments and values where the argument names are the keys. **Example 1** if avi.http.get_query("intro", "true") == "hello%20world" then avi.http.add_header("intro", "true") end

1

2
3 if  avi . http . get_query ( "intro" ,  "true" )  ==  "hello%20world"  then

   avi . http . add_header ( "intro" ,  "true" )
end **Example 2** Return all URI query arguments to the client via local response page.
local qa = avi.http.get_query(avi.QUERY_TABLE) local resp = "" for k, v in pairs(qa) do if type(v) == table then resp = resp .. k .. ":" .. table.concat(v, ",") .. ", " else resp = resp .. k .. ":" .. tostring(v) .. ", " -- when v is bool tostring() converts to string end end avi.http.response(200, {}, resp)

1

2
3

4
5

6
7

8
9

10
11 local  qa  =  avi . http . get_query ( avi . QUERY_TABLE )

local  resp  =  ""
for  k ,  v  in  pairs ( qa )  do

   if  type ( v )  ==  table then
       resp  =  resp  . .  k  . .  ":"  . .  table . concat ( v ,  "," )  . .  ", "

   else
       resp  =  resp  . .  k  . .  ":"  . .  tostring ( v )  . .  ", "

       -- when v is bool tostring() converts to string
   end

end
avi . http . response ( 200 ,  { } ,  resp )
  For request: https://demo.avinetworks.com/path1/index.html?a=b&c=&d=e
The following is returned: a:b, d:e, c:,