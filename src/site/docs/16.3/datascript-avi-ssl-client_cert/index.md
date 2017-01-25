---
title: DataScript&#58; avi&#46;ssl&#46;client_cert
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><font size="3" color="white"><strong>Function</strong></font></td>
<td><font color="white"><b>avi.ssl.client_cert( [[avi.CLIENT_CERT] [, avi.CLIENT_CERT_FINGERPRINT] [, avi.CLIENT_CERT_SUBJECT] [, avi.CLIENT_CERT_ISSUER] [, avi.CLIENT_CERT_SERIAL]] )</b></font></td>
</tr>
<tr>   
<td><font size="3"><strong>Description</strong></font></td>
<td>Returns the client certificate in the PEM format for an established SSL connection. Optional parameters will filter the fields returned from the client certificate.</td>
</tr>
<tr>   
<td><font size="3"><strong>Events</strong></font></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><font size="3"><strong>Parameter</strong></font></td>
<td>When no argument or avi.CLIENT_CERT is specified, returns the client certificate in the PEM format for an established SSL connection from the client to the virtual service, with each line except the first prepended with the tab character.<br> <strong><em>avi.CLIENT_CERT_SUBJECT</em></strong> returns the subject DN string.<br> <strong><em>avi.CLIENT_CERT_ISSUER</em></strong> returns the issuer DN string.<br> <em><strong>avi.CLIENT_CERT_SERIAL</strong></em> returns the serial number.<br> <em><strong>avi.CLIENT_CERT_FINGERPRINT</strong></em> returns the SHA1 fingerprint (hash) of the cert.</td>
</tr>
<tr>   
<td><font size="3"><strong>Returns</strong></font></td>
<td>Up to five arguments, pertaining to the client cert and its fields.</td>
</tr>
<tr>   
<td><font size="3"><strong>Example 1</strong></font></td>
<td>If the cert's issuer isn't correct, add the issuer to a header and forward to a quarantine server pool.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.ssl.client_cert("avi.CLIENT_CERT_ISSUER") ~=
   "/C=US/O=foo/OU=www.foo.com/CN=www.foo.com/email=admin@foo.com" then
   avi.http.add_header("client_cert_issuer", 
      avi.ssl.client_cert("avi.CLIENT_CERT_ISSUER"))
   avi.pool.select("Quarantine-Pool")
end</code></pre> 
<!-- [Format Time: 0.0031 seconds] --></td>
</tr>
<tr>   
<td><font size="3"><strong>Example 2</strong></font></td>
<td>Logs the client cert attributes for the SSL connection.<br> 
<!-- Crayon Syntax Highlighter v2.7.1 --> <pre><code class="language-lua">if avi.http.secure() then -- test if the connection is secure
   fingerprint = avi.ssl.client_cert(avi.CLIENT_CERT_FINGERPRINT)
   avi.vs.log(fingerprint)
end</code></pre> 
<!-- [Format Time: 0.0024 seconds] --></td>
</tr>
</tbody>
</table> 