---
title: App Cookie Persistence
layout: layout163
---
The *app cookie* mode of persistence may be applied to any virtual service with an attached HTTP application profile. With this persistence method,

Rather than have Avi Vantage insert its own cookie into HTTP responses for persistence, Vantage will rely on either an existing cookie that is inserted by the server, or a header. If the specified cookie does not exist in the client request, Vantage will look for a URI query of the same name and will persist on that value. Typically this persistence will be performed on a ASP or a Java session ID.

Servers using session ID do not have control over whether a client will accept a cookie. For this purpose, they may choose to embed the session ID in both a cookie and the URI.  Older browsers or clients from Europe may skip the cookie, but still include the session ID within the query of their requests. For this reason Vantage automatically checks both locations.

Once an identifier has been located in a server response and a client's request, Vantage creates an entry in a local persistence table for future persistence.
&gt; <code>www.avinetworks.com/index.html?jsessionid=a1b2c3d4e5</code>
 

Note: This method involves using an existing server cookie. For Vantage to use its own cookie for persistence, use the <a href="/docs/16.3/http-cookie-persistence">HTTP Cookie persistence</a> mode, which is straightforward and more scalable.

See also <a href="/docs/16.3/overview-of-server-persistence">Overview of Server Persistence</a> for descriptions of other persistence methods and options.

### Persist Table

Since app cookie persistence is stored locally on each Service Engine, larger tables will consume more memory.  For very large persist tables, consider adding additional memory to the SEs via the SE Group properties for SE memory and via the SE Group &gt; Connection table setting. See also <a href="/docs/16.3/se-memory-consumption">SE Memory Consumption</a>

The app cookie persistence table is automatically mirrored to all Service Engines supporting the virtual service which is using a pool configured with this persistence type.

### Configuration Options

* **Name**:  A unique name for the persistence profile.
* **Description**:  An optional, custom description for the profile.
* **Type**:  Client IP Address.  Changing the type will change the profile to another persistence method.
* **Select New Server When Persistent Server Down: ** If a server is marked down, such as by a health monitor or when it has reached a connection limit, should existing persisted users continue to be sent to the server, or load balanced to a new server?  
    * **Immediate:**  Vantage will immediately select a new server to replace the one marked down and switch the persistence entry to the new server.
    * **Never:**  No replacement server will be selected. Persistent entries will be required to expire normally based upon the persistence type.
* **Persistence Timeout**:  Once a client has closed any open connections to the virtual service, Vantage will keep the persistence value for the configured time. Once the time has expired without the client reconnecting, the entry is expired from the persist table. If the client reconnects before the timeout has expired, they are persisted to the same server and the timeout is canceled. The default timeout value is 20 minutes, which maps to most application server's default session timeout values.
* **Application Cookie Name**:  This is the name of the cookie or client query that Vantage is looking for in the request and response. 