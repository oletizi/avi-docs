---
title: A/B Test Pool
layout: default
---
Vantage allows a secondary (B) pool to be added to a virtual service's primary (A) pool. In this case, both the A and B pools can receive traffic for the virtual service. Based on configuration, a specific percentage (0-100) of the virtual service's traffic is sent to the B pool instead of the A pool. The rest of the traffic is sent to the A pool.

The A/B pool feature, sometimes referred to as blue/green testing, provides a simple way to gradually transition a virtual service's traffic from one set of servers to another. For example, to test a major OS or application upgrade in a virtual service's primary pool (A), a second pool (B) running the upgraded version can be added to the primary pool. Then based on the configuration, a percentage (0-100) of the client-to-server traffic is sent to the B pool instead of the A pool.

To continue this example, if the upgrade is performing well, the Vantage user can increase the percentage of traffic sent to the B pool. Likewise, if the upgrade is unsuccessful or sub-optimal, the percentage to the B pool easily can be reduced again to test another upgrade.

To finish transitioning to the new pool following successful upgrade, the percentage can be adjusted to send 100 percent of the traffic to pool, which now makes pool B the production pool.

To perform the next upgrade, the process can be reversed. After upgrading pool A, the percentage of traffic sent to pool B can be reduced to test pool A. To complete the upgrade, the percentage of traffic to pool B can be reduced back to 0.

### Operational Notes

* Setting the A/B percentage to 0 sends all traffic to the primary pool (A). 
* For each of the pools, normal load balancing is performed. After Vantage selects a pool for a new session, the load balancing method configured for that pool is used to select a server. 
* The A/B setting does not affect existing sessions. For example, setting the percentage sent to B to 100 percent does not cause existing sessions on pool A to move to B. Likewise, A/B pool settings do not affect persistence configurations. 
* The <a href="/docs/configuration-guide/applications/pools#poolcreateadvancedtab">pool down actions</a> of pools A and B are independent of one another and can be set to different actions. > In the current release, the backup pool action is not supported for either pool in an A/B pair.
 
* A/B pools do not act as backup pools for one other. Once a specific pool (A or B) is chosen, if server selection to the pool fails, then the client connection is terminated using the configured pool down action.  
    
    This behavior ensures that a failure in the selected pool is brought to the attention of the Vantage user, rather than masked by a silent failover to the other pool.
    
## Configuring the A/B Pool Feature

The following sections show how to configure the A/B pool feature using the web interface or CLI.

### Web Interface

First configure the B pool, if not already configured. Then use these steps to configure the A/B settings within the A pool.
<ol> 
 <li> <p>Navigate to Applications &gt; Pools.</p> </li> 
 <li> <p>Click the edit icon in the row for the pool name.</p> </li> 
 <li> <p>Click Advanced.</p> </li> 
 <li> <p>In the Pool A/B Testing Settings section, select the B pool from the A/B Test pool pull-down list.</p> </li> 
 <li> <p>In the Percentage of Requests field, enter the percentage of new sessions to send to pool B instead of pool A. (Existing sessions on pool A are not affected.)</p> </li> 
 <li> <p>Click Save.</p> </li> 
</ol> 

<a href="img/a-b-pool.png"><img src="img/a-b-pool.png" alt="a-b-pool" width="624" height="227" class="alignnone size-full wp-image-5785"></a>

### CLI

The commands in this example edit the configuration of pool-1 to enable the A/B pool feature, using pool-2 as the B pool:

<pre class="command-line language-bash" data-prompt=": >"><code>configure pool pool-1
   ab_pool
     pool_ref pool-2
     ratio 10
   save
 save</code></pre> 

The **ratio** *percent* command sets the percentage of traffic to be diverted to pool B to 10 percent. After this configuration change, 10 percent of new sessions will be sent to pool-2 (the B pool). Sessions that are already on pool-1 (the A pool) when the change is made are not affected by the change.

The following commands edit the configuration to send 100 percent of the traffic to the B pool:

<pre class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="1-100"><code>: &gt; configure pool pool-1 
: &gt;   ab_pool
: &gt;     pool_ref pool-2 
: &gt;     ratio 100
: &gt;   save 
: &gt; save 
</code></pre> 

The following commands reduce the percentage of traffic diverted to the B pool to 90 percent:

<pre class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="1-100"><code>: &gt; configure pool pool-1 
: &gt;   ab_pool
: &gt;     pool_ref pool-2 
: &gt;     ratio 90
: &gt;   save 
: &gt; save 
</code></pre> 

The following commands send all the traffic back to pool-1 (the A pool):

<pre class="command-line language-bash" data-user="root" data-host="localhost ~" data-output="1-100"><code>: &gt; configure pool pool-1 
: &gt;   ab_pool
: &gt;     pool_ref pool-2 
: &gt;     no ratio
: &gt;   save 
: &gt; save 
</code></pre> 