---
title: DataScript : HTTP Cookie Encryption Gateway
layout: default
---
The following DataScript will encrypt the contents of a cookie going to a client, and decrypt the content before returning the cookie to the server.

This DataScript can be altered to encrypt all cookies, set the HTTPonly and Secure flags, and use a more complex key and encryption algorithm.  

### HTTP Response

<pre><code class="language-lua">cookie = "my_cookie"
if avi.http.cookie_exists(cookie) then
   key = "01234567890123456789012345678901"
   value = avi.http.get_cookie(cookie)
   encrypted_value = avi.crypto.encrypt(key, value)
   avi.http.replace_cookie( cookie, encrypted_value )
end cookie = "my_cookie"
if avi.http.cookie_exists(cookie) then
   key = "01234567890123456789012345678901"
   value = avi.http.get_cookie(cookie)
   decrypted_value = avi.crypto.decrypt(key, value)
   avi.http.replace_cookie( cookie, encrypted_value )
end</code></pre>

 

### HTTP Request

<pre><code class="language-lua">cookie = "my_cookie"
if avi.http.cookie_exists(cookie) then
   key = "01234567890123456789012345678901"
   value = avi.http.get_cookie(cookie)
   encrypted_value = avi.crypto.encrypt(key, value)
   avi.http.replace_cookie( cookie, encrypted_value )
end cookie = "my_cookie"
if avi.http.cookie_exists(cookie) then
   key = "01234567890123456789012345678901"
   value = avi.http.get_cookie(cookie)
   decrypted_value = avi.crypto.decrypt(key, value)
   avi.http.replace_cookie( cookie, encrypted_value )
end</code></pre>

 