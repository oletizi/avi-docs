---
title: DataScript: avi.pool.get_servers
layout: default
---
**Function** **avi.pool.get_servers( pool )** **Description** Check the number of servers with 'up' status and total number of servers configured within a specified pool. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***pool***can be a pool name or an expression that evaluates to a valid pool name. **Returns** Returns the number of up servers and the number of total servers within the pool. **Example** Forward the request to an explicit destination.
servers_up, servers_total = avi.pool.get_servers("web-pool") if servers_up == 0 then avi.http.response(503) end

1

2
3

4 servers_up ,  servers_total  =  avi . pool . get_servers ( "web-pool" )

   if  servers_up  ==  0  then
   avi . http . response ( 503 )

end