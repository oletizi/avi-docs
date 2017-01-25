---
title: DataScript&#58; avi&#46;ssl&#46;cipher
layout: layout162
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.ssl.cipher( [true] )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the name of the ciphersuite negotiated for the SSL/TLS connection between the client and the virtual service, and may optionally include the version, key exchange method (Kx), authentication method (Au), encryption method (Enc), and MAC selected (Mac). The returned ciphersuite information is in OpenSSL format. See <em>www.openssl.org/docs/manmaster/apps/ciphers.html</em> for examples of OpenSSL formatted ciphersuites.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>Optional boolean <em>true</em>. When this parameter is not specified, only the ciphersuite name is returned. When the <em>true</em> flag is set, this function returns ciphersuite, version, authentication method, encryption method, and MAC selected. These values are presented as a space separated string.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>A string value containing the cipher information for the SSL/TLS connection. When the <em>true</em> flag is set, values are returned as a space separated string.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example 1</strong></font></td>
<td>Gracefully deny clients connecting with unsupported ciphers.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cipher_name = avi.ssl.cipher() 
if cipher_name == "RC4-SHA" then
   avi.http.response(200, {content_type="text/html"}, 
      "Upgrade your client to use modern and secure ciphers."
   )
end</code></pre> 
<!-- [Format Time: 0.0020 seconds] --></td>
</tr>
<tr>   
<td><font size="3"><strong>Example 2</strong></font></td>
<td>Insert a header to the server indicating the key exchange method negotiated with the client.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">cipher = avi.ssl.cipher(true)
   ­­-- get the key exchange method from the cipher detail using pattern matching
   ­­-- %w matches alphanumeric characters
kx = string.match(cipher, "Kx=(%w+)")

if kx then
   avi.http.add_header("X-­KeyExchange", kx)
end</code></pre> 
<!-- [Format Time: 0.0023 seconds] --></td>
</tr>
</tbody>
</table> 