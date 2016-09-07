---
title: DataScript: avi.http.set_path
layout: default
---
**Function** **avi.http.set_path( new_uri )** **Description** Rewrites the current HTTP request’s URI path to the ***new_path*** before the request is sent to a server. This action is generally transparent to the client, as opposed to a redirect, which forces a client to send a new request and incurs a round trip time cost.

The highlighted portion of the request is included in the path:
*http://www.avinetworks.com**/path1/path2/index.html**?a=b&c=d* **Events** HTTP_REQ **Parameter** The new URI path must be specified. **Returns** No return value **Example** Save a redirect RTT by appending a '/' to a blank URL prior to sending request to the server.
if avi.http.get_path() == nil then avi.http.set_path("/") end

1

2
3 if  avi . http . get_path ( )  ==  nil  then

   avi . http . set_path ( "/" )
end