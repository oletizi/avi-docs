---
title: Avi Controller Sizing
layout: layout163
---
During deployment of an Avi Controller, the system capacity of the Avi Controller can be specified based on allocations of the following system resources:

* CPUs
* Memory (RAM)
* Disk 

The amount of these resources allocated to an Avi Controller have a direct impact on its performance.

The following table lists recommended allocations for each type of deployment:

<table class="table table-bordered table-hover table table-bordered table-hover">   
<thead>   
<tr>    
<th rowspan="2">Deployment Type
</th>
<th rowspan="2">Node Count
</th>
<th colspan="3">Recommended Allocations
</th>
</tr>
<tr>    
<th>CPU
</th>
<th>Memory
</th>
<th>Disk
</th>
</tr>
</thead>
<tbody>   
<tr>      
<td>Demo / Customer Eval</td>
<td>1</td>
<td>8</td>
<td>24 GB</td>
<td>64 GB</td>
</tr>
<tr>    
<td>Production</td>
<td>3</td>
<td colspan="3">See the following:<br> <a href="#cpuandmemalloc">CPU/Memory Allocation</a><br> <a href="#drivealloc">Drive Allocation</a></td>
</tr>
</tbody>
</table> 

In demo(nstration) and customer evaluation deployments, a single Avi Controller is adequate and is used for all control-plane activities and workflows, as well as analytics.

In a production deployment, a 3-node cluster is recommended. In a 3-node Avi Controller cluster, 1 Avi Controller is designed as the leader Avi Controller and is used for control-plane activities and workflows. The other 2 Avi Controllers are followers. The follower Avi Controller nodes are used for analytics, and also provide backup in case the leader Avi Controller fails.

The following sections provide specific allocation recommendations. The recommendations are designed to fit most use cases, but might not fit every conceivable deployment scenario.

<a name="cpuandmemalloc"></a>

## CPU / Memory Allocations

Avi Vantage uses the allocations of CPU and memory as follows:

<table class="table table-bordered table-hover table table-bordered table-hover">   
<thead>  
<tr>     
<th>CPU/Memory Allocation
</th>
<th>8 CPUs / 24 GB
</th>
<th>16 CPUs / 32 GB
</th>
<th>24 CPUs / 48 GB
</th>
</tr>
</thead>
<tbody>     
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

The Avi Controller's base processes include dynamic processes and metrics collection and processing. The allocations shown here are based on assumptions of no more than 10 percent disk swapping and 25 percent disk margin.

<a name="drivealloc"></a>

## Disk Capacity Allocation

The amount of disk capacity to allocate to an Avi Controller can be calculated based either on the amount of disk capacity available or the number of virtual services to support. The following tables show recommended allocations based on each approach.

### Disk Allocation Based on Available Disk Capacity

The disk space allocated to an Avi Controller that is not used for base processes or analytics is used as follows:

* Logs: 70 percent of the disk is not used for base processes or analytics
* Metrics: the other 30 percent is not used for base processes or analytics 
<table class="table table-bordered table-hover table table-bordered table-hover">   
<thead>  
<tr>      
<th>Disk Allocation based on Disk Space
</th>
<th>128 GB
</th>
<th>256 GB
</th>
<th>512 GB
</th>
<th>1 TB
</th>
</tr>
</thead>
<tbody>    
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

Disk drive quality impacts analytics performance and size:

* Traffic logs are deleted as the disk drive fills up.
* Metrics tables are deleted based on the archival scheme:  
    * Realtime: deleted after 1 hour
    * 5-minute intervals: deleted after 1 day
    * 1-hour intervals: deleted after 1 week
    * 1-day intervals: deleted after 1 year 

If the drive fills up, then current metrics tables are deleted to make room for new data.

### Disk Allocation Based on Number of Virtual Services

<table class="table table-bordered table-hover table table-bordered table-hover">   
<thead>  
<tr>       
<th>Disk allocation based on VS count

</th>
<th>Log analytics without full logs

</th>
<th>Log analytics with full logs

</th>
<th>Metrics
</th>
<th>Base processes
</th>
<th>Total (without full logs)
</th>
</tr>
</thead>
<tbody>    
<tr>       
<td>100 VS</td>
<td>16 GB</td>
<td>128 GB</td>
<td>16 GB</td>
<td>48 GB</td>
<td>80 GB</td>
</tr>
<tr>       
<td>1,000 VS<br> (100k transactions / year)</td>
<td>128 GB</td>
<td>1 TB</td>
<td>32 GB</td>
<td>56 GB</td>
<td>216 GB</td>
</tr>
<tr>       
<td>5,000 VS</td>
<td>512 GB</td>
<td>Not sptd</td>
<td>160 GB</td>
<td>64 GB</td>
<td>736 GB</td>
</tr>
</tbody>
</table> 

## Assumptions and Sizing Data

The size recommendations shown in the table are based on the following operational assumptions:

* DDoS attacks are less than 1 percent of the traffic.
* Significant logs are no more than 10 percent of total logs. (This means 90 percent of the transactions are good and result only in non-significant logs.)
* Log analytics require about 10 kB disk space per log entry, i.e., 10 GB of disk space for 1 million log entries.
* Metrics and other analytics processing requires about 32 MB per virtual service. Client insights require additional drive capacity. 

Note: A transaction is a single TCP or UDP connection (layer 4), or a single request-response exchange (layer 7). Traffic volume of 100,000 transactions per year is probably low for an e-commerce site but is applicable to most other types of applications.

