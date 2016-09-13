---
title: DataScript&#58; avi.crypto.decrypt
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"> <font size="3" color="white"><strong>Function</strong></font> </td> 
   <td width="600"><font color="white"><b>avi.crypto.decrypt( ciphertext, key [, iv [, algo]] )</b></font></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Description</strong></font> </td> 
   <td width="600">DataScripts can be used to encrypt and decrypt data. The supported decryption algorithms are AES and 3DES. For AES decryption, AES128, AES192 and AES256 are supported and require key lengths of 128, 192, and 256 bits respectively. 3DES requires key length (3X56) of 168 bits padded out to 192 bits. Whichever decryption method is being used, the correct key length via the key string is mandatory.<p></p> <p>Only CBC (cipher block chaining) mode is supported. Default decryption algorithm used is AES256 with the default IV of “0123456789012345” and default mode of CBC.</p></td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Events</strong></font> </td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Parameter</strong></font> </td> 
   <td width="600"><strong><em>ciphertext</em> </strong>is the encrypted text or string to be decrypted.<br> <strong><em>key</em> </strong>is a string, which is the private key to use for the encryption.<br> <strong><em>iv</em> </strong>is a string and is the initialization vector.<br> <strong><em>algo</em> </strong>is the decryption algorithm. Choose between:<p></p> 
    <ul> 
     <li>avi.CIPHER_AES</li> 
     <li>avi.CIPHER_3DES</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Returns</strong></font> </td> 
   <td width="600">A decrypted string</td> 
  </tr> 
  <tr> 
   <td width="100"> <font size="3"><strong>Example</strong></font> </td> 
   <td width="600">During the HTTP Response event, check for a header then encrypt its value.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_header("User")
   encrypt = avi.crypto.encrypt(avi.http.get_header("User"), key)
   avi.http.replace_header("User", encrypt)
end if avi.http.get_header("User")
   decrypt = avi.crypto.decrypt(avi.http.get_header("User"), key)
   avi.http.replace_header("User", decrypt)
end</code></pre> 
    <!-- [Format Time: 0.0040 seconds] --> During the HTTP Request event, check for a header then decrypt its value.<br> 
    <!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.get_header("User")
   encrypt = avi.crypto.encrypt(avi.http.get_header("User"), key)
   avi.http.replace_header("User", encrypt)
end if avi.http.get_header("User")
   decrypt = avi.crypto.decrypt(avi.http.get_header("User"), key)
   avi.http.replace_header("User", decrypt)
end</code></pre> 
    <!-- [Format Time: 0.0034 seconds] --> </td> 
  </tr> 
 </tbody> 
</table>