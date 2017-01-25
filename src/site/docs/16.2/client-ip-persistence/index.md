---
title: Client IP Persistence
layout: 16.2
---
The *client IP address* mode of persistence may be applied to any virtual service, regardless if it is TCP or UDP. With this persistence method, Vantage Service Engines will stick the client to the same server for the configurable duration of time and store the mapping in a local database.

See also <a href="/docs/16.2/overview-of-server-persistence">Overview of Server Persistence</a> for descriptions of other persistence methods and options.

### Persist Table

Since client IP persistence is stored locally on each Service Engine, larger tables will consume more memory.  For very large persist tables, consider adding additional memory to the SEs via the SE Group properties for SE memory and via the SE Group &gt; Connection table setting. See also <a href="/docs/16.2/se-memory-consumption">SE Memory Consumption</a>

The client IP persistence table is automatically mirrored to all Service Engines supporting the virtual service which is using a pool configured with this persistence type.

### Configuration Options

* **Name**:  A unique name for the persistence profile.
* **Description**:  An optional, custom description for the profile.
* **Type**:  Client IP Address.  Changing the type will change the profile to another persistence method.
* **Select New Server When Persistent Server Down: ** If a server is marked down, such as by a health monitor or when it has reached a connection limit, should existing persisted users continue to be sent to the server, or load balanced to a new server?  
    * **Immediate:**  Vantage will immediately select a new server to replace the one marked down and switch the persistence entry to the new server.
    * **Never:**  No replacement server will be selected. Persistent entries will be required to expire normally based upon the persistence type.
* **Persistence Timeout**:  Once a client has closed any open connections to the virtual service, Vantage will keep the persistence value for the configured time. Once the time has expired without the client reconnecting, the entry is expired from the persist table. If the client reconnects before the timeout has expired, they are persisted to the same server and the timeout is canceled. The default timeout value is 5 minutes. 