---
title: VLAN Configuration on Bare Metal
layout: layout162
---
Avi Vantage supports VLAN trunking on bare metal servers. If the Avi Controller is deployed on a bare metal server, the individual physical links of the server can be configured to support 802.1q-tagged virtual LANs (VLANs). Each VLAN interface has its own IP address. Multiple VLAN interfaces per physical link are supported.
> Note: VLAN tagging applies only to bare metal deployments.
 

To configure a VLAN interface on a bare metal server running Vantage:

<ol> 
 <li>Navigate to Infrastructure, and click on the Service Engine (SE) where the VLAN interface is to be created.</li> 
 <li>Click the Edit button, and the following pop-up window appears. <p><a href="img/vlan-baremetal1.png"><img class="alignnone size-full wp-image-5832" src="img/vlan-baremetal1.png" alt="vlan-baremetal1" width="429" height="318"></a></p></li> 
 <li>Click Create VLAN Interface.</li> 
 <li>Select the parent interface from the drop-down list, and fill in the VLAN and IP Address fields, then click Save. The VLAN interface appears on the Service Engine Edit page. <p><a href="img/vlan-baremetal3.png"><img class="alignnone size-full wp-image-5833" src="img/vlan-baremetal3.png" alt="vlan-baremetal3" width="431" height="318"></a></p></li> 
 <li>Click Save again to commit the change.</li> 
</ol> 