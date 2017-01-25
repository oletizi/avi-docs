---
title: Why Real-Time Metrics Updates Slow Down After Deployment
layout: layout163
---
### The Issue

<img class="size-full wp-image-234 alignright" src="img/Display.png" alt="Display" width="199" height="35">

Within an object such as a Service Engine (SE), virtual service, pool, or server, the display time pull-down menu allows for displaying metrics in real time. However, the graphs may update only every few minutes, resulting in five-minute blocks of averaged data.  

<pre><a href="img/Metrics2.png"><img class="alignnone size-full wp-image-236" src="img/Metrics2.png" alt="Metrics2" width="600" height="224">
</a>Table 1: Metrics Real Time <strong>disabled</strong></pre> 

### The Reason

When a new virtual service is first created, the update frequency for analytics metrics data is set to capture metrics aggressively for the first 60 minutes.  

After the first 60 minutes, the aggressive metrics capture expires and the SEs report metrics less frequently, in 5-minute intervals. This method enables richer troubleshooting data during the initial testing of the new application deployment. After an application is successfully deployed, analytics for the application might not be viewed again for days, months, or perhaps ever. With larger deployments incorporating potentially hundreds or thousands of applications, Vantage attempts to reduce noise and conserve resources on the Controllers by capturing data less aggressively when not required.

### The Solution

<img class="size-full wp-image-235 alignright" src="img/Metrics1.png" alt="Metrics1" width="280" height="64">

For high priority applications or ones that require more detailed data, edit the virtual service and navigate to the Analytics tab. Check (enable) Metrics Update Frequency and set the time to 0 (unlimited). This will permanently enable capture of real-time metrics for the application. If a time other than 0 is specified, metrics collection reverts to the less aggressive interval upon expiration of the timer.

<a href="img/Metrics3.png"><img class="alignnone size-full wp-image-237" src="img/Metrics3.png" alt="Metrics3" width="600" height="224"> </a>Table 2: Metrics Real Time **enabled**  
