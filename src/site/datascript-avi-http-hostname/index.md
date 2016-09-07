---
title: DataScript: avi.http.hostname
layout: default
---
**Function** **avi.http.hostname()** **Description** Returns the host name from the request. This field could be learned from the following sources, in the following order of precedence:

* Host name from the request line
* Host name from the ‘Host’ request header field
* The server name matching a request

NOTE: Host name does not include the port, even in case of a request line or host header of the form hostname:port **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String of the hostname requested by the client.  It does not include the port. **Example** If there is no host name, close the TCP connection.
host = avi.http.hostname() if not host then avi.http.close_conn() end

1

2
3

4 host  =  avi . http . hostname ( )

if  not  host then
   avi . http . close_conn ( )

end