---
title: Network Reachability
layout: layout171
---
For a virtual service to be placed on an Avi Service Engine, the Avi Controller first looks for SEs with available capacity and network reachability to make a virtual service placement decision.  Reachability means the Service Engine has access to the networks required per the configuration of the virtual service and its pool members.

<a href="img/VSobjectModel.png"><img class="alignnone wp-image-491" src="img/VSobjectModel.png" alt="VSobjectModel" width="642" height="205"></a>

In the example above, a Service Engine is required to have access to the following networks:

* 20.1.1.x — VIP network
* 10.1.1.x — Pool-1 and Pool-3 network
* 192.168.1.x — Pool-2 network 

For the first network, 20.1.1.x, the Service Engine is required to have an interface in this layer 2 network.  It will need to be able to send gratuitous ARPs for the VIP.  The Service Engine will also need an IP address of its own within the network.

For the pool / server networks, the Service Engine is preferred to have an interface in this layer 2 network, however, if proper routes exist, the SE can access the servers via layer 3 routing.  The Controller will prefer SEs with local L2 adjacency to servers versus SEs with L3 routed access.

If no SEs exist that meet the available capacity and network reachability requirements, then:

* An existing SE must have its network properties updated (for reachability),
* Virtual services must be scaled or migrated (to create capacity), or
* A new Service Engine must be created. 

If the Controller has write-access mode enabled, it will determine the proper action to ensure the virtual service is deployed.  If Avi Vantage is deployed in read or no-access modes, an administrator may be required to make the necessary changes.

Issues such as network reachability are most commonly encountered when creating a new virtual service, but they may also pop up when adding a new pool to a VS or a new server to a pool.

Read these articles for additional information on virtual service placement:

* <a href="{% vpath %}/architectural-overview/applications/virtual-services/create-virtual-service/">Create a Virtual Service</a>
* <a href="{% vpath %}/avi-service-engine-group-options/">Avi Service Engine Group Options</a>
* <a href="{% vpath %}/anti-affinity-for-service-engine-placement/">Anti-Affinity for Service Engine Placement</a>
* <a href="{% vpath %}/enable-a-virtual-service-vip-on-all-interfaces/">Enable a Virtual Service VIP on All Interfaces</a>