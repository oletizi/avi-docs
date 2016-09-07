---
title: DataScript: avi.vs.reqvar
layout: default
---
**Function** **avi.vs.reqvar./*** **Description** Sets (write) or gets (read) a variable. These variables have scope across the HTTP_REQ and HTTP_RESP events. Their lifetime is limited to that of the HTTP request/response transaction, so it does not need to be manually unset. Any Lua value can be stored within this variable.

For variable data that is only required during the current event, simply map the variable to the data.
var = 1 if var == 1 then ...

1

2 var  =  1

if  var  ==  1  then  . . .
  For variable data that needs to be saved across connections or mirrored to other Service Engines for the virtual service use <a href="/datascript-avi-vs-table_insert/">avi.vs.table_insert()</a> **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** Boolean *true* upon refresh success and *false* upon refresh failure. **Example** HTTP_REQ event:
avi.vs.reqvar.foo = 10

1 avi . vs . reqvar . foo  =  10
  HTTP_RESP event:
if avi.vs.reqvar.foo == 10 then avi.vs.log("Foo=" .. avi.vs.reqvar.foo) end

1

2
3 if  avi . vs . reqvar . foo  ==  10  then

   avi . vs . log ( "Foo="  . .  avi . vs . reqvar . foo )
end