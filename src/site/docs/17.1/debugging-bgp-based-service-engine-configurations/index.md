---
title: Debugging BGP-based Service Engine Configurations
layout: layout171
---
How to check if a BGP session doesn’t come up: 

1. Doublecheck the configuration on the router and Avi. Make sure the peer IPs, subnets, and AS numbers are correct. 

2. Verify the MD5 passwords are the same on the router and Avi.

3. Invoke “show serviceengine <xyz> bgp” to determine the state of the BGP session initiated by the Avi SE.

4. Verify there are no ACLs/route-maps on the router preventing the sessions/advertisements.

5. Additionally, if needed, check the packet capture using tcpdump (tcpdump -M <md5_password>) on the router and check BGP negotiations.
