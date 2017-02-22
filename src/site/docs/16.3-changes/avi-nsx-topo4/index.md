---
title: Parallel to NSX Edge Using Avi Vantage for North-South and East-West Load Balancing
layout: default
---
In this topology the Avi SE is installed parallel to NSX Edge. Physically, the Avi SE gets deployed on any of the ESXi hosts on the edge rack. Though it is similar to topology 1, this topology is popular on layer 3 physical fabrics, such as spine-leaf. It also works on Layer 2 physical fabrics.

### <a name="_Toc472077249"></a>Logical and Physical View

Logically, the Avi SE(s) is(are) installed parallel to NSX Edge. The SEs may be deployed in elastic HA (active/active or N+M buffer) or legacy HA (active/standby) mode. The SE connects to the External network (non-encapsulated), Web-tier-01 VXLAN (encapsulated), and App-tier-01 VXLAN (encapsulated). The Web VIP is on the External network and the app VIP is on the web-tier-01. Traffic is SNATed by the SE. The default gateway for the web, app and DBMS servers  is DLR.

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture20.png"><img class=" wp-image-22804" src="img/Picture20.png" alt="Logical View, Parallel to NSX Edge Using Avi for N-S Load Balancing" width="788" height="451"></a>  
<figcapture> Logical View, Parallel to NSX Edge Using Avi for North-South Load Balancing 
</figcapture>
</figure> 

 

Following the recommended design (refer to <a href="https://communities.vmware.com/docs/DOC-27683">VMware® NSX for vSphere Network Virtualization Design Guide ver 3.0</a>), the recommendation is to configure the SE group properties to physically deploy the SEs in the Edge racks where external network is available.

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture21.png"><img class=" wp-image-22802" src="img/Picture21.png" alt="Physical View, Parallel to NSX Edge Using Avi for N/S and E/W LB" width="793" height="423"></a>  
<figcapture> Physical View, Parallel to NSX Edge Using Avi for North-South and East-West LB 
</figcapture>
</figure> 

### <a name="_Toc472077246"></a>Avi Configuration

To deploy SEs for this topology, configure Avi as follows:

### SE Group configuration:

* Navigate to Infrastructure → Service Engine Group and edit the Default Group.
* On Advanced tab, set “Host Scope Service Engine within” to Cluster.
* Under Cluster select “Include” and select the edge cluster to deploy the SEs. 

<a href="img/Screen-Shot-2017-01-17-at-10.06.45-AM.png"><img class="alignnone wp-image-22762" src="img/Screen-Shot-2017-01-17-at-10.06.45-AM.png" alt="Screen Shot 2017-01-17 at 10.06.45 AM" width="804" height="536"></a>

### <a name="_Toc472077250"></a>Traffic Flows

### North-South Traffic Flow

Logical traffic flows are:

* Client → Web VIP on Avi SE
* Avi SE → Web server 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture22.png"><img class=" wp-image-22800" src="img/Picture22.png" alt="Logical View, North-South Traffic Flow" width="798" height="456"></a>  
<figcapture> Logical View, North-South Traffic Flow 
</figcapture>
</figure> 

Physical traffic flows are:

* Client on External network → the ESXi hosting the SE → SE VM
* SE VM → VXLAN on ESXi kernel hosting the SE → ESXi kernel hosting the web VM
* ESXi kernel hosting the Web VM → Web VM 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture23.png"><img class=" wp-image-22798" src="img/Picture23.png" alt="Physical View, North-South Traffic Flow" width="800" height="409"></a>  
<figcapture> Physical View, North-South Traffic Flow 
</figcapture>
</figure> 

### East-West Traffic Flow

Logical traffic flows are as follows:

* Web VM → app VIP on the Avi SE
* Avi SE → app server 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture24.png"><img class=" wp-image-22796" src="img/Picture24.png" alt="Logical View, East-West Traffic Flow" width="804" height="472"></a>  
<figcapture> Logical View, East-West Traffic Flow 
</figcapture>
</figure> 

 

Physical traffic flows are:

* Web VM → VXLAN on the ESXi kernel hosting the Web VM
* ESXi kernel hosting the Web VM → ESXi hosting the SE → SE VM
* SE → VXLAN on ESXi kernel hosting the SE → ESXi kernel hosting the app VM 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture25.png"><img class=" wp-image-22794" src="img/Picture25.png" alt="Physical View, East-West Traffic Flow" width="805" height="419"></a>  
<figcapture> Physical View, East-West Traffic Flow 
</figcapture>
</figure> 

### South-North Traffic Flow

Logical traffic flows originating from the servers:

* Server VM → DLR → Edge → External network 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture26.png"><img class=" wp-image-22792" src="img/Picture26.png" alt="Logical View, South-North Traffic Flow" width="800" height="457"></a>  
<figcapture> Logical View, South-North Traffic Flow 
</figcapture>
</figure> 

 

Physical traffic flows originating from the servers are:

* From ESXi hosting the web/app/DBMS server → ESXi hosting the Edge → External 
*Note: DLR is not a step since it is distributed and done here in the ESXi hosting the web/app/DBMS kernel.* 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture27.png"><img class=" wp-image-22790" src="img/Picture27.png" alt="Physical View, South-North Traffic Flow" width="806" height="411"></a>  
<figcapture> Physical View, South-North Traffic Flow 
</figcapture>
</figure> 

### <a name="_Toc472077251"></a>VIP requirements

* Web-VIP requires SNAT
* App-VIP requires SNAT 