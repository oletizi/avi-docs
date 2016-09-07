---
title: DataScript: avi.vs.log
layout: default
---
**Function** **avi.vs.log()** **Description** Generate a log associated with the connection or request and viewed within the Virtual Service > Client Log page. A log field is created called datascript_log, containing the DataScript’s name and the output of the avi.vs.log command. If avi.vs.log is called multiple times, the output of each invocation goes in the same datascript_log field in the client log. **Events** HTTP_REQ
HTTP_RESP **Parameter** Logs may contain any arbitrary combination of string, number, Boolean and nil values. **Returns** None **Example**  From DataScript "Log1" HTTP_REQ event:
avi.vs.log("Hello World!")

1 avi . vs . log ( "Hello World!" )
  From DataScript "Log2" HTTP_RESP event:
num = 2 avi.vs.log("Hello " .. num .. " You!")

1

2 num  =  2

avi . vs . log ( "Hello "  . .  num  . .  " You!" )
  Output from the client log:

DataScript Log: [string "Log1"]:1: Hello World! DataScript Log: [string "Log2"]:1: Hello 2 You!