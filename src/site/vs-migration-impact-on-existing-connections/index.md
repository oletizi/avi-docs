---
title: Virtual Service Migration Impact on Existing Connections
layout: default
---
A virtual service may be migrated, or moved onto a different Avi Service Engine.  This may be initiated automatically or manually depending on the automation mode set.  Under the hood, a migration uses the same mechanism as a virtual service scale out.

1. A new SE is chosen, and the current primary SE will scale out to it.  All new connections will point to the MAC address of the original primary SE.  The primary will forward new client's packets to the MAC address of the new SE.  That SE will process these new connections and respond back directly to the clients.  Existing connections handled by the old SE will not be impacted and will be allowed to gracefully finish.
1. After a period of 30 seconds, remaining connections handled by the primary SE will be terminated.
1. The new secondary SE will take over the VS by promoting itself to primary.  It will ARP for the IP address of the virtual IP and any virtual services using that IP.
1. The old SE will remove the virtual service from its configuration.  The old SE will remain available for new virtual services or to take over for a failed SE.  If the SE is idle with no configured virtual services, it may be removed after a period of time defined within its SE Group properties. The automatic deletion will occur when Vantage is in Write Access mode.  For Read or No Access modes, an administrator would need to manually delete the SE if that is the desired outcome.