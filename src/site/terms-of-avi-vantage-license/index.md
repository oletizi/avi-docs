---
title: Terms of Avi Vantage Software License
layout: default
---
Avi Vantage software must be licensed. A free trial license is available for evaluating the product. To deploy Avi Vantage into an enterprise cloud, an enterprise license is recommended.

Avi Vantage licenses are subscription based, and have a start date and an expiration date. Each licence applies to a specific infrastructure type, and more than one license can be added to the Avi Controller. For example, an Avi Controller that will be used in both a VMware vCenter cloud and in a Mesos cloud will need a separate license for each one.

**Note: For information about procuring, installing, and managing a license, <a href="/avi-vantage-license-management/">click here</a>.**
Infrastructure (Cloud) Type Licensed By Description VMware
OpenStack
AWS
Nutanix Acropolis Service Engine (SE) vCPUs Defines the maximum number of vCPUs (cores) that can be used across all SEs in these cloud types. Individual SEs can vary in terms of the number of vCPUs each individual SE has, so long as the total number of vCPUs consumed by all SEs does not exceed the number of vCPUs allowed in the license file. SE vCPU allocation is configured in the SE group.

* For example, a 10-vCPU license allows up to 10 1-vCPU SEs, or 5 2-vCPU SEs, or a mix of 4 1-vCPU SEs and 3 2-vCPU SEs (across 2 SE groups), and so on.

**Per-app SE mode:** If an SE group is configured in per-app SE mode, a vCPU counts at 25% rate for licensing usage. For example, a 2-vCPU SE in the per-app SE group utilizes 0.5 vCPU license (2 /* 0.25). Per-app SE mode is limited to a maximum of 2 virtual services per SE. This mode is suitable for deployments with dedicated per-application load balancers. This mode is available with Avi Vantage software version 16.2 and later. Linux server SE sockets Defines the maximum number of sockets Avi SEs can be deployed on.

Note: Alternatively, SE vCPU-based licensing can be used instead of SE socket-based licensing for a Linux server cloud. Mesos Hosts in Cluster Defines the maximum number of hosts on which SE instances that can be deployed.

One SE instance is installed on each host within the Mesos cluster.

## Trial License Terms

A free trial license is already installed in the product when it is downloaded from the Avi Networks website. The trial license supports all features supported by an enterprise license. The following table describes the trial license limits and terms:
Infrastructure (Cloud) Type Licensed By Limits VMware
OpenStack
AWS
Nutanix Acropolis SE vCPUs First 6 months: 20 vCPUs

After 6 months: 2 vCPUs (free perpetual limit) Linux server SE sockets First 6 months: 4 sockets

After 6 months: 0 sockets

  Mesos Hosts in Cluster First 6 months: 200 hosts and 200 virtual services

After 6 months: 20 hosts and 20 virtual services (free perpetual limit)