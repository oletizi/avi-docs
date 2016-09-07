---
title: DataScript: avi.http.set_uri
layout: default
---
**Function** **avi.http.set_uri( new_uri )** **Description** Rewrites the current HTTP request’s URI to the ***new_uri*** before the request is sent to a server. This action is generally transparent to the client, as opposed to a redirect, which forces a client to send a new request and incurs a round trip time cost.

The highlighted portion of the request is included in the URI:
*http://www.avinetworks.com**/path1/path2/index.html?a=b&c=d*** **Events** HTTP_REQ **Parameter** The new URI must be specified. **Returns** No return value **Example** Save a redirect RTT by proactively adding the '/' character to a blank URI.
if avi.http.get_uri() == nil then avi.http.set_uri("/") end

1

2
3 if  avi . http . get_uri ( )  ==  nil  then

   avi . http . set_uri ( "/" )
end