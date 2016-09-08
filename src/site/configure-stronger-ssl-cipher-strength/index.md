---
title: Configure Stronger SSL Cipher Strength
layout: default
---
SSL ciphers are defined by the *Templates > Security > SSL/TLS Profile*. Within a profile, there are two modes for configuring ciphers, List view and String view.

See also <a href="/2015/12/16/app-transport-security/">Apple's App Transport Security</a>

 

### SSL Rating

Modifying or reordering the list will alter the associated SSL Rating in the top right corner of the SSL / TLS Profile edit window.  This provides insight into the encryption performance, security, and client compatibility of the selected ciphers. This ranking is only made against the validated ciphers from the List View mode.

 

### <img src="img/SSLprofile.png" alt="SSLprofile" width="215" height="161">List View

The default cipher list view shows common ciphers in order of priority. Enable or disable ciphers via the checkbox, and reorder them via the up/down arrows or drag and drop. List view provides a static list of validated ciphers. If alternate ciphers not listed are required, consider using String View. The ciphers included in this list are considered reasonably strong. If a cipher is later deemed to be insecure or less secure, it's security score rating will drop to indicate it has fallen out of favor.

 

### String View

The second cipher configuration mode allows accepted ciphers to be added as a string, similar to the OpenSSL syntax for viewing and setting ciphers. For this mode, Avi accepts all TLS 1.0 - 1.2, and Elliptic Curve ciphers from www.openssl.org/docs/apps/ciphers.html  In this mode, the administrator must determine if the enabled ciphers are secure.  Consider setting strong security by employing a known cipher suite, such as "HIGH".
<pre><code class="language-lua">ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA:ECDHE-ECDSA-AES256</code></pre>