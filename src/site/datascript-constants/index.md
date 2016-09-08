---
title: DataScript&#58; Constants
layout: default
---
Constants are static strings that can be used to get or set information from the data path. For instance, a constant could be used to return an HTTP 403 message to a client request that did not have valid credentials. The following constants are available:

### HTTP Method Constants:

<pre crayon="false" class="">HTTP_GET
HTTP_GET
HTTP_POST
HTTP_PUT
HTTP_HEAD
HTTP_DELETE
HTTP_OPTIONS
HTTP_MKCOL
HTTP_COPY
HTTP_MOVE
HTTP_PROPFIND
HTTP_PROPPATCH
HTTP_PATCH
HTTP_LOCK
HTTP_UNLOCK
HTTP_TRACE</pre>

 

### HTTP Status Constants**:**

<pre crayon="false" class="">HTTP_OK                           200 OK
HTTP_CREATED                      201 Created
HTTP_MOVED_PERMANENTLY            301 Moved Permanently
HTTP_MOVED_TEMPORARILY            302 Found
HTTP_NOT_MODIFIED                 304 Not Modified
HTTP_TEMPORARY_REDIRECT           307 Temporary Redirect
HTTP_BAD_REQUEST                  400 Bad Request
HTTP_UNAUTHORIZED                 401 Unauthorized
HTTP_FORBIDDEN                    403 Forbidden
HTTP_NOT_FOUND                    404 Not Found
HTTP_NOT_ALLOWED                  405 Method Not Allowed
HTTP_INTERNAL_SERVER_ERROR        500 Internal Server Error
HTTP_METHOD_NOT_IMPLEMENTED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 501 Not Implemented
HTTP_SERVICE_UNAVAILABLE          503 Service Unavailable
HTTP_GATEWAY_TIMEOUT              504 Gateway Timeout</pre>

 

### Crypto Constants**:**

<pre crayon="false" class="">CIPHER_AES
CIPHER_3DES</pre>

 

### Query Return Types**:**

<pre crayon="false" class="">QUERY_STRING
QUERY_TABLE</pre>

 

### Context Constants**:**

<pre crayon="false" class="">HTTP_REQUEST
HTTP_RESPONSE</pre>

 

### Client Certificate Attribute Constants**:**

<pre crayon="false" class="">CLIENT_CERT
CLIENT_CERT_FINGERPRINT
CLIENT_CERT_SUBJECT
CLIENT_CERT_ISSUER
CLIENT_CERT_SERIAL</pre>

 