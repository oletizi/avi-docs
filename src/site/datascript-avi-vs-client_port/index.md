---
title: DataScript: avi.vs.client_port
layout: default
---
**Function** **avi.vs.client_port()** **Description** Returns the client's source port. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String containing client’s source port. **Example** Simple way to provide A/B testing by distributing 1/10th of connections to pool1.
if string.endswith(avi.vs.client_port(), "0") then avi.pool.select("Pool1") else avi.pool.select("Pool2") end

1

2
3

4 if  string . endswith ( avi . vs . client_port ( ) ,  "0" )  then

   avi . pool . select ( "Pool1" )
else  avi . pool . select ( "Pool2" )

end