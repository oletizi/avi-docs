---
title: DataScript Samples
layout: layout171
---
**Example**

Generate a different redirect URL based on different host names.
Check if the host name begins with “www.avi.”, then get the ccTLD from the host.
Form the beginning part of the new query using the ccTLD map table to get the value of the query argument “mandate”.
Append the old query, if it exists, to the new query.
Generate the HTTP redirect to the new URL using the domain “www.avi.com” and the new query.

<pre>
local ccTLD_map = {es="01345F", fi="5146FF", cn="45DFX", io="123456", ly="ABC123"}
host = avi.http.host()

if not host then
  avi.http.close_conn()
elseif string.sub(host, 1, #"www.avi.") == "www.avi." then
  i,j = string.find(host, "avi")
  ccTLD = string.sub(host, j+2, -1)
  new_query = "?mandate=" .. ccTLD_map[ccTLD]
  old_query = avi.http.get_query()

  if #old_query &gt; 0 then
    new_query = new_query .. "&amp;" .. old_query
  end
    avi.http.redirect("www.avi.com" ..
      avi.http.get_path() ..
      new_query, 302)
end
</pre>  