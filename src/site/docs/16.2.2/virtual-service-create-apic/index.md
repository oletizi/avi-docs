---
title: Virtual Service Creation&#58; APIC
layout: default
---
This article describes how to create a virtual service for an APIC cloud:

1. Create a contract and apply a Service Graph.
1. Create a load-balancing virtual service using Vantage.

Detailed steps are provided below.

## Create Contract and Apply Service Graph

1. Select the tenant where Controller was deployed.
1. Navigate to Security Policies > Contracts (left pane).
1. Click Actions and select Create Contract from the drop-down menu.
1. Provide the following information:

* Name for the contract
* Subject with filters
* Graph template created previously
* Associate the contract with a consumer EPG and a provider EPG. The provider EPG must contain servers to load balance.

<a href="img/vs-create-apic1.png"><img src="img/vs-create-apic1.png" alt="vs-create-apic1" width="691" height="328"></a>

## Configure Load-balancing Virtual Service Using Vantage

Create a virtual service in the tenant where the Vantage device package is deployed, or in a tenant to which the device package was exported.

1. Click admin (top right corner) and select a tenant.
1. Navigate to Applications > Dashboard.
1. Select the cloud and click New.
1. Enter a user-friendly virtual service name.
1. Enter an IP address or DNS hostname for the virtual service.
1. On the New Virtual Service edit menu, select a graph instance in the Name field (**:**).
1. Check EPG on the Select Server menu.
1. Select an EPG for the servers to be load balanced from the APIC EPG drop-down list.
1. Click Save.

Note: It can take up to 3 minutes until the virtual service becomes online. This is because a new concrete device needs to be added.

<a href="img/vs-create-apic2.png"><img src="img/vs-create-apic2.png" alt="vs-create-apic2" width="528" height="197" vspace="60"></a>

Clicking New Virtual Service (or Create Virtual Service) opens the configuration wizard for the service.

<a href="img/vs-create-apic3.png"><img src="img/vs-create-apic3.png" alt="vs-create-apic3" width="528" height="415" vspace="12"></a>