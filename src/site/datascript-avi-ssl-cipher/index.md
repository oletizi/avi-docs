---
title: DataScript: avi.ssl.cipher
layout: default
---
**Function** **avi.ssl.cipher( [true] )** **Description** Returns the name of the ciphersuite negotiated for the SSL/TLS connection between the client and the virtual service, and may optionally include the version, key exchange method (Kx), authentication method (Au), encryption method (Enc), and MAC selected (Mac). The returned ciphersuite information is in OpenSSL format. See *www.openssl.org/docs/manmaster/apps/ciphers.html* for examples of OpenSSL formatted ciphersuites. **Events** HTTP_REQ HTTP_RESP **Parameter** Optional boolean *true*. When this parameter is not specified, only the ciphersuite name is returned. When the *true* flag is set, this function returns ciphersuite, version, authentication method, encryption method, and MAC selected. These values are presented as a space separated string. **Returns** A string value containing the cipher information for the SSL/TLS connection. When the *true* flag is set, values are returned as a space separated string. **Example 1** Gracefully deny clients connecting with unsupported ciphers.
cipher_name = avi.ssl.cipher() if cipher_name == "RC4-SHA" then avi.http.response(200, {content_type="text/html"}, "Upgrade your client to use modern and secure ciphers." ) end

1

2
3

4
5

6 cipher_name  =  avi . ssl . cipher ( )

if  cipher_name  ==  "RC4-SHA"  then
   avi . http . response ( 200 ,  { content_type = "text/html" } ,

       "Upgrade your client to use modern and secure ciphers."
   )

end **Example 2** Insert a header to the server indicating the key exchange method negotiated with the client.
cipher = avi.ssl.cipher(true) ­­-- get the key exchange method from the cipher detail using pattern matching ­­-- %w matches alphanumeric characters kx = string.match(cipher, "Kx=(%w+)") if kx then avi.http.add_header("X-­KeyExchange", kx) end

1

2
3

4
5

6
7

8 cipher  =  avi . ssl . cipher ( true )

  ­­ -- get the key exchange method from the cipher detail using pattern matching
  ­­ -- %w matches alphanumeric characters

kx  =  string . match ( cipher ,  "Kx=(%w+)" )
 

if  kx then
   avi . http . add_header ( "X-­KeyExchange" ,  kx )

end