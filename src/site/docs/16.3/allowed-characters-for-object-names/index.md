---
title: Allowed Characters for Object Names
layout: 16.3
---
## Object Names

Object names within Avi Vantage, such as the names of virtual services and pools, have the following limitations:

* Uniqueness within tenants: an object name must be unique within a given tenant. Different tenants may use the same name. 
* Maximum Length: 255 characters. 
* Alphabetic characters allowed: a -> z; A -> Z 
* Digital characters allowed: 0 -> 9 
* The space character, plus these special symbols:   . @ + - _  

Object names may be changed without impact to linked objects. For instance, each virtual service is associated with a pool. The name of a virtual service can be changed without requiring a change to the configuration of the pool the virtual service is associated with.

## Local User Names

The names of Vantage user accounts that are maintained locally, in the Controller database, support the same characters as those for other object names within Vantage. (The supported characters are listed above.)

**Notes:**

* User accounts created through Keystone or LDAP / AD have the same limitations as other user accounts in those authentication systems. 
* Vantage user names that include any of the supported special characters ( . @ + - _ ) can access Vantage through the web interface, API, or CLI. However, these accounts cannot access the Controller's Linux shell. For example:  
<pre class="command-line language-bash" data-prompt=": >" data-output="2"><code>shell
Shell access not allowed for this user</code></pre> 

## Best Practice for Referring To Object Names

Each object is assigned a unique identifier (UUID). As a best practice, API calls and custom scripts should refer to UUIDs rather than the object names. This practice can eliminate potential impact to the operation of scripts following a change to an object's name.
