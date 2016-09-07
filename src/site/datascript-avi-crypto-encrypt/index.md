---
title: DataScript: avi.crypto.encrypt
layout: default
---
**Function** **avi.crypto.encrypt( plaintext, key [, iv [, algo]] )** **Description** DataScript has the ability to encrypt arbitrary data. This can be useful for encrypting server cookie values or creating custom cross site scripting mitigation by embedding validation tokens. The supported encryption algorithms are AES and 3DES.

For AES encryption, AES128, AES192 and AES256 are supported and require key lengths of 128, 192, and 256 bits respectively. 3DES requires a key length (3X56) of 168 bits padded out to 192 bits. Regardless which encryption algorithm is used, the corresponding correct key length via the key string is mandatory.

Only CBC (cipher block chaining) mode is supported. The default encryption algorithm used is AES256, with the default IV value of “0123456789012345” and default mode of CBC. **Events** HTTP_REQ
HTTP_RESP **Parameter** ***plaintext***is the text or string to be encrypted.
***key***is a string, which is the private key to use for the encryption.
***iv*** is a string and is the initialization vector.
***algo***is the encryption algorithm cipher. Choose between:

* avi.CIPHER_AES
* avi.CIPHER_3DES **Returns** An encrypted string **Example** Send an encrypted token, using AES256 in CBC mode with default IV, in a header in the HTTP response.
path = avi.http.get_path() if path == "/app_1/" then -- use AES256 default encryption key = "01234567890123456789012345678901" value = "The quick brown fox jumps over the lazy dog." encrypted_value = avi.crypto.encrypt(value, key) avi.http.add_header("X-Token", encrypted_value) end

1

2
3

4
5

6
7

8 path  =  avi . http . get_path ( )

if  path  ==  "/app_1/"  then
   -- use AES256 default encryption

   key  =  "01234567890123456789012345678901"
   value  =  "The quick brown fox jumps over the lazy dog."

   encrypted_value  =  avi . crypto . encrypt ( value ,  key )
   avi . http . add_header ( "X-Token" ,  encrypted_value )

end