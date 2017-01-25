---
title: Anti-affinity for Service Engine Placement
layout: 16.3
---
When Service Engines (SEs) are deployed in a cloud with write access mode, it is important to ensure that the SEs are deployed on different server hosts. If all SEs are created on a single host and that host fails, there is no high availability or immediate failover.

This logic—ensuring that SEs are dispersed across the best hosts based on capacity and reachability—is referred to as anti-affinity. For any environment where the Avi Controller does not have write access mode to the cloud orchestrator, anti-affinity is a manual process. In other words, it is up to the administrator to deploy new SEs to unique server hosts.

## OpenStack

In an OpenStack deployment, anti-affinity decisions are made by OpenStack, not the Avi Controller. SEs within an SE group are distributed across OpenStack’s anti-affinity server group within Nova. This is a Nova scheduler policy that may be modified using *ServerGroupAntiAffinityFilter*.

Example: If three hosts exist, the first three SEs will be created one per host. If a fourth SE needs to be created, the anti- affinity condition is considered to have been met and will not be a consideration for additional SEs.

## VMware vCenter

vCenter has no concept of anti-affinity, so the task is handled by the Avi Controller. Anti-affinity is dependent on the high availability and scale-out settings for the SE group the virtual service is in.

If the SE group is set to one of the following high availability modes, the Controller will create the SEs on different ESX hosts:

* Active/Active
* Active/Standby
* Dedicated 

If a virtual service is scaled out across multiple SEs, anti-affinity will be taken into account to determine which SEs to utilize.

SE placement onto specific ESX hosts can be specified using the Infrastructure > Cloud > SE Group > Advanced tab. This page includes options to specifically include or exclude ESX hosts or VMware clusters.

The same option can also be used to ensure each SE is created on a specific and unique host. If only one host is configured in the include list, all new SEs must be created on that host, which nullifies the effect of anti-affinity.

## Mesos

In a Mesos/Marathon environment where Avi SEs are used for east-west traffic, an SE is placed on each host, load balancing traffic from a client, rather than traffic to a server. For this reason, anti-affinity is not applicable.

## Amazon Web Services

No specific anti-affinity logic is currently employed. The recommended best practice is to ensure that multiple availability zones (AZs) are configured, with SEs deployed in each AZ.
