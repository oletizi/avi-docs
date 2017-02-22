---
title: Deploy SEs in Different Data Centers from Controllers
layout: layout163
---
An oft asked question is whether Avi Controllers may be deployed in different data centers from their Avi Service Engines.  Asked another way, can Controllers manage SEs in multiple data centers?  There is no strict requirement that will prevent Controllers managing remote SEs.  However, it is important to understand the best practices and ensure the deployment will scale with resilience.

Avi recommends Controllers and Service Engines have no more than a 40-ms latency separation.  Numerous tasks require connectivity, such as SE deployment (copying the SE image), log and metric collection, config propagation, and state backup (such as persistence tables).  Increased latency may impact these operations and cause potential failures for data plane traffic.

For latency greater than 40 ms, Avi recommends deploying a unique Controller cluster in each data center.

If the latency is low enough, and the intent is to have the Controllers manage SEs in two or more data centers, redundant Controllers are recommended to be congregated in one data center.  Should connectivity to the remote data center be lost, those SEs will run headless and not be able to receive configuration updates, but otherwise will continue to operate until connectivity is restored.
