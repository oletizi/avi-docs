---
title: Faults in Avi Vantage System
layout: layout163
---
Faults represent issues occurring in the Avi Vantage system itself.

Faults depict the state at a specific moment in time. Each fault generates a system event, which is a historical representation of the occurrence.

Faults should not be confused with alerts. While a fault represents an issue at a specific moment in time, alerts are generated based on expressions defined on events.

The faults available in the Avi Vantage System are:

* Avi Controller fault
* Virtual service fault 

### **Controller Fault**

A Controller fault is a warning message which pops up when an user logs into the Avi Controller. It pops up as long as the error condition persists in the system.

For a specific login session the user can choose to dismiss the fault warning window. In that case it will not show for the duration of the specific session.

The Controller fault warns of the following conditions:

* **License timeline:** This  warning is displayed for the following conditions:  
    * Controller license expiring: The Controller license is about to expire in a day. The message displayed is ***License <license name> expiring***
    * Controller license expired: The Controller is working on a license which has already expired. The message displayed is ***License <license name> expired*** 
* **License limit**: This warning is displayed for *server-based* and *core-based* licenses. It highlights the following conditions:  
    * License limit expiring: The number of remaining license count for the specific license is less than 5. The message displayed is ***<Server based/Core based> license count exceeding soon***
    * License limit expired: There are no more remaining license count available in the Controller for the specific license type. The message displayed is ****<Server based/Core based> license count exceeded****
* **Controller cluster**: This warning is displayed only when a node in the Controller cluster is not in the active state. The following message is displayed:  
    * Cluster State: HA_COMPROMISED, NO_HA, etc.
    * Number of nodes having issues: E.g.,  "1 node(s) of cluster not UP
    * Detailed information of each node having issues: Name and current cluster state of the node
* **Backup scheduler: **This warning is displayed if the backup scheduler is not configured for the Avi Controller. 

### **Virtual Service Fault**

A virtual service fault is a warning message which pops up on the virtual service page. It warns of the following conditions:

* **SSL certificate expiry**: This warning is displayed for the SSL certificate associated with a particular virtual service. There are two possible scenarios: <ol> 
 <li>SSL certificate expired: The message displayed is <strong><em>&lt;SSL Certificate name&gt; expired on &lt;Date&gt;</em></strong></li> 
 <li>SSL certificate expiring: The SSL certificate is going to expire in less than a month. The message displayed is <strong><em>&lt;SSL Certificate name&gt; expiring on &lt;Date&gt;</em></strong></li> 
</ol> 
* **Back-end server access from Service Engine**: This warning is displayed if the pool state is UP, but there exists at least one Service Engine not able to access the back-end servers. A scaled-out virtual service will be placed on multiple Service Engines. All the Service Engines should be able to access all the back-end servers configured for the pool. For each server in error, the message displayed is ***Server <Server name> not accessible from Service Engine(s) <comma separated list of Service Engines>***
* **Scale out:** This warning is displayed when the total number of Service Engine(s) requested for scale out is not equal to the number of Service Engines finally assigned to the virtual service.
* **Debug/trace on Service Engine**: This warning is displayed if debug logs or packet-level tracing is enabled on the virtual service. The message displayed is ***<Packet capture>/<Debug flags> enabled*** 

 

