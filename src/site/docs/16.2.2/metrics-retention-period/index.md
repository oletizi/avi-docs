---
title: Metrics Retention Period
layout: default
---
At regular intervals, Avi Service Engines collect values for a <a href="/docs/latest/metrics-list">wide range of metrics</a> and sends them to the Avi Controller. The Controller then aggregates these metric values into several buckets.

The frequency of metrics collection is determine by the setting with a virtual service's analytics setting. This may be as infrequent as every five minutes, or as frequent as every 5 seconds. If a DDoS event is detected by an SE, the SE immediately sends information about the attack to the Controller, instead of locally storing the data until the next polling interval.

The following table lists the increments in which metrics data can be displayed in the web interface. The data granularity per increment and the retention period also are listed.
<table class="myTable table table-bordered table-hover">  
<tbody>         
<tr>    
<th>Metric Increments
</th>
<th> Data Granularity
</th>
<th> Retention Period
</th>
</tr>
<tr>    
<td>Real time*</td>
<td>   5 seconds</td>
<td>     1 hour</td>
</tr>
<tr>    
<td>Past 6 hours</td>
<td>   5 minutes</td>
<td>     1 day</td>
</tr>
<tr>    
<td>Past day</td>
<td>   5 minutes</td>
<td>     1 day</td>
</tr>
<tr>    
<td>Past week</td>
<td>   1 per hour</td>
<td>     1 week</td>
</tr>
<tr>    
<td>Past Month</td>
<td>   1 per day</td>
<td>     1 year</td>
</tr>
<tr>    
<td>Past quarter</td>
<td>   1 per day</td>
<td>     1 year</td>
</tr>
<tr>    
<td>Past year</td>
<td>   1 per day</td>
<td>     1 per year</td>
</tr>
</tbody>
</table>  

 

/* Real-time metrics are enabled by default for the first 60 minutes of a virtual service's life. After these initial 60 minutes, real-time metrics are disabled to conserve resources. Real-time metrics can be re-enabled manually at any time.
