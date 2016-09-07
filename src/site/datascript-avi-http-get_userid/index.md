---
title: DataScript: avi.http.get_userid
layout: default
---
**Function** **avi.http.get_userid()** **Description** Returns the user ID associated with a connection. The userid may be used by the DataScript in a number of ways, such as evaluating a user against a white or blacklist. This field is also used in the client logs to populate the searchable UserID field. This field is populated via the following methods, prioritized in the following order:

1. **Custom**: The userid may be explicitly set by a DataScript via the <a href="/datascript-avi-set_userid/">avi.http.set_userid()</a> command. For instance, DataScript may parse through a cookie to grab a user name or session ID, then insert that value into the user ID field.
1. **Basic Auth**: If HTTP Basic Auth is enabled on the Virtual Service and a client authenticates, the username field will be used to populate the userid.
1. **Client Certificate**: If client certificate authentication has been enabled, the userid will be populated with the user name field from the client certificate received during the SSL/TLS handshake. **Events** HTTP_REQ
HTTP_RESP **Parameter** None **Returns** String of the user ID, ‘nil’ if empty. **Example** If HTTP header 'username' exists, insert its value into the UserID field, else set the field to none.
if not avi.http.get_userid() then avi.http.redirect("http://login.foo.com") end

1

2
3 if  not  avi . http . get_userid ( )  then

   avi . http . redirect ( "http://login.foo.com" )
end