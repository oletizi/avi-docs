---
title: Avi Controller Sizing
layout: default
---
During deployment of an Avi Controller, the system capacity of the Avi Controller can be specified based on allocations of the following system resources:

* CPUs
* Memory (RAM)
* Drive

The amount of these resources that are allocated to an Avi Controller have a direct impact on the Avi Controller's performance.

The following table lists recommended allocations for each type of deployment:
Deployment Type Node Count Recommended Allocations CPU Memory Drive Demo / Customer Eval 1 8 24 GB 64 GB Production 3 See the following:
<a href="#cpuandmemalloc">CPU/Memory Allocation</a>
<a href="#drivealloc">Drive Allocation</a>

In demo(nstration) and customer evaluation deployments, a single Avi Controller is adequate and is used for all control plane activities and workflows, as well as anaytics.

In a production deployment, a 3-node cluster is recommended. In a 3-node Avi Controller cluster, 1 Avi Controller is the leader Avi Controller used for control plane activities and workflows. The other 2 Avi Controllers are followers. The follower Avi Controller nodes are used for analytics, and also provide backups for the leader Avi Controller.

The following sections provide specific allocation recommendations. The recommendations are designed to fit most use cases but of course might not fit every conceivable deployment scenario.

<a name="cpuandmemalloc"></a>

## CPU / Memory Allocations

Vantage uses the allocations of CPU and memory as follows:
CPU/Memory Allocation 8 CPUs / 24 GB 16 CPUs / 32 GB 24 CPUs / 48 GB Base processes 15 GB 20 GB 24 GB Log analytics 9 GB 13 GB 24 GB Virtual Service Scale 0-200 200-1000 1000-5000 Avi Service Engine (SE) Scale 0-100 100-200 200-250

The Avi Controller's base processes include dynamic processes and metrics collection and processing. The allocations shown here are based on assumptions of no more than 10 percent drive swapping and 25 percent drive margin.

<a name="drivealloc"></a>

## Drive Allocation

The amount of drive to allocate to an Avi Controller can be calculated based either on the amount of drive available or the number of virtual services to support. The following tables show recommended allocations based on each approach.

### Drive Allocation based on Available Drive

The drive space allocated to an Avi Controller that is not used for base processes or analytics is used as follows:

* Logs: 70 percent of drive not used for base processes or analytics
* Metrics: the other 30 percent not used for base processes or analytics
Drive Allocation based on Drive Space 128 GB 256 GB 512 GB 1 TB Log analytics (70%) 56 GB 144 GB 328 GB 672 GB Metrics (30%) 24 GB 64 GB 128 GB 288 GB Base Processes 48 GB 48 GB 56 GB 64 GB

Drive quality impacts analytics performance and size:

* Traffic logs are deleted as the drive fills up.
* Metrics tables are deleted based on the archival scheme:

* Realtime: deleted after 1 hour
* 5-minute intervals: deleted after 1 day
* 1-hour intervals: deleted after 1 week
* 1-day intervals: deleted after 1 year

If the drive fills up, then current metrics tables are deleted to make room for new data.

### Drive Allocation based on Number of Virtual Services to Support

Drive Allocation based on Virtual Services Log analytics
without full logs Log analytics
with full logs Metrics Base processes Total (without full logs) 100 VS 16 GB 128 GB 16 GB 48 GB 80 GB 1,000 VS
(100K transactions / year) 128 GB 1 TB 32 GB 56 GB 216 GB 5,000 VS 512 GB Not Sptd 160 GB 64 GB 736 GB

## Assumptions and Sizing Data

The size recommendations shown in the table are based on the following operational assumptions:

* Total traffic is no more than about 100 K transactions per year.
* DDoS attacks are less than 1 percent of the traffic.
* Significant logs are no more than 10 percent of total logs. (This means 90 percent of the transactions are good and result only in non-significant logs.)
* Log analytics require about 1 KB drive per logs.
* Metrics and other analytics processing requires about 32 MB per virtual service. Client insights require additional drive.

Note: A transaction is a single TCP or UDP connection (layer 4), or a single request-response exchange (layer 7). Traffic volume of 100 K transactions per year is probably low for an ecommerce site but is applicable to most other types of applications.