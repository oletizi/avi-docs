---
layout: datascript-guide
title: DataScript Functions
---
DataScripts are comprised of any number of function or method calls which can be used to inspect and act on traffic flowing through a virtual service.  DataScript's functions are exposed via Lua libraries and grouped into modules:  *string, vs, http, pool, ssl and crypto*.  Other Lua libraries may also be used, following the documentation from <a href="http://www.lua.org" target="_blank">www.lua.org</a>.  The following functions are available:   
<table>
  <tbody>
    <tr>
      <td width="426">
        <strong>String</strong>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-string-beginswith/" target="_blank">string.beginswith(source, target)</a></strong>
      </td>
      
      <td width="274">
        Search for string in beginning of a string
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-string-endswith/" target="_blank">string.endswith(source, target)</a></strong>
      </td>
      
      <td width="274">
        Search for string at the end of a string
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-string-contains/" target="_blank">string.contains(source, target)</a></strong>
      </td>
      
      <td width="274">
        Search contains a string in another string
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/14/datascript-string-upper/" target="_blank">string.upper(source)</a></strong>
      </td>
      
      <td width="274">
        Change a string to upper case
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/14/datascript-string-lower/" target="_blank">string.lower(source)</a></strong>
      </td>
      
      <td width="274">
        Change a string to lower case
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/14/datascript-string-len/" target="_blank">string.len(source)</a></strong>
      </td>
      
      <td width="274">
        Returns number of characters in string
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/14/datascript-string-sub/" target="_blank">string.sub(source, begin, [end])</a></strong>
      </td>
      
      <td width="274">
        Extract a sub-string from a string
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <b>VS</b>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-ip/" target="_blank">avi.vs.ip()</a></strong>
      </td>
      
      <td width="274">
        Returns IP address of the VS
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-name/" target="_blank">avi.vs.name()</a></strong>
      </td>
      
      <td width="274">
        Returns the name of the VS
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-client_ip/" target="_blank">avi.vs.client_ip()</a></strong>
      </td>
      
      <td width="274">
        Returns the client IP address
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-client_port/" target="_blank">avi.vs.client_port()</a></strong>
      </td>
      
      <td width="274">
        Returns the client source port
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-log/" target="_blank">avi.vs.log()</a></strong>
      </td>
      
      <td width="274">
        Write a custom log to VS > client logs
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-table_insert/" target="_blank">avi.vs.table_insert( [table_name,] key, value [, lifetime] )</a></strong>
      </td>
      
      <td width="274">
        Store custom data in a time based table
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-table_lookup/" target="_blank">avi.vs.table_lookup( [table_name,] key [, lifetime_exten] )</a></strong>
      </td>
      
      <td width="274">
        Lookup data in a table
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-table_remove/" target="_blank">avi.vs.table_remove( [table_name,] key )</a></strong>
      </td>
      
      <td width="274">
        Remove data from a table
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/08/datascript-avi-vs-table_refresh/" target="_blank">avi.vs.table_refresh( [table_name,] key [, lifetime_exten] )</a></strong>
      </td>
      
      <td width="274">
        Update the expire time for a table entry
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-vs-reqvar/" target="_blank">avi.vs.reqvar.*</a></strong>
      </td>
      
      <td width="274">
        Set a global variable usable across events
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong> HTTP</strong>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_uri/" target="_blank">avi.http.get_uri( [false] )</a></strong>
      </td>
      
      <td width="274">
        Returns the URI (path plus query)
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-set_uri/" target="_blank">avi.http.set_uri( new_uri )</a></strong>
      </td>
      
      <td width="274">
        Change the URI
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_path/" target="_blank">avi.http.get_path( [false] )</a></strong>
      </td>
      
      <td width="274">
        Returns the URI's path  /path.index.htm
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-set_path/" target="_blank">avi.http.set_path( new_uri )</a></strong>
      </td>
      
      <td width="274">
        Modify the path of a request
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_query/" target="_blank">avi.http.get_query( [arg_name | avi.QUERY_TABLE] [, decode] )</a></strong>
      </td>
      
      <td width="274">
        Returns the URI's query  ?a=1&b=2
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-set_query/" target="_blank">avi.http.set_query( integer | string | table )</a></strong>
      </td>
      
      <td width="274">
        Modify the query of a request
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-redirect/" target="_blank">avi.http.redirect( uri [,status] )</a></strong>
      </td>
      
      <td width="274">
        Redirect a request
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-response/" target="_blank">avi.http.response( status, [headers, [body]] )</a></strong>
      </td>
      
      <td width="274">
        Send a defined HTTP response page
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-close_conn/" target="_blank">avi.http.close_conn( [reset] )</a></strong>
      </td>
      
      <td width="274">
        Close or reset a TCP connection
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_path_tokens/" target="_blank">avi.http.get_path_tokens( [start [, end]] )</a></strong>
      </td>
      
      <td width="274">
        Return a subsection of the path
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http_host_tokens/" target="_blank">avi.http.get_host_tokens( [start [, end]] )</a></strong>
      </td>
      
      <td width="274">
        Return a subsection of the host
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_header/" target="_blank">avi.http.get_header( [[name] [context]] )</a></strong>
      </td>
      
      <td width="274">
        Return header names or their values
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-add_header/" target="_blank">avi.http.add_header( name, value )</a></strong>
      </td>
      
      <td width="274">
        Insert a new header and value
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-replace_header/" target="_blank">avi.http.replace_header( name, value )</a></strong>
      </td>
      
      <td width="274">
        Replace an existing headers value
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-remove_header/" target="_blank">avi.http.remove_header( name )</a></strong>
      </td>
      
      <td width="274">
        Remove all instances of a header
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_cookie/" target="_blank">avi.http.get_cookie( name [, context] )</a></strong>
      </td>
      
      <td width="274">
        Return the names or values of cookies
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-method/" target="_blank">avi.http.method()</a></strong>
      </td>
      
      <td width="274">
        Return the client's request method
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-hostname/" target="_blank">avi.http.hostname()</a></strong>
      </td>
      
      <td width="274">
        Return the hostname requested by client
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-protocol/" target="_blank">avi.http.protocol()</a></strong>
      </td>
      
      <td width="274">
        Returns the session protocol, http or https
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-scheme/" target="_blank">avi.http.scheme()</a></strong>
      </td>
      
      <td width="274">
        Returns http:// or https://
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-secure/" target="_blank">avi.http.secure()</a></strong>
      </td>
      
      <td width="274">
        Returns on for https, nil for http
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-get_userid/" target="_blank">avi.http.get_userid()</a></strong>
      </td>
      
      <td width="274">
        Returns the user ID for the session
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-set_userid/" target="_blank">avi.http.set_userid()</a></strong>
      </td>
      
      <td width="274">
        Sets the user ID for the session
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-http-status/" target="_blank">avi.http.status()</a></strong>
      </td>
      
      <td width="274">
        Returns status code to be sent to client
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong> Pool</strong>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-pool-get_servers/" target="_blank"><strong>avi.pool.get_servers</strong>( pool )</a>
      </td>
      
      <td width="274">
        Returns up and total server count
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-pool-select/" target="_blank">avi.pool.select( pool [, server [, port]] )</a></strong>
      </td>
      
      <td width="274">
        Pick a specific pool
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-pool-server_ip/" target="_blank">avi.pool.server_ip()</a></strong>
      </td>
      
      <td width="274">
        Pick a specific pool server
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong> SSL</strong>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-ssl-protocol/" target="_blank">avi.ssl.protocol()</a></strong>
      </td>
      
      <td width="274">
        Return the SSL version
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-ssl-server_name/" target="_blank">avi.ssl.server_name()</a></strong>
      </td>
      
      <td width="274">
        Return SNI name field
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-ssl-client_cert/" target="_blank"><strong>avi.ssl.client_cert( [ [avi.CLIENT_CERT] [, avi.CLIENT_CERT_FINGERPRINT] [, avi.CLIENT_CERT_SUBJECT] [, avi.CLIENT_CERT_ISSUER] [, avi.CLIENT_CERT_SERIAL]] )</strong></a>
      </td>
      
      <td width="274">
        Returns the client's certificate, or part of it
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong> Crypto</strong>
      </td>
      
      <td width="274">
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-crypto-encrypt/" target="_blank">avi.crypto.encrypt( key, plaintext [, iv [, algo]] )</a></strong>
      </td>
      
      <td width="274">
        Encrypt content
      </td>
    </tr>
    
    <tr>
      <td width="426">
        <strong><a href="http://kb.avinetworks.com/2015/12/09/datascript-avi-crypto-decrypt/" target="_blank">avi.crypto.decrypt( key, ciphertext [, iv [, algo]] )</a></strong>
      </td>
      
      <td width="274">
        Decrypt content
      </td>
    </tr>
  </tbody>
</table>  