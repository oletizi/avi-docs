---
title: Comparing Past and Present SE Group HA Modes
layout: default
---
This article maps Avi Vantage's pre-16.2 SE-group high availability modes to those supported thereafter.

Prior to 16.2, HA modes ranged from dedicated SEs to shared best effort, as depicted in figure 1.

<figure class="thumbnail wp-caption alignleft"> <a href="img/Screen-Shot-2016-08-01-at-10.38.11-AM.png"><img class="wp-image-11233" src="img/Screen-Shot-2016-08-01-at-10.38.11-AM.png" width="600" height="67"></a>  
<figcapture> Figure 1. SE group HA modes prior to Vantage release 16.2 
</figcapture>
</figure> 

Starting in Vantage 16.2, the High Availability Settings section of the SE Group editor offers three HA modes, as depicted in figure 2.

<figure class="thumbnail wp-caption alignnone"> <a href="img/Screen-Shot-2016-08-09-at-1.52.33-PM.png"><img class="wp-image-11432" src="img/Screen-Shot-2016-08-09-at-1.52.33-PM.png" width="600" height="121"></a>  
<figcapture> Figure 2. HA modes, as defined in Vantage 16.2 and thereafter 
</figcapture>
</figure> 

The below table shows the correspondence between the previous and 16.2 HA modes.

<figure class="thumbnail wp-caption alignnone"> <a href="img/Screen-Shot-2016-08-09-at-2.13.08-PM.png"><img class="wp-image-11433 size-full" src="img/Screen-Shot-2016-08-09-at-2.13.08-PM.png" width="504" height="211"></a>  
<figcapture> Table 1. HA mode correspondence 
</figcapture>
</figure> 

### Details

Pre-16.2 modes can be mimicked by choosing one of three modes and setting as many as seven options. [Note: Prior to 16.2, there was no equivalent to <a href="/legacy-ha-for-avi-service-engines/">legacy active/standby HA</a>.] Refer to table 2 for suggested settings of the fields labeled A-F in figure 3.

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/HA_modes_in_16.2.png"><img class="wp-image-11237" src="img/HA_modes_in_16.2.png" width="600" height="385"></a>  
<figcapture> Figure 3. Basic SE group options 
</figcapture>
</figure> 

 

<figure class="thumbnail wp-caption alignnone"> <a href="img/Screen-Shot-2016-08-09-at-2.37.50-PM.png"><img class="wp-image-11434" src="img/Screen-Shot-2016-08-09-at-2.37.50-PM.png" width="600" height="383"></a>  
<figcapture> Table 2. Settings found within the SE group editor 
</figcapture>
</figure> 

 

A variety of factors will affect the maximum number of SEs deployed in any one of the four modes, including:

* Native SE balancing versus BGP-based.
* Available resources. 

To mimic a "dedicated SE active/active" environment, the maximum SE count of the active/active group should be double maxVS, the maximum number of virtual services intended for the SE group.

