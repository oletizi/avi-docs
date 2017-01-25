---
title: Virtual Service Creation&#58; APIC
layout: 16.3
---
This article describes how to create a virtual service for an APIC cloud:
<ol> 
 <li> <p>Create a contract and apply a Service Graph.</p> </li> 
 <li> <p>Create a load-balancing virtual service using Vantage.</p> </li> 
</ol> 

Detailed steps are provided below.

## Create Contract and Apply Service Graph

<ol> 
 <li> <p>Select the tenant where Controller was deployed.</p> </li> 
 <li> <p>Navigate to Security Policies &gt; Contracts (left pane).</p> </li> 
 <li> <p>Click Actions and select Create Contract from the drop-down menu.</p> </li> 
 <li> <p>Provide the following information:</p> 
  <ul> 
   <li>Name for the contract</li> 
   <li>Subject with filters</li> 
   <li>Graph template created previously</li> 
  </ul> </li> 
 <li> <p>Associate the contract with a consumer EPG and a provider EPG. The provider EPG must contain servers to load balance.</p> </li> 
</ol> 

<a href="img/vs-create-apic1.png"><img src="img/vs-create-apic1.png" alt="vs-create-apic1" width="691" height="328" class="alignnone size-full wp-image-3923"></a>

## Configure Load-balancing Virtual Service Using Vantage

Create a virtual service in the tenant where the Vantage device package is deployed, or in a tenant to which the device package was exported.
<ol> 
 <li> <p>Click admin (top right corner) and select a tenant.</p> </li> 
 <li> <p>Navigate to Applications &gt; Dashboard.</p> </li> 
 <li> <p>Select the cloud and click New.</p> </li> 
 <li> <p>Enter a user-friendly virtual service name.</p> </li> 
 <li> <p>Enter an IP address or DNS hostname for the virtual service.</p> </li> 
 <li> <p>On the New Virtual Service edit menu, select a graph instance in the Name field (<em> 
    <contract name></contract></em>:<em> 
    <graph name></graph></em>).</p> </li> 
 <li> <p>Check EPG on the Select Server menu.</p> </li> 
 <li> <p>Select an EPG for the servers to be load balanced from the APIC EPG drop-down list.</p> </li> 
 <li> <p>Click Save.</p> </li> 
</ol> 

Note: It can take up to 3 minutes until the virtual service becomes online. This is because a new concrete device needs to be added.

<a href="img/vs-create-apic2.png"><img src="img/vs-create-apic2.png" alt="vs-create-apic2" width="528" height="197" vspace="60" class="alignnone size-full wp-image-3924"></a>

Clicking New Virtual Service (or Create Virtual Service) opens the configuration wizard for the service.

<a href="img/vs-create-apic3.png"><img src="img/vs-create-apic3.png" alt="vs-create-apic3" width="528" height="415" vspace="12" class="alignnone size-medium wp-image-3925"></a>
