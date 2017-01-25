---
title: HTTP Cookie Persistence
layout: layout163
---
The HTTP cookie mode of persistence enables sticking a client to a server for the duration of their session. HTTP cookie persistence may be applied to any virtual service with an attached HTTP application profile. With this persistence method, Vantage Service Engines (SEs) will insert an HTTP cookie into a server's first response to a client.

To use HTTP cookie persistence, no configuration changes are required on the back-end servers. HTTP persistence cookies created by Vantage have no impact on existing server cookies or behavior.

Note: Vantage also has an <a href="/docs/16.3/app-cookie-persistence">"app cookie" persistence mode</a>, which relies on cookies as well. The app cookie method performs persistence based on information in existing server cookies, rather than inserting a Vantage-created cookie.

To validate if HTTP cookie persistence is working, enable all headers for the virtual service analytics.  Then view the logs to see the cookies sent by a client.

See <a href="/docs/16.3/overview-of-server-persistence/">Overview of Server Persistence</a> for descriptions of other persistence methods and options.

### Cookie Format

The following is an example of an HTTP session-persistence cookie created by Vantage.

<pre>Set-Cookie: AVI_COOKIE=026cc2fffb-b95b-41-dxgObfTEe_IrnYmysot-VOVY1_EEW55HqmENnvC; path=/</pre> 

The cookie payload contains the back-end server IP address and port.

In versions 16.1 and prior, the cookie payload is obfuscated with a hash.

In 16.2 and later, the payload is encrypted with AES-256. When a client makes a subsequent HTTP request, they include the cookie, which the SE uses to ensure the client's request is directed to the same server.

### Cookie Persistence Timeout

Beginning in Avi Vantage 16.2, persistence profiles allow configuration of a persistence timeout. The persistence timeout sets the maximum amount of time a persistence cookie is valid.

The persistence timeout applies to persistence cookies that are created by Vantage for individual client sessions with virtual services that use the persistence profile.

Generally, the client or browser has responsibility to clear a persistent session cookie after the session the cookie was for is terminated, or when the browser is closed. Setting a persistence timeout takes care of cases where the client or browser does not clear the session cookies.

The persistence timeout within a persistence profile can be set to 10-720 minutes. If the timeout is set, the maximum lifetime of any session cookie that is created based on the profile is set to the timeout. In this case, the cookie is valid for a maximum of the configured timeout, beginning when Vantage creates the cookie.

For example, if the persistence timeout is set to 720 minutes, a cookie created based on the profile is valid for a maximum of 12 hours, beginning as soon as the cookie is created. After the persistence timeout expires, the cookie expires and is no longer valid.

By default there is no timeout and the cookie sent is a session cookie, which is cleared by the client after the session ends.

### Persistence Mirroring

Since clients maintain the cookie and present it when visiting the site, Vantage does not need to store the persistence information or mirror the persistence mappings to other SEs, allowing for greater scale with minimal effort.

### Persistence Duration

HTTP cookie persistence leverages a session-based cookie, which is valid as long as the client maintains an HTTP session with Vantage. If the client closes a browser, the cookie is deleted and the persistence is finished.

### Configuration Options

* **Name**: Unique name for the persistence profile.
* **Description**: Optional, custom description for the profile.
* **Type**: HTTP Cookie. Changing the type will change the profile to another persistence method.
* **Select New Server When Persistent Server Down: **If a server is marked down, such as by a health monitor or when it has reached a connection limit, should existing persisted users continue to be sent to the server, or load balanced to a new server?  
    * **Immediate:** Vantage will immediately select a new server to replace the one marked down and switch the persistence entry to the new server.
    * **Never:** No replacement server will be selected. Persistent entries will be required to expire normally based upon the persistence type.
* **HTTP Cookie Name**: By default, the cookie is named AVI_COOKIE. By populating this optional field, the cookie will be inserted with the custom name.
* **Always Send**:  By default a persistence cookie is sent once at the beginning of a session to the client.  Clients will then respond back with the cookie with each request.  However some web applications, such as those incorporating Java or Javascript, may not include the cookie in their request if it was not received in the previous response.  Enabling Always Send will have Vantage include the cookie on every response. 

 

