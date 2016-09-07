---
title: Metrics Retention Period
layout: default
---
At regular intervals, Avi Service Engines collect values for a <a href="/metrics-list/">wide range of metrics</a> and sends them to the Avi Controller. The Controller then aggregates these metric values into several buckets.

The frequency of metrics collection is determine by the setting with a virtual service's analytics setting. This may be as infrequent as every five minutes, or as frequent as every 5 seconds. If a DDoS event is detected by an SE, the SE immediately sends information about the attack to the Controller, instead of locally storing the data until the next polling interval.

The following table lists the increments in which metrics data can be displayed in the web interface. The data granularity per increment and the retention period also are listed.
Metric Increments  Data Granularity  Retention Period Real time/*    5 seconds      1 hour Past 6 hours    5 minutes      1 day Past day    5 minutes      1 day Past week    1 per hour      1 week Past Month    1 per day      1 year Past quarter    1 per day      1 year Past year    1 per day      1 per year

 

/* Real-time metrics are enabled by default for the first 60 minutes of a virtual service's life. After these initial 60 minutes, real-time metrics are disabled to conserve resources. Real-time metrics can be re-enabled manually at any time.