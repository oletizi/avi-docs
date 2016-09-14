---
title: DataScript&#58; avi.crypto.encrypt
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.crypto.encrypt( plaintext, key [, iv [, algo]] )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">DataScript has the ability to encrypt arbitrary data. This can be useful for encrypting server cookie values or creating custom cross site scripting mitigation by embedding validation tokens. The supported encryption algorithms are AES and 3DES.<p></p> <p>For AES encryption, AES128, AES192 and AES256 are supported and require key lengths of 128, 192, and 256 bits respectively. 3DES requires a key length (3X56) of 168 bits padded out to 192 bits. Regardless which encryption algorithm is used, the corresponding correct key length via the key string is mandatory.</p> <p>Only CBC (cipher block chaining) mode is supported. The default encryption algorithm used is AES256, with the default IV value of “0123456789012345” and default mode of CBC.</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>plaintext</em> </strong>is the text or string to be encrypted.<br> <strong><em>key</em> </strong>is a string, which is the private key to use for the encryption.<br> <strong><em>iv</em></strong> is a string and is the initialization vector.<br> <strong><em>algo</em> </strong>is the encryption algorithm cipher. Choose between:<p></p> 
    <ul> 
     <li>avi.CIPHER_AES</li> 
     <li>avi.CIPHER_3DES</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">An encrypted string</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">Send an encrypted token, using AES256 in CBC mode with default IV, in a header in the HTTP response.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">path = avi.http.get_path()
if path == "/app_1/" then
   -- use AES256 default encryption
   key = "01234567890123456789012345678901"
   value = "The quick brown fox jumps over the lazy dog."
   encrypted_value = avi.crypto.encrypt(value, key)
   avi.http.add_header("X-Token", encrypted_value)
end</code></pre> 
    <!-- [Format Time: 0.0035 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>