---
title: DataScript: avi.http.set_userid
layout: default
---
**Function** **avi.http.set_userid()** **Description** Sets the user ID associated with a connection. Setting this field with this command will overwrite the field if it was populated via HTTP Basic Auth or via a Client Certificate. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** No value returned **Example** If userid does not exist, populated it with the JSessionID cookie value.
if not avi.http.get_userid() then if avi.http.get_cookie("jsessionid") then avi.http.set_userid(avi.http.get_cookie("jsessionid")) else avi.http.set_userid("Unknown") end end

1

2
3

4
5

6 if  not  avi . http . get_userid ( )  then

   if  avi . http . get_cookie ( "jsessionid" )  then
       avi . http . set_userid ( avi . http . get_cookie ( "jsessionid" ) )

   else  avi . http . set_userid ( "Unknown" )
   end

end