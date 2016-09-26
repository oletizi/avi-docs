---
title: Mesos - Graceful App Migration in DC/OS Cluster
layout: default
---
Avi Vantage labels can be used in a Mesos / Marathon cloud to gracefully deploy application changes in a Continuous Integration and Deployment (CI/CD) environment.

This article shows how to gracefully migrate application traffic from one pool to another using the A/B pool feature in combination with pool priority. No change to DNS nor to the initial virtual service's configuration are required. Instead, new versions of the virtual service are used to define a B pool and to divert all the application's traffic to that B pool.

To use this method for migrating application traffic:
<ol> 
 <li>Create the application.</li> 
 <li>When ready to migrate traffic, create an updated version of the application, with the A/B pool feature enabled. Use labels to refer to the previous version of the application for the A pool, and to set the pool priority of this new version to a higher value than the previous version. The higher pool priority sends the application traffic to the pool belonging to this new version of the application, instead of to the pool belonging to the previous version.</li> 
 <li>When ready to migrate the application traffic again, create another new version of the virtual service that uses the A/B pool feature and that also refers to the initial version (app1) for the A pool. Make sure this version sets the pool priority to a higher value than the previous version(s).</li> 
</ol> 

The first app is the "listener" for the virtual service. Please, never delete this app! Deleting this app will delete the listener. Instead, it is safe to scale down this app to 0 instances after the app has been successfully upgraded to higher versions.

Application upgrade functions by alternately switching between the A and B pools of the virtual service. Initially, the first service is the A pool. When a new version (2) is created, it becomes the B pool. When a newer version (3) is created, it becomes the A pool.

A separate unattached pool may be created for version 3, but it is unused. Monitoring should always use either pool A or pool B. The currently active pool can be extracted by looking at the ratio field in the ab_pool object of the pool attached to the virtual service.

## Initial Virtual Service Creation

The following JSON file creates a north-south application. The Avi SE resources allocated for the application are 0.5 vCPU (fractional for <a href="/docs/latest/terms-of-avi-vantage-license">licensing</a> purposes) and 64 GB memory. The SE group allows a maximum of 2 instances (2 SEs).

In the labels section, the north-south proxy service is enabled (FE-proxy), and the virtual service is defined (avi_proxy). The following options define the virtual service:

* Port 80 (HTTP)
* IP auto-allocation for microservices enabled
* Analytics with real-time metrics enabled
* Server pool load-balancing algorithm set to round robin 

The healthChecks section defines the health monitor that will be used to generate health checks to the application.

<pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "app1",
  "cpus": 0.5,
  "mem": 64.0,
  "instances": 2,
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "avinetworks/server",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 80, "hostPort": 0, "servicePort": 0, "protocol": "tcp" }
      ]
    }
  },
  "labels": {
    "FE-Proxy": "yes",
    "avi_proxy": "{\"virtualservice\": {\"services\": [{\"port\": 80}], \"auto_allocate_ip\": true, \"analytics_policy\": {\"metrics_realtime_update\": {\"duration\": 0, \"enabled\":true}, \"client_insights\": \"NO_INSIGHTS\"}}, \"pool\": {\"lb_algorithm\": \"LB_ALGORITHM_ROUND_ROBIN\"}}"
  },
  "healthChecks": [
    {
      "protocol": "HTTP",
      "portIndex": 0,
      "path": "/",
      "gracePeriodSeconds": 5,
      "intervalSeconds": 20,
      "maxConsecutiveFailures": 3
    }
  ]
}
</code></pre> 

## Updated Virtual Service Configuration with A/B Pool and Higher Pool Priority

This JSON file creates an newer version of the application. The purpose of this version is to create the second pool for the A/B pool feature. This version changes the application using the following labels:

* proxy_listener: This label is set to no to disable proxy service for the application port. This results in creation of a pool without also creating the virtual service.
* ab_config: This label enables the A/B pool feature, identifies the virtual service that owns the A pool, and sets the priority value for the pool. Setting this B pool's priority value to a higher one than is set for the A pool ensures that all the application's traffic is sent to the B pool instead of the A pool. 

The load balancing algorithm is explicitly set to round robin again, since this is not the default. If the value is left unset, it will revert to its default value (not round robin). To direct app1's traffic to this version's pool, the A/B pool feature is enabled, with app1's pool set as the A pool, and the priority for the B pool set to 10.

<pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "app1-100"
  "cpus": 0.5,
  "mem": 64.0,
  "instances": 2,
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "avinetworks/server",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 80, "hostPort": 0, "servicePort": 0, "protocol": "tcp" }
      ]
    }
  },
  "labels": {
    "proxy_listener": "no",
    "ab_config": "{\"service\": \"app1\", \"priority\": 10}",
    "avi_proxy": "{\"pool\": {\"lb_algorithm\": \"LB_ALGORITHM_ROUND_ROBIN\"}}"
  },
  "healthChecks": [
    {
      "protocol": "HTTP",
      "portIndex": 0,
      "path": "/",
      "gracePeriodSeconds": 5,
      "intervalSeconds": 20,
      "maxConsecutiveFailures": 3
    }
  ]
}
</code></pre> 

## Updated Version with Higher Pool Priority

This version of the app configuration sets the priority to 20. Since the virtual service previously used pool B, this version of the app is mapped to pool A and all traffic is routed to pool A of the virtual service. In this case, pool A should be used to monitor traffic. An unattached/unused pool corresponding to this version of the app will be created. It can be ignored.
.

<pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "app1-200"
  "cpus": 0.5,
  "mem": 64.0,
  "instances": 2,
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "avinetworks/server",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 80, "hostPort": 0, "servicePort": 0, "protocol": "tcp" }
      ]
    }
  },
  "labels": {
    "proxy_listener": "no",
    "ab_config": "{\"service\": \"app1\", \"priority\": 20}",
    "avi_proxy": "{\"pool\": {\"lb_algorithm\": \"LB_ALGORITHM_ROUND_ROBIN\"}}"
  },
  "healthChecks": [
    {
      "protocol": "HTTP",
      "portIndex": 0,
      "path": "/",
      "gracePeriodSeconds": 5,
      "intervalSeconds": 20,
      "maxConsecutiveFailures": 3
    }
  ]
}
</code></pre> 