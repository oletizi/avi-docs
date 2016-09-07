---
title: DataScript: avi.pool.get_server_status
layout: default
---
**Function** **avi.pool.get_server_status(pool, server, port)** **Description** Determine the status of the server listening at a specified port. **Events** HTTP_REQ
HTTP_RESP **Parameter** All three parameter fields are required.

***pool* **can be a specific pool name or an expression that evaluates to a valid pool name.

The ***server* **flag is the IP address or host name of the server, in quotes.

The ***port* **flag forwards the connection to a specific service port of the server. The port must be a number between 0 and 65536, or an expression that evaluates to a valid port number.. **Returns** Return value of 0 indicates the server is down. Return value of 1 indicates the server is up. **Example** If a server is down, redirect traffic elsewhere.
if avi.pool.get_server_status("web-pool", "10.1.1.1", "80") == 0 then avi.http.redirect("backupsite.com" .. avi.http.get_uri()) end

1

2
3 if  avi . pool . get_server_status ( "web-pool" ,  "10.1.1.1" ,  "80" )  ==  0  then

   avi . http . redirect ( "backupsite.com"  . .  avi . http . get_uri ( ) )
end