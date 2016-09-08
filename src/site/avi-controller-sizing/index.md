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
<table class="table"> 
 <tbody> 
  <tr> 
   <th rowspan="2" width="60%">Deployment Type</th> 
   <th rowspan="2">Node Count</th> 
   <th colspan="3">Recommended Allocations</th> 
  </tr> 
  <tr> 
   <th>CPU</th> 
   <th>Memory</th> 
   <th>Drive</th> 
  </tr> 
  <tr> 
   <td>Demo / Customer Eval</td> 
   <td>1</td> 
   <td>8</td> 
   <td>24 GB</td> 
   <td>64&nbsp;GB</td> 
  </tr> 
  <tr> 
   <td>Production</td> 
   <td>3</td> 
   <td colspan="3">See the following:<br> <a href="#cpuandmemalloc">CPU/Memory Allocation</a><br> <a href="#drivealloc">Drive Allocation</a></td> 
  </tr> 
 </tbody> 
</table>

In demo(nstration) and customer evaluation deployments, a single Avi Controller is adequate and is used for all control plane activities and workflows, as well as anaytics.

In a production deployment, a 3-node cluster is recommended. In a 3-node Avi Controller cluster, 1 Avi Controller is the leader Avi Controller used for control plane activities and workflows. The other 2 Avi Controllers are followers. The follower Avi Controller nodes are used for analytics, and also provide backups for the leader Avi Controller.

The following sections provide specific allocation recommendations. The recommendations are designed to fit most use cases but of course might not fit every conceivable deployment scenario.

<a name="cpuandmemalloc"></a>

## CPU / Memory Allocations

Vantage uses the allocations of CPU and memory as follows:
<table class="table"> 
 <tbody> 
  <tr> 
   <th width="60%">CPU/Memory Allocation</th> 
   <th>8 CPUs / 24 GB</th> 
   <th>16 CPUs / 32 GB</th> 
   <th>24 CPUs / 48 GB</th> 
  </tr> 
  <tr> 
   <td>Base processes</td> 
   <td>15 GB</td> 
   <td>20 GB</td> 
   <td>24 GB</td> 
  </tr> 
  <tr> 
   <td>Log analytics</td> 
   <td>9 GB</td> 
   <td>13 GB</td> 
   <td>24 GB</td> 
  </tr> 
  <tr> 
   <td>Virtual Service Scale</td> 
   <td>0-200</td> 
   <td>200-1000</td> 
   <td>1000-5000</td> 
  </tr> 
  <tr> 
   <td>Avi Service Engine (SE) Scale</td> 
   <td>0-100</td> 
   <td>100-200</td> 
   <td>200-250</td> 
  </tr> 
 </tbody> 
</table>

The Avi Controller's base processes include dynamic processes and metrics collection and processing. The allocations shown here are based on assumptions of no more than 10 percent drive swapping and 25 percent drive margin.

<a name="drivealloc"></a>

## Drive Allocation

The amount of drive to allocate to an Avi Controller can be calculated based either on the amount of drive available or the number of virtual services to support. The following tables show recommended allocations based on each approach.

### Drive Allocation based on Available Drive

The drive space allocated to an Avi Controller that is not used for base processes or analytics is used as follows:

* Logs: 70 percent of drive not used for base processes or analytics
* Metrics: the other 30 percent not used for base processes or analytics
<table class="table"> 
 <tbody> 
  <tr> 
   <th width="60%">Drive Allocation based on Drive Space</th> 
   <th>128 GB</th> 
   <th>256 GB</th> 
   <th>512 GB</th> 
   <th>1 TB</th> 
  </tr> 
  <tr> 
   <td>Log analytics (70%)</td> 
   <td>56 GB</td> 
   <td>144 GB</td> 
   <td>328 GB</td> 
   <td>672 GB</td> 
  </tr> 
  <tr> 
   <td>Metrics (30%)</td> 
   <td>24 GB</td> 
   <td>64 GB</td> 
   <td>128 GB</td> 
   <td>288 GB</td> 
  </tr> 
  <tr> 
   <td>Base Processes</td> 
   <td>48 GB</td> 
   <td>48 GB</td> 
   <td>56 GB</td> 
   <td>64 GB</td> 
  </tr> 
 </tbody> 
</table>

Drive quality impacts analytics performance and size:

* Traffic logs are deleted as the drive fills up.
* Metrics tables are deleted based on the archival scheme:

* Realtime: deleted after 1 hour
* 5-minute intervals: deleted after 1 day
* 1-hour intervals: deleted after 1 week
* 1-day intervals: deleted after 1 year

If the drive fills up, then current metrics tables are deleted to make room for new data.

### Drive Allocation based on Number of Virtual Services to Support

<table class="table"> 
 <tbody> 
  <tr> 
   <th width="60%">Drive Allocation based on Virtual Services</th> 
   <th>Log analytics<br> without full logs</th> 
   <th>Log analytics<br> with full logs</th> 
   <th>Metrics</th> 
   <th>Base processes</th> 
   <th>Total (without full logs)</th> 
  </tr> 
  <tr> 
   <td>100 VS</td> 
   <td>16 GB</td> 
   <td>128 GB</td> 
   <td>16 GB</td> 
   <td>48 GB</td> 
   <td>80 GB</td> 
  </tr> 
  <tr> 
   <td>1,000 VS<br> (100K transactions / year)</td> 
   <td>128 GB</td> 
   <td>1 TB</td> 
   <td>32 GB</td> 
   <td>56 GB</td> 
   <td>216 GB</td> 
  </tr> 
  <tr> 
   <td>5,000 VS</td> 
   <td>512 GB</td> 
   <td>Not Sptd</td> 
   <td>160 GB</td> 
   <td>64 GB</td> 
   <td>736 GB</td> 
  </tr> 
 </tbody> 
</table>

## Assumptions and Sizing Data

The size recommendations shown in the table are based on the following operational assumptions:

* Total traffic is no more than about 100 K transactions per year.
* DDoS attacks are less than 1 percent of the traffic.
* Significant logs are no more than 10 percent of total logs. (This means 90 percent of the transactions are good and result only in non-significant logs.)
* Log analytics require about 1 KB drive per logs.
* Metrics and other analytics processing requires about 32 MB per virtual service. Client insights require additional drive.

Note: A transaction is a single TCP or UDP connection (layer 4), or a single request-response exchange (layer 7). Traffic volume of 100 K transactions per year is probably low for an ecommerce site but is applicable to most other types of applications.