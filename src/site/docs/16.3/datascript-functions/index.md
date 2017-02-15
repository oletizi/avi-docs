---
title: DataScript&#58; Functions
layout: layout163
---
DataScripts are comprised of any number of function or method calls which can be used to inspect and act on traffic flowing through a virtual service. DataScript's functions are exposed via Lua libraries and grouped into modules: *string, vs, http, pool, ssl and crypto*. Other Lua libraries may also be used, following the documentation from <a href="http://www.lua.org">www.lua.org</a>. The following functions are available:

<table class="table table-hover table table-bordered table-hover">  
<tbody>                                                                      
<tr>   
<td><span style="color: white; font-size: medium;"><strong>String</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-beginswith/">string.beginswith( source, target )</a></strong></td>
<td>Search for string in beginning of a string</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-contains/">string.contains( source, target )</a></strong></td>
<td>Search contains a string in another string</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-endswith/">string.endswith( source, target )</a></strong></td>
<td>Search for string at the end of a string</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-len/">string.len( source )</a></strong></td>
<td>Returns number of characters in string</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-lower/">string.lower( source )</a></strong></td>
<td>Change a string to lower case</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-sub/">string.sub( source, begin, [end] )</a></strong></td>
<td>Extract a sub-string from a string</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-string-upper/">string.upper( source )</a></strong></td>
<td>Change a string to upper case</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>VS</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-client_ip/">avi.vs.client_ip( )</a></strong></td>
<td>Returns the client IP address</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-client_port/">avi.vs.client_port( )</a></strong></td>
<td>Returns the client source port</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-ip/">avi.vs.ip( )</a></strong></td>
<td>Returns IP address of the VS</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-log/">avi.vs.log( )</a></strong></td>
<td>Write a custom log to VS &gt; client logs</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-name/">avi.vs.name( )</a></strong></td>
<td>Returns the name of the VS</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-port/">avi.vs.port( )</a></strong></td>
<td>Returns the VS port of the connection</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-reqvar/">avi.vs.reqvar.*</a></strong></td>
<td>Set a global variable usable across events</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-table_insert/">avi.vs.table_insert( [table_name,] key, value [, lifetime] )</a></strong></td>
<td>Store custom data in a time based table</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-table_lookup/">avi.vs.table_lookup( [table_name,] key [, lifetime_exten] )</a></strong></td>
<td>Lookup data in a table</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-table_refresh/">avi.vs.table_refresh( [table_name,] key [, lifetime_exten] )</a></strong></td>
<td>Update the expire time for a table entry</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-vs-table_remove/">avi.vs.table_remove( [table_name,] key )</a></strong></td>
<td>Remove data from a table</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>HTTP</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-add_cookie/">avi.http.add_cookie( table )</a></strong></td>
<td>Insert a new cookie</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-add_header/">avi.http.add_header( name, value )</a></strong></td>
<td>Insert a new header and value</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-close_conn/">avi.http.close_conn( [reset] )</a></strong></td>
<td>Close or reset a TCP connection</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-cookie_exists/">avi.http.cookie_exists( name, [context] )</a></strong></td>
<td>Validate if a cookie already exists</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_cookie/">avi.http.get_cookie( name [, context] )</a></strong></td>
<td>Return the values of a cookie</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_cookie_names/">avi.http.get_cookie_names ( [context] )</a></strong></td>
<td>Return the names of cookies</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_header/">avi.http.get_header( [[name] [context]] )</a></strong></td>
<td>Return header names or their values</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http_host_tokens/">avi.http.get_host_tokens( [start [, end]] )</a></strong></td>
<td>Return a subsection of the host</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_path/">avi.http.get_path( [false] )</a></strong></td>
<td>Returns the URI's path /path.index.htm</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_path_tokens/">avi.http.get_path_tokens( [start [, end]] )</a></strong></td>
<td>Return a subsection of the path</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_query/">avi.http.get_query( [arg_name | avi.QUERY_TABLE] [, decode] )</a></strong></td>
<td>Returns the URI's query ?a=1&amp;b=2</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_uri/">avi.http.get_uri( [false] )</a></strong></td>
<td>Returns the URI (path plus query)</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-get_userid/">avi.http.get_userid( )</a></strong></td>
<td>Returns the user ID for the session</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-hostname/">avi.http.hostname( )</a></strong></td>
<td>Return the hostname requested by client</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-method/">avi.http.method( )</a></strong></td>
<td>Return the client's request method</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-protocol/">avi.http.protocol( )</a></strong></td>
<td>Returns the session protocol, http or https</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-redirect/">avi.http.redirect( uri [,status] )</a></strong></td>
<td>Redirect a request</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-remove_cookie/">avi.http.remove_cookie( name1, [name2, ...] )</a></strong></td>
<td>Remove an existing cookie</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-remove_header/">avi.http.remove_header( name )</a></strong></td>
<td>Remove all instances of a header</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-replace_cookie/">avi.http.replace_cookie( table )</a></strong></td>
<td>Replace an existing cookies values</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-replace_header/">avi.http.replace_header( name, value )</a></strong></td>
<td>Replace an existing headers value</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-response/">avi.http.response( status, [headers, [body]] )</a></strong></td>
<td>Send a defined HTTP response page</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-scheme/">avi.http.scheme( )</a></strong></td>
<td>Returns http:// or https://</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-secure/">avi.http.secure( )</a></strong></td>
<td>Returns on for https, nil for http</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-set_path/">avi.http.set_path( new_uri )</a></strong></td>
<td>Modify the path of a request</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-set_query/">avi.http.set_query( integer | string | table )</a></strong></td>
<td>Modify the query of a request</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-set_uri/">avi.http.set_uri( new_uri )</a></strong></td>
<td>Change the URI</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-set_userid/">avi.http.set_userid( )</a></strong></td>
<td>Sets the user ID for the session</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-http-status/">avi.http.status( )</a></strong></td>
<td>Returns status code to be sent to client</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Pool</strong></span></td>
<td></td>
</tr>
<tr>   
<td><a href="{% vpath %}/datascript-avi-pool-get_server_status/"><strong>avi.pool.get_server_status( pool, server, port )</strong></a></td>
<td>Returns the up/down status of the server</td>
</tr>
<tr>   
<td><a href="{% vpath %}/datascript-avi-pool-get_servers/"><strong>avi.pool.get_servers( pool )</strong></a></td>
<td>Returns up and total server count</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-pool-select/">avi.pool.select( pool [, server [, port]] )</a></strong></td>
<td>Pick a specific pool</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-pool-server_ip/">avi.pool.server_ip( )</a></strong></td>
<td>Returns the IP of the selected server</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Groups</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-ipgroup-contains/">avi.ipgroup.contains( ipgroup, ip-address )</a></strong></td>
<td>Compare an IP address against IPs within an IP Group</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-stringgroup-beginswith/">avi.stringgroup.beginswith( stringgroup, string )</a></strong></td>
<td>Compare a string against a list of strings within a String Group</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-stringgroup-contains/">avi.stringgroup.contains( stringgroup, string )</a></strong></td>
<td>Compare a string against a list of strings within a String Group</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-stringgroup-equals/">avi.stringgroup.equals( stringgroup, string )</a></strong></td>
<td>Compare a string against a list of strings within a String Group</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-stringgroup-endswith/">avi.stringgroup.endswith( stringgroup, string )</a></strong></td>
<td>Compare a string against a list of strings within a String Group</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>SSL</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-ssl-cipher/">avi.ssl.cipher( [true] )</a></strong></td>
<td>Return the SSL ciphers and settings</td>
</tr>
<tr>   
<td><a href="{% vpath %}/datascript-avi-ssl-client_cert/"><strong>avi.ssl.client_cert( [ [avi.CLIENT_CERT] [, avi.CLIENT_CERT_FINGERPRINT] [, avi.CLIENT_CERT_SUBJECT] [, avi.CLIENT_CERT_ISSUER] [, avi.CLIENT_CERT_SERIAL]] )</strong></a></td>
<td>Returns the client's certificate, or part of it</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-ssl-protocol/">avi.ssl.protocol( )</a></strong></td>
<td>Return the SSL version</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-ssl-server_name/">avi.ssl.server_name( )</a></strong></td>
<td>Return SNI name field</td>
</tr>
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Crypto</strong></span></td>
<td></td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-crypto-decrypt/">avi.crypto.decrypt( ciphertext, key [, iv [, algo]] )</a></strong></td>
<td>Decrypt content</td>
</tr>
<tr>   
<td><strong><a href="{% vpath %}/datascript-avi-crypto-encrypt/">avi.crypto.encrypt( plaintext, key [, iv [, algo]] )</a></strong></td>
<td>Encrypt content</td>
</tr>
</tbody>
</table> 