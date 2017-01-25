---
title: API&#58; Determine Virtual Service Throughput
layout: layout171
---
You can use the Avi Vantage API to access throughput data and other metrics for a virtual service. API calls to /API/analytics/metrics can be used to get all metric-related data. The following example shows a query for the throughput of a virtual service for a 24-hour period:

<pre>https://&lt;Controller VIP&gt;/api/analytics/metrics/virtualservice/virtualservice-&lt;VS UUID&gt;?metric_id=l4_client.avg_bandwidth &amp;step=86400&amp;limit=7&amp;start=2015-11-17T00:00:00.000Z</pre> 
* **Controller VIP**:  Replace with the IP address of your Avi Controller or the cluster IP address assigned to the cluster of redundant Avi Controllers. 
* **VS UUID**:  Universally Unique ID (UUID) of the virtual service. Since virtual service names may not be unique across multiple tenants, API queries are recommended to include the virtual service's UUID.  

A quick way to find a virtual service's UUID is to view the virtual service in the Avi Controller's web interface, and capture the UUID from the browser URI.  (See the following link to <a href="/docs/17.1/find-virtual-service-uuid/">find virtual service UUIDs</a>.)

**step**:  Sampling period, in seconds. (For 24 hours, use sampling time 86400.)

**limit**:  Maximum number of data points, in days, that will be returned. In this example, 7 data points are returned. Each data point is an average of that day's client-to-virtual service network throughput.

**start**:  Start time for the query. In this example, the query starts on October 17 and ends after one 7 days, on October 23. Likewise, if the starting point is set to 2, then only two data points are returned (one for each of the 2 days).

**metric_id**: Metric to be queried. Here are the metric IDs for some commonly queried metrics: /* l4_client.avg_total_rtt /* l4_server.avg_total_rtt /* l4_client.avg_bandwidth /* l4_client.max_open_conns /* l4_client.avg_complete_conns /* l4_client.avg_lossy_connections /* l4_client.avg_errored_connections /* l4_client.pct_connection_errors /* l7_client.avg_complete_responses /* l7_server.avg_resp_4xx_errors /* l7_server.avg_resp_5xx_errors /* l7_client.avg_resp_4xx_avi_errors /* l7_client.avg_resp_5xx_avi_errors /* l7_client.pct_response_errors /* l7_server.avg_application_response_time /* l7_client.avg_client_data_transfer_time

Here is an example of the data returned by the Avi Controller in response to an API query for l4_client.avg_bandwidth:

<pre><code class="language-lua">{
"entity_uuid": "virtualservice-9062c630-a835-4c22-8596-dfa625b9697d", 
"limit": 365, 
"metric_entity": "VSERVER_METRICS_ENTITY", 
"metric_id": "l4_client.avg_bandwidth", 
"series": [
{
"data": [
{
"timestamp": "2015-11-17T00:00:00+00:00", 
"value": 511500369.582942
}, 
{
"timestamp": "2015-11-18T00:00:00+00:00", 
"value": 641335291.443974
}, 
{
"timestamp": "2015-11-19T00:00:00+00:00", 
"value": 642964876.307424
}, 
{
"timestamp": "2015-11-20T00:00:00+00:00", 
"value": 652721668.799788
}, 
{
"timestamp": "2015-11-21T00:00:00+00:00", 
"value": 833373106.654519
}, 
{
"timestamp": "2015-11-22T00:00:00+00:00", 
"value": 670429050.977858
}, 
{
"timestamp": "2015-11-23T00:00:00+00:00", 
"value": 671784391.196803
}, 
], 
"header": {
"derivation_data": {
"derivation_fn": "SUM_BW_GAUGE", 
"metric_ids": "avg_rx_bytes, avg_tx_bytes"
}, 
"entity_uuid": "virtualservice-9062c630-a835-4c22-8596-dfa625b9697d", 
"metric_description": "Average transmit and receive network bandwidth between client and virtual service.", 
"metrics_min_scale": 1000000.0, 
"metrics_sum_agg_invalid": false, 
"name": "l4_client.avg_bandwidth", 
"obj_id_type": "METRICS_OBJ_ID_TYPE_VIRTUALSERVICE", 
"priority": true, 
"statistics": {
"max": 833373106.654519, 
"max_ts": "2015-11-21T00:00:00+00:00", 
"mean": 663407846.526, 
"min": 511500369.582942, 
"min_ts": "2015-11-17T00:00:00+00:00", 
"num_samples": 7, 
"trend": -0.029
}, 
"tenant_uuid": "admin", 
"units": "BITS_PER_SECOND"
}
}
], 
"start": "2015-11-17T00:00:00.000Z", 
"step": 86400, 
"stop": "2015-11-23T00:00:00+00:00"
}</code></pre>  