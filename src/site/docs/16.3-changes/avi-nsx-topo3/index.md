---
title: Parallel to NSX Edge Using VXLAN Overlays with Avi Vantage for both North-South and East-West Load Balancing Using Transit-Net
layout: default
---
In this topology, the Avi SE is installed parallel to the NSX Edge. Physically, the Avi SE gets deployed on the ESXi on the edge rack. The exact ESXi hosts or cluster on which the SE needs to be placed can be configured in SE group properties on Avi Vantage. This topology can work with both VLAN (Layer2) and VXLAN (Layer3 routed overlay) networks.

### <a name="_Toc472077245"></a>Logical and Physical View

Logically, the Avi SE(s) is(are) installed parallel to the NSX Edge. The SEs may be deployed in elastic HA (active/active or N+M buffer) or legacy HA (active/standby) mode. The SE connects to the External network (non-encapsulated) and Transit-Net VXLAN (encapsulated). The Web-VIP is on the External network, while the App-VIP is on the transit network. Traffic is SNATed by the SE. Default gateway for web, application and DBMS servers is DLR.

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture12.png"><img class=" wp-image-22741" src="img/Picture12.png" alt="Logical View, Parallel to NSX Edge Using VXLAN Overlays with Avi Vantage for both N-S and E-W using Transit-Net" width="772" height="452"></a>  
<figcapture> Logical View, Parallel to NSX Edge Using VXLAN Overlays with Avi Vantage for both N-S and E-W using Transit-Net 

</figcapture>
</figure> 

 

Following the recommended design (refer to <a href="https://communities.vmware.com/docs/DOC-27683">VMware® NSX for vSphere Network Virtualization Design Guide ver 3.0</a>), the recommendation is to configure the SE group properties to physically deploy the SEs in the edge racks where the external network is available.

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture13.png"><img class=" wp-image-22739" src="img/Picture13.png" alt="Physical View, Parallel to NSX Edge Using VXLAN Overlays with Avi for both N/S and E/W Load Balancing using Transit-Net" width="776" height="413"></a>  
<figcapture> Physical View, Parallel to NSX Edge Using VXLAN Overlays with Avi for both N/S and E/W Load Balancing using Transit-Net 
</figcapture>
</figure> 

 

### <a name="_Toc472077246"></a>Avi Configuration

To deploy SEs for this topology, configure Avi as follows:

### Cloud Configuration:

* Configure the Cloud for vCenter orchestrator with write access.
* On the Datacenter tab of the configuration, select the “Prefer Static Routes vs Directly Connected Network” checkbox. 

<a href="img/Screen-Shot-2017-01-17-at-10.08.09-AM.png"><img class="alignnone wp-image-22764" src="img/Screen-Shot-2017-01-17-at-10.08.09-AM.png" alt="Screen Shot 2017-01-17 at 10.08.09 AM" width="785" height="523"></a>

### Static route configuration:

* Navigate to Infrastructure → Routing → Static Route
* Add a new static route to reach the server networks (Web, App and DB) through the DLR. 

<a href="img/Screen-Shot-2017-01-17-at-12.47.38-PM-1.png"><img class="alignnone wp-image-22768 " src="img/Screen-Shot-2017-01-17-at-12.47.38-PM-1.png" width="790" height="298"></a>

### SE Group configuration:

* Navigate to Infrastructure → Service Engine Group and edit the Default-Group.
* On Advanced tab, set “Host Scope Service Engine within” to Cluster.
* Under Cluster select “Include” and select the edge cluster to deploy the SEs. 

<a href="img/Screen-Shot-2017-01-17-at-10.06.45-AM.png"><img class="alignnone wp-image-22762" src="img/Screen-Shot-2017-01-17-at-10.06.45-AM.png" alt="Screen Shot 2017-01-17 at 10.06.45 AM" width="803" height="535"></a>

### Traffic Flows

### North-South Traffic Flow

Logical traffic flows are (red arrows):

* Client→ Web VIP on Avi SE
* Avi SE→ Web server via DLR 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture14.png"><img class=" wp-image-22737" src="img/Picture14.png" alt="Logical View, North-South Traffic Flow (red arrows)" width="810" height="463"></a>  
<figcapture> Logical View, North-South Traffic Flow (red arrows) 
</figcapture>
</figure> 

Physical traffic flows are:

* Client on External network→ ESXi hosting the SE→ SE VM
* SE VM→ VXLAN on ESXi kernel hosting the SE→ ESXi kernel hosting the Web VM 
*Note: DLR is not a step since it is distributed and done in the ESXi hosting the SE.*
* ESXi kernel hosting the web VM→ web VM 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture15.png"><img class=" wp-image-22735" src="img/Picture15.png" alt="Physical View, North-South Traffic Flow" width="814" height="416"></a>  
<figcapture> Physical View, North-South Traffic Flow 
</figcapture>
</figure> 

 

### East-West Traffic Flow

Logical traffic flows are (purple arrows):

* Web VM→ app VIP on Avi SE via DLR
* Avi SE→ app server via DLR 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture16.png"><img class=" wp-image-22733" src="img/Picture16.png" alt="Logical View, East-West Traffic Flow (purple arrows)" width="818" height="468"></a>  
<figcapture> Logical View, East-West Traffic Flow (purple arrows) 
</figcapture>
</figure> 

 

Physical traffic flows are:

* Web VM→ ESXi kernel hosting the Web VM→ ESXi kernel hosting the SE 
*Note: DLR is not a step since it is distributed and done in the ESXi kernel hosting the Web VM.*
* ESXi kernel hosting the SE→ SE VM→ ESXi kernel hosting the app VM. 
*Note: DLR is not a step since it is distributed and done in the ESXi kernel hosting the SE.*
* ESXi hosting the app VM→ the app VM 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture17.png"><img class=" wp-image-22731" src="img/Picture17.png" alt="Physical View, East-West Traffic Flow" width="831" height="432"></a>  
<figcapture> Physical View, East-West Traffic Flow 
</figcapture>
</figure> 

 

 

### South-North Traffic Flow

Logical traffic flows originating from the servers are:

* Server VM→ DLR→ Edge→ External network 
<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture18.png"><img class=" wp-image-22729" src="img/Picture18.png" alt="Logical View, South-North Traffic Flow" width="837" height="469"></a>  
<figcapture> Logical View, South-North Traffic Flow 
</figcapture>
</figure> 

 

Physical traffic flows originating from the servers are:

* ESXi hosting the web/app/DBMS server→ ESXi hosting the Edge→ External 
*Note: DLR is not a step since it is distributed and done here in ESXi hosting the web/app/DBMS kernel.* 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Picture19.png"><img class=" wp-image-22727" src="img/Picture19.png" alt="Physical View, South-North Traffic Flow" width="845" height="431"></a>  
<figcapture> Physical View, South-North Traffic Flow 
</figcapture>
</figure> 

### <a name="_Toc472077247"></a>VIP requirements

* Web-VIP requires SNAT
* App-VIP requires SNAT 