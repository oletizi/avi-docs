---
title: DataScript: avi.pool.select
layout: default
---
**Function** **avi.pool.select( pool [, server [, port]] )** **Description** Selects a pool or a specific server within a pool for the current request. The selection does not take effect if an HTTP Request Policy was also configured with a switching action to select a pool or a specific server in a pool. The switching action of the HTTP Request Policy takes <a href="/docs/datascript-guide/datascript-precedence/">precedence</a> over the DataScript's pool selection. **Events** HTTP_REQ **Parameter** ***pool***can be a specific pool name or an expression that evaluates to a valid pool name.

The optional ***server***flag is the IP address or host name of the server, in quotes.

The optional ***port***flag forwards the connection to a specific service port of the server. The port must be a number between 0 and 65536, or an expression that evaluates to a valid port number. **Caveats** The pool name, server name or IP, and the server port may be called explicitly, or dynamically determined based on a Lua expression. If the pool name, server, or server port do not exist or are not able to be referenced by the virtual service, an error is generated.

* *Explicit* reference: A configuration error will be generated while saving the DataScript.
* *Dynamically* generated reference: A runtime error is generated, which results in a 500 error return to the client. **Returns** No value returned **Example 1** Forward the request to an explicit destination.
if avi.http.get_path() == "/sales/" then avi.pool.select("sales-pool") elseif avi.http.get_path () == "/engineering/" then avi.pool.select("engineering-pool", "apache1") elseif avi.http.get_path () == "/marketing/" then avi.pool.select("marketing", "10.10.31.201") end

1

2
3

4
5

6
7 if  avi . http . get_path ( )  ==  "/sales/"  then

   avi . pool . select ( "sales-pool" )
elseif  avi . http . get_path  ( )  ==  "/engineering/"  then

   avi . pool . select ( "engineering-pool" ,  "apache1" )
elseif  avi . http . get_path  ( )  ==  "/marketing/"  then

   avi . pool . select ( "marketing" ,  "10.10.31.201" )
end **Example 2** Forward the request to a dynamically generated destination.
*www.avi.com/**support**/index.htm* would go to the support pool
*www.avi.com/**sales**/apac/index.htm* would go to the sales pool
avi.pool.select(avi.http.get_path_tokens(1, 1))

1 avi . pool . select ( avi . http . get_path_tokens ( 1 ,  1 ) )