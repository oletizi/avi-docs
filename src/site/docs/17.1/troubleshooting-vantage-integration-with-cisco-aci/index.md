---
title: Troubleshooting Avi Vantage Integration with Cisco ACI
layout: layout171
---
This article provides troubleshooting tips for Avi Vantage integration with Cisco Application Policy Infrastructure Controller (APIC), using VMware vCenter as Cisco APIC’s Virtual Machine Manager (VMM).

Avi Vantage integration with Cisco ACI provides advanced load balancing capacity with high network automation.

<a href="img/apic-deploy1.png"><img class="alignnone size-full wp-image-3146" src="img/apic-deploy1.png" alt="apic-deploy1" width="415" height="345"></a>

Avi-APIC solution troubleshooting can be classified into the following areas:

* Issues related to the device package
* Tenant mapping issues across APIC and Vantage
* Issues related to APIC graph instances 

## Issues Related to the Device Package

Once the Vantage user configures the Avi Controller with Cisco ACI and vCenter, the user should be able to see the automatically uploaded device package.

<img class="alignnone size-full wp-image-6353" src="img/apic-troubleshoot1.png" alt="apic-troubleshoot1" width="575" height="303">
<ol> 
 <li>Ensure the device package is uploaded correctly under the L4-L7 package list.</li> 
 <li>Make sure the deployment string in the left pane is correct. The deployment string should be in this format:Avi_<em>Deployment</em>-ASP.1.0In the following example, the deployment string is “Avi_CLive-ASP.1.0”, where "CLive" was configured during Avi Controller initialization.</li> 
</ol> 

## Tenant mapping issues across APIC and Vantage

The Controller inherits tenancy from APIC. The Controller is initialized with one of the tenants in APIC. The Vantage user can then export L4-L7 devices from the initial tenant to other tenants. The Controller only maps a tenant where the device package is registered or exported.

For example:
<ol> 
 <li>The Controller is configured within a Democommon tenant during initial setup. The Controller can be traced under Tenants &gt; “DemoCommon” &gt; L4-L7 Services &gt; L4-L7 Devices &gt; Avi_<em>random-number</em>.<img class="alignnone size-full wp-image-6356" src="img/apic-troubleshoot2.png" alt="apic-troubleshoot2" width="575" height="307"></li> 
 <li>The Controller web interface then automatically maps corresponding APIC tenant.<img class="alignnone size-full wp-image-6357" src="img/apic-troubleshoot3.png" alt="apic-troubleshoot3" width="575" height="315"></li> 
 <li>For example, if the user exports the Avi device from the “DemoCommon” tenant to the “Demo” tenant, the Controller web interface will automatically map the “Demo” tenant from APIC.<img class="alignnone size-full wp-image-6359" src="img/apic-troubleshoot4.png" alt="apic-troubleshoot4" width="576" height="303"></li> 
</ol> > Note: When Device import is removed from APIC, the tenant still remains in Vantage. The tenant is removed from Vantage when the tenant is deleted from APIC.
 

## Issues Related to APIC Graph Instance

Vantage requires a 2-node graph to perform scaleout or to autoscale load-balancing capacity. The 2-node Service Graph within APIC looks the same as shown below:

<img class="alignnone size-full wp-image-6360" src="img/apic-troubleshoot5.png" alt="apic-troubleshoot5" width="612" height="323">

Once the Vantage user assigns the Vantage Service Graph to the contract, the Controller communicates with APIC to populate "L4-L7 Devices” >“Deployed Graph Instances”. If this field is not populated:
<ol> 
 <li>Expand “L4-L7 Services” &gt; “L4-L7 Service Graph Templates” &gt; “Avi Service Graph” &gt; “Function Node 1”. (See figure above.)a. External node of Node 1 should be mapped to the “ADCTier1/external” meta-connector.<img class="alignnone size-full wp-image-6361" src="img/apic-troubleshoot6.png" alt="apic-troubleshoot6" width="546" height="385"> <p>b. Internal node of Node 1 should be mapped to the “ADCTier1/intermediate” meta-connector.</p> <p><img class="alignnone size-full wp-image-6362" src="img/apic-troubleshoot7.png" alt="apic-troubleshoot7" width="506" height="348"></p></li> 
 <li>Expand “L4-L7 Services” &gt; “L4-L7 Service Graph Templates” &gt; “Avi Service Graph” &gt; “Function Node 2”.a. External node of Node 2 should be mapped to the “ADCTier2/intermediate” meta-connector.<img class="alignnone size-full wp-image-6363" src="img/apic-troubleshoot8.png" alt="apic-troubleshoot8" width="496" height="372"> <p>b. External node of Node 2 should be mapped to the “ADCTier1/internal” meta-connector.</p> <p><img class="alignnone size-full wp-image-6364" src="img/apic-troubleshoot9.png" alt="apic-troubleshoot9" width="476" height="360"></p></li> 
</ol> 