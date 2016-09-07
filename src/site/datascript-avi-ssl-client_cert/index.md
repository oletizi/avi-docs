---
title: DataScript: avi.ssl.client_cert
layout: default
---
**Function** **avi.ssl.client_cert( [[avi.CLIENT_CERT] [, avi.CLIENT_CERT_FINGERPRINT] [, avi.CLIENT_CERT_SUBJECT] [, avi.CLIENT_CERT_ISSUER] [, avi.CLIENT_CERT_SERIAL]] )** **Description** Returns the client certificate in the PEM format for an established SSL connection. Optional parameters will filter the fields returned from the client certificate. **Events** HTTP_REQ
HTTP_RESP **Parameter** When no argument or avi.CLIENT_CERT is specified, returns the client certificate in the PEM format for an established SSL connection from the client to the virtual service, with each line except the first prepended with the tab character.
***avi.CLIENT_CERT_SUBJECT*** returns the subject DN string.
***avi.CLIENT_CERT_ISSUER*** returns the issuer DN string.
***avi.CLIENT_CERT_SERIAL*** returns the serial number.
***avi.CLIENT_CERT_FINGERPRINT*** returns the SHA1 fingerprint (hash) of the cert. **Returns** Up to five arguments, pertaining to the client cert and its fields. **Example 1** If the cert's issuer isn't correct, add the issuer to a header and forward to a quarantine server pool.
if avi.ssl.client_cert("avi.CLIENT_CERT_ISSUER") ~= "/C=US/O=foo/OU=www.foo.com/CN=www.foo.com/email=admin@foo.com" then avi.http.add_header("client_cert_issuer", avi.ssl.client_cert("avi.CLIENT_CERT_ISSUER")) avi.pool.select("Quarantine-Pool") end

1

2
3

4
5

6 if  avi . ssl . client_cert ( "avi.CLIENT_CERT_ISSUER" )  ~ =

   "/C=US/O=foo/OU=www.foo.com/CN=www.foo.com/email=admin@foo.com"  then
   avi . http . add_header ( "client_cert_issuer" ,

       avi . ssl . client_cert ( "avi.CLIENT_CERT_ISSUER" ) )
   avi . pool . select ( "Quarantine-Pool" )

end **Example 2** Logs the client cert attributes for the SSL connection.
if avi.http.secure() then -- test if the connection is secure fingerprint = avi.ssl.client_cert(avi.CLIENT_CERT_FINGERPRINT) avi.vs.log(fingerprint) end

1

2
3

4 if  avi . http . secure ( )  then  -- test if the connection is secure

   fingerprint  =  avi . ssl . client_cert ( avi . CLIENT_CERT_FINGERPRINT )
   avi . vs . log ( fingerprint )

end