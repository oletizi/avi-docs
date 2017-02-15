---
title: Top of DLR with Avi Vantage for no SNAT for Web Tier
layout: default
---
In this topology the Avi SE is installed on top of NSX DLR. Physically, the Avi SE gets deployed on the ESXi on the Edge rack. This topology is popular on layer 3 physical fabrics, such as spine-leaf. The feature for this topology will be completely supported in future Avi Vantage releases.

### <a name="_Toc472077253"></a>Logical and Physical View

Logically, the Avi SE is installed on top of NSX DLR. The SEs must be deployed in legacy HA (active/standby) mode. The SE connects to the External network (non-encapsulated) for front-end and Web-tier-01 VXLAN (encapsulated) for back-end. The default gateway for web, application and DBMS servers is DLR. The default gateway for DLR is a floating IP address on the SE in the Transit network. See <a href="/default-gateway-ip-routing-on-avi-se/">IP Routing on Avi SE</a> feature for more details. In this case the client IP is preserved.

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture28.png"><img class="wp-image-22860" src="img/Picture28.png" alt="Logical View, Parallel to NSX Edge Using Avi for North-South Load Balancing" width="794" height="428"></a>  
<figcapture> Logical View, Parallel to NSX Edge Using Avi for North-South Load Balancing 
</figcapture>
</figure> 

 

Following the recommendation (refer to <a href="https://communities.vmware.com/docs/DOC-27683">VMware® NSX for vSphere Network Virtualization Design Guide ver 3.0</a>), configure the SE group properties to physically deploy the SEs in the Edge racks where External network is available.

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture29.png"><img class="wp-image-22858" src="img/Picture29.png" alt="Physical View, Parallel to NSX Edge Using Avi for North-South Load Balancing" width="799" height="386"></a>  
<figcapture> Physical View, Parallel to NSX Edge Using Avi for North-South Load Balancing 
</figcapture>
</figure> 

### <a name="_Toc472077254"></a>Traffic Flows

### North-South Traffic Flow

Logical Traffic flows are:

* Client → Web VIP on Avi SE
* Avi SE → Web server via DLR 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture30.png"><img class=" wp-image-22856" src="img/Picture30.png" alt="Logical View, North-South Traffic Flow" width="806" height="431"></a>  
<figcapture> Logical View, North-South Traffic Flow 
</figcapture>
</figure> 

Physical traffic flows are as follows:

* Client on External network → ESXi hosting the SE → SE VM
* SE VM → VXLAN on ESXi kernel hosting the SE → ESXi kernel hosting the web VM
* ESXi kernel hosting the web VM → web VM 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture31.png"><img class=" wp-image-22854" src="img/Picture31.png" alt="Physical View, North-South Traffic Flow" width="807" height="432"></a>  
<figcapture> Physical View, North-South Traffic Flow 
</figcapture>
</figure> 

### South-North Traffic Flow

Logical traffic flows originating from the servers:

* Server VM → DLR
* DLR → SE
* SE → External network 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture32.png"><img class=" wp-image-22852" src="img/Picture32.png" alt="Logical View, South-North Traffic Flow" width="807" height="438"></a>  
<figcapture> Logical View, South-North Traffic Flow 
</figcapture>
</figure> 

 

Physical traffic flows originating from the servers are:

* ESXi hosting the web/app/DBMS server → ESXi hosting the SE 
*Note: DLR is not a step since it is distributed and done here in the ESXi hosting the web/app/DBMS kernel.*
* From SE → External network 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture33.png"><img class=" wp-image-22850" src="img/Picture33.png" alt="Physical View, South-North Traffic Flow" width="812" height="409"></a>  
<figcapture> Physical View, South-North Traffic Flow 
</figcapture>
</figure> 

### <a name="_Toc472077255"></a>VIP requirements

* No SNAT is required. 

 

