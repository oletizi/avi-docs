---
title: Redirect HTTP to HTTPS
layout: default
---
For security, an industry best practice is to ensure all HTTP traffic is SSL-encrypted as HTTPS. Since typical end-users do not specify the HTTPS protocol when entering URLs for requests, the initial requests arrive over HTTP. Because Avi Vantage can provide SSL termination services, it also must handle redirecting of HTTP users to HTTPS. You can enable HTTP-to-HTTPS redirect in any of the following ways. The methods are presented in order from simplest (with fewest options) to most advanced.

### Application Profile

If the virtual service is configured for both HTTP (usually port 80) and HTTPS (usually SSL on port 443), enable HTTP-to-HTTPS redirect via the attached HTTP application profile. Edit the profile and navigate to the Security tab. In the SSL Everywhere section of this tab, select the *HTTP to HTTPS Redirect* checkbox. Save the profile. Vantage also includes the System-Secure-HTTP profile, which is identical to the System-HTTP profile with the exception that the SSL Everywhere checkbox, which includes HTTP to HTTPS Redirect, is already enabled.

Note: This profile setting will have no impact for virtual services if the VS does not have both HTTP and HTTPS listening ports enabled.

### HTTP Request Policy

For more granularity, use an HTTP Request Policy. Navigate to the Edit Virtual Service > Rules > HTTP Request > New Rule button. The Match section can be left blank, or optionally you can add criteria to determine when to perform the redirect. In the Action section, select Redirect from the pull-down menu. Then set the protocol to HTTPS. This will set the redirect port to 443 and the redirect response code to 302 (temporary redirect).

<a href="img/Policy1.png"><img class="size-full wp-image-42 alignright" src="img/Policy1.png" alt="Policy" width="480" height="68"></a> HTTP Request Policies are quick and easy to set up, and impact only a single virtual service at a time.

### DataScript

For maximum granularity and reusability, use a DataScript to specify the redirect behavior. While using DataScript may be overkill for basic requirements, it's always good to have for thornier requirements. Navigate to Edit Virtual Service > Rules > DataScript > Create DataScript (from within the pull-down menu). Provide a name for the script, then paste the following text into the Request Event Script box and save:

<pre><code class="language-lua">if avi.vs.port() ~= "443" then
   avi.http.redirect("https://" .. avi.http.hostname() .. avi.http.get_uri())
end</code></pre>  

Feel free to experiment with more elaborate logic or see the DataScript documentation for more verbose help and examples.

