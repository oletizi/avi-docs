---
title: VRF Support for Service Engine Deployment on Bare-Metal Servers
layout: layout171
---
Starting with Avi Vantage release 16.3, Avi Service Engine data interfaces can be assigned to multiple VRFs (Virtual Routing and Forwarding Context).

Virtual Routing Framework, or VRF, is a method of isolating traffic within a system. This is also referred to as a "route domain" within the load balancer community.

### **Clouds Types Supported**

Avi Vantage supports assignment of Service Engine data interfaces to multiple VRFs only in the cloud types listed below.

* No Access Cloud
* Linux Server Cloud 

### **Types of Interfaces Supported**

The VRF property for the following types of data interfaces can be modified by the user, via the REST API, UI, or CLI.

* Physical interfaces
* Port-channel interfaces
* VLAN interfaces 

The types of data interfaces below do not support modification of the VRF property. Any attempt to modify them will result in an error.

* Port-channel member interfaces
* Management interface 

### **Dependency on In-band Management**

Each deployed Service Engine has a new attribute, "in-band management". When enabled, the management interface of the Service Engine (i.e., the interface used to communicate with the Avi Controller cluster) is also used for data plane traffic.

* If in-band management is enabled on an SE, that SE will not support multiple VRFs.
* To enable multiple VRFs on an SE, it must be deployed with in-band management *disabled*. The caveat with disabling in-band management is that the management interface will not be used for data plane traffic, and hence no VS will be placed on this interface and this interface will not be used to communicating with back-end servers. 

To learn how to disable/enable in-band management read <a href="/docs/17.1/configuring-in-band-management-for-an-avi-service-engine/">this article</a>.

### **Creating VRF Contexts**

<ol> 
 <li>Navigate to Infrastructure &gt; Clouds.</li> 
 <li>Click on the cloud name.<br> 
  <blockquote> 
   <p>Note: If the VMware vCenter cloud is the only one configured, or was the first one configured, the cloud name is "Default-Cloud".</p> 
  </blockquote> </li> 
 <li>Click VRF Context, then click the Create VRF Context button.<a href="img/vrf1.png"><img class="size-full wp-image-5930 aligncenter" src="img/vrf1.png" alt="vrf1" width="1237" height="331"></a></li> 
 <li>Enter the name of the VRF context and click Save.<a href="img/vrf2.png"><img class="size-full wp-image-5931 aligncenter" src="img/vrf2.png" alt="vrf2" width="752" height="562"></a></li> 
</ol> 

### **Modifying SE Data Interface VRF — UI**

Service Engine physical, port-channel & VLAN interface VRFs can be updated if there are multiple VRFs configured in the tenant and cloud to which the SE belongs.

<figure class="thumbnail wp-caption aligncenter"> <a href="img/Screen-Shot-2016-10-17-at-1.56.04-PM.png"><img class="wp-image-15757" src="img/Screen-Shot-2016-10-17-at-1.56.04-PM.png" alt="Screen Shot 2016-10-17 at 1.56.04 PM" width="800" height="424"></a>  
<figcapture> Figure. SE editor pulldown menu for updating SE interface VRF 
</figcapture>
</figure> 

 

<figure class="thumbnail wp-caption aligncenter"> <a href="img/Screen-Shot-2016-10-17-at-1.58.17-PM.png"><img class="wp-image-15762" src="img/Screen-Shot-2016-10-17-at-1.58.17-PM.png" alt="Selecting VRF for SE VLAN interface" width="800" height="313"></a>  
<figcapture> Figure. Selecting VRF for SE VLAN interface 
</figcapture>
</figure> 

### **Modifying SE Data Interface VRF ****—****CLI**

<figure class="thumbnail wp-caption aligncenter"> <a href="img/Screen-Shot-2016-10-17-at-2.08.38-PM.png"><img class="wp-image-15776" src="img/Screen-Shot-2016-10-17-at-2.08.38-PM.png" alt="Setting VRF for physical and VLAN interfaces through CLI" width="800" height="234"></a>  
<figcapture> Figure. Setting VRF for physical and VLAN interfaces through CLI 
</figcapture>
</figure> 

### **Creating Virtual Services in a VRF**

> Note: These steps can be performed from the admin tenant or from another tenant.
 <ol> 
 <li>Navigate to Applications &gt; Dashboard, and click New Virtual Service.</li> 
 <li>Select the VRF context from the list, and click Next.<a href="img/vrf5.png"><img class="size-full wp-image-5933 aligncenter" src="img/vrf5.png" alt="vrf5" width="760" height="569"></a></li> 
 <li>Enter a name for the virtual service, virtual IP address (VIP) and other properties of the virtual service.</li> 
 <li>Click Save.</li> 
</ol> 