---
title: HTTP Cookie Persistence
layout: 16.2
---
The HTTP cookie mode of persistence enables sticking a client to a server for the duration of their session. HTTP cookie persistence may be applied to any virtual service with an attached HTTP application profile. With this persistence method, Vantage Service Engines (SEs) will insert an HTTP cookie into a server's first response to a client. 

To use HTTP cookie persistence, no configuration changes are required on the back-end servers. HTTP persistence cookies created by Vantage have no impact on existing server cookies or behavior.

Note: Vantage also has an <a href="/docs/16.2/app-cookie-persistence">"app cookie" persistence mode</a>, which relies on cookies as well. The app cookie method performs persistence based on information in existing server cookies, rather than inserting a Vantage-created cookie.

See <a href="/docs/16.2/overview-of-server-persistence">Overview of Server Persistence</a> for descriptions of other persistence methods and options.

### Cookie Format

The following is an example of an HTTP session-persistence cookie created by Vantage.

<pre>Set-Cookie: AVI_COOKIE=026cc2fffb-b95b-41-dxgObfTEe_IrnYmysot-VOVY1_EEW55HqmENnvC; path=/</pre> 

The cookie payload contains the back-end server IP address and port. 

In versions 16.1 and prior, the cookie payload is obfuscated with a hash. 

In 16.2 and later, the payload is encrypted with AES-256. When a client makes a subsequent HTTP request, they include the cookie, which the SE uses to ensure the client's request is directed to the same server. 

### Cookie Persistence Timeout

Beginning in Avi Vantage 16.2, persistence profiles allow configuration of a persistence timeout. The persistence timeout sets the maximum amount of time a persistence cookie is valid.

The persistence timeout applies to persistence cookies that are created by Vantage for individual client sessions with virtual services that use the persistence profile.

Generally, the client or browser has responsibility to clear a persistent session cookie after the session the cookie was for is terminated, or when the browser is closed. Setting a persistence timeout takes care of cases where the client or browser does not clear the session cookies.

The persistence timeout within a persistence profile can be set to 10-720 minutes. If the timeout is set, the maximum lifetime of any session cookie that is created based on the profile is set to the timeout. In this case, the cookie is valid for a maximum of the configured timeout, beginning when Vantage creates the cookie.

For example, if the persistence timeout is set to 720 minutes, a cookie created based on the profile is valid for a maximum of 12 hours, beginning as soon as the cookie is created. After the persistence timeout expires, the cookie expires and is no longer valid.

By default there is no timeout and the cookie sent is a session cookie, which is cleared by the client after the session ends.

### Persistence Mirroring

Since clients maintain the cookie and present it when visiting the site, Vantage does not need to store the persistence information or mirror the persistence mappings to other SEs, allowing for greater scale with minimal effort.

### Persistence Duration

HTTP cookie persistence leverages a session-based cookie, which is valid as long as the client maintains an HTTP session with Vantage. If the client closes a browser, the cookie is deleted and the persistence is finished.

### Configuration Options

* **Name**: Unique name for the persistence profile.
* **Description**: Optional, custom description for the profile.
* **Type**: HTTP Cookie. Changing the type will change the profile to another persistence method.
* **Select New Server When Persistent Server Down: **If a server is marked down, such as by a health monitor or when it has reached a connection limit, should existing persisted users continue to be sent to the server, or load balanced to a new server?  
    * **Immediate:** Vantage will immediately select a new server to replace the one marked down and switch the persistence entry to the new server.
    * **Never:** No replacement server will be selected. Persistent entries will be required to expire normally based upon the persistence type.
* **HTTP Cookie Name**: By default, the cookie is named AVI_COOKIE. By populating this optional field, the cookie will be inserted with the custom name 

## Enabling HTTP Session-based Cookies

<ol> 
 <li>Configure a persistence profile. Within the profile, make sure to select HTTP Cookie as the persistence type.<br> <a href="img/cookie-persist-encryptedcookie-1.png"><img src="img/cookie-persist-encryptedcookie-1.png" alt="cookie-persist-encryptedcookie" width="783" height="442" class="alignnone size-full wp-image-9118"></a><p></p> </li> 
 <li>Create a pool. Add at least 2 servers to the pool, select round robin as the load-balancing algorithm, and attach the persistence profile to the pool.<br> <a href="img/cookie-persist-encryptedcookie2a.png"><img class="alignnone size-full wp-image-7460" src="img/cookie-persist-encryptedcookie2a.png" alt="cookie-persist-encryptedcookie2a" width="971" height="577"></a><p></p> </li> 
 <li>Create a virtual service and attach the pool to the virtual service. On the Analytics page of the virtual service, enable collection for non-significant logs. Then create a client log filter that matches on client IP address, and select Log all headers option. This enables logging for 2<em>xx</em> requests, so that the request and response headers can be viewed in the log.<br> <a href="img/cookie-persist-encryptedcookie2.png"><img class="alignnone size-full wp-image-7461" src="img/cookie-persist-encryptedcookie2.png" alt="cookie-persist-encryptedcookie2" width="969" height="768"></a><p></p> </li> 
 <li>On a client (host) that can reach the VIP, generate traffic to the VIP and dump the output to a file. For example, enter a curl command such as the following:<br> <pre crayon="false" class="command-line language-bash" data-prompt=": >"><code>curl -vvv http://ourcorp.example.com/ &gt; outfile</code></pre> Examine the output file. It should have a Set-Cookie header such as the following:<p></p> <pre crayon="false"><code>Set-Cookie: CORP_COOKIE=026cc2fffb-b95b-41-dxgObfTEe_IrnYmysot-VOVY1_EEW55HqmENnvCj9PWn8glWNNDQc3YMmuVHhbOI9E; path=/
</code></pre> </li> 
 <li>The client should store the cookie and include it in subsequent requests to the VIP. To verify correct operation of the feature, send several requests to the VIP. </li> 
 <li>Based on the persistence information in the cookie, Avi Vantage sends each request to the same pool and server, identified in the cookie. To verify that persistence is working, use the Avi Controller web interface to navigate to the logs page for the client. The client logs should indicate the server to which each request was sent by Vantage. All the requests should go to the same server. </li> 
 <li>To verify the request and response headers, go to an individual client log and look for the All Headers link. The link displays all the headers that were received from and sent to the client.</li> 
</ol> 