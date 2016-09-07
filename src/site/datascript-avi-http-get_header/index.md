---
title: DataScript: avi.http.get_header
layout: default
---
**Function** **avi.http.get_header( [[name] [context]] )** **Description** Returns a table holding all the headers and their values as a key/value pair in a table. By default, the command will be executed against server response headers for an HTTP_RESP event, and against client request headers when executed within an HTTP_REQ event. **Events** HTTP_REQ
HTTP_RESP **Parameter** By default a table of all headers and their values are returned. When a header ***name***is specified, only the value of the specified header is returned as a string.
The context flag allows inspecting of header values from the ***avi.HTTP_REQUEST*** or ***avi.HTTP_RESPONSE*** events. For instance, during an HTTP_RESP event, the client request headers may be inspected. **Returns** A table of headers and their values, or a string for a specific header value. **Example** The following example can be used to prevent a Shell Shock attack. This attack embeds a client header which starts with () characters.
headers = avi.http.get_header() -- get all the HTTP headers for key,val in pairs(headers) do -- iterate through all headers if /#val > 2 and string.sub(val, 1, 2) == "()" then avi.http.close_conn() -- reset the TCP connection end end

1

2
3

4
5

6 headers  =  avi . http . get_header ( )                  -- get all the HTTP headers

for  key , val in  pairs ( headers )  do                -- iterate through all headers
   if  /# val  >  2  and  string . sub ( val ,  1 ,  2 )  ==  "()"  then

       avi . http . close_conn ( )                      -- reset the TCP connection
   end

end