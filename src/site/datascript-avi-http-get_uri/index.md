---
title: DataScript: avi.http.get_uri
layout: default
---
**Function** **avi.http.get_uri( [false] )** **Description** Returns the full, original client requested URI (including the path and query).

The highlighted portion of the request is included in the URI:
*http://www.avinetworks.com****/path1/path2/index.html?a=b&c=d*** **Events** HTTP_REQ
HTTP_RESP **Parameter** When the optional ***flag***is set to false, the returned URI is unparsed, i.e. is not URI decoded. **Returns** A string value of the URI **Example** Check for layered URI <a href="http://www.owasp.org/index.php/Double_Encoding">double encoding attack</a> embedded in the request
if string.contains(avi.http.get_uri(false), "%") then avi.vs.log("Probable Double Encoding attack, conn closed.") avi.http.close_conn() end

1

2
3

4 if  string . contains ( avi . http . get_uri ( false ) ,  "%" )  then

   avi . vs . log ( "Probable Double Encoding attack, conn closed." )
   avi . http . close_conn ( )

end