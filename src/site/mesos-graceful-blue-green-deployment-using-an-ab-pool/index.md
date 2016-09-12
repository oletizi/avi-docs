<html>
 <head></head>
 <body>
  --- title: Mesos - Graceful Blue-Green Deployment Using an A/B Pool layout: default --- The 
  <a href="/docs/16.2.2">A/B pool feature</a> allows a virtual service (application) to be serviced by a pair of pools. In this case, each of the two pools receives a percentage of traffic for the application, based on configuration. This article describes how to deploy A/B pool support for a virtual service in a DCOS/Apache Mesos cluster. ## Overview In a Mesos / Marathon cloud, to deploy a virtual service (application) that uses A/B pools, two application configurations are required. One of them creates the pool but does not listen for client traffic. The other application listens for client traffic, and uses the first application's pool as its B pool. 1. Create the B pool, by creating an application that has the proxy_listener label set to no. This results in creation of the back-end pool, but without a proxy listener. The pool members correspond to Marathon application task instances. The pool is automatically named according to this convention: ***app*****-pool-*****containerport*** For example, for application "app-green" listening on container port 80, the pool name will be "app-green-pool-80." 1. Create the application, and use the ab_pool label to enable the A/B pool feature for the application. The name of the B pool and the percentage (ratio) of traffic to send to that pool must be specified with the label. ## Example The following JSON files create two virtual service configurations: * ap-green: Creates the B pool. The proxy_listener label is set to "no." * app-blue: Creates the virtual service. Use the following syntax for the pool definition: 
  <code><br> \"pool\": {\"ab_pool\": {\"pool_ref\": \"/api/pool/?name=app-green-pool-80\", \"ratio\": 10}}<br> </code> In this example, the A/B pool feature is enabled. The B pool is "app-green-pool-80," and 10 percent of the application's traffic will be sent to this pool. The other 90 percent of the traffic will be sent to the A pool. ### Creating the 'B' Pool This JSON file creates the pool. 
  <pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "app-green",
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
<strong> "labels": { "proxy_listener": "no"</strong>
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
</code></pre> ### Creating the Virtual Service (application) This JSON file creates the application, and refers to the B pool. 
  <pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "app-blue",
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
    "avi_proxy": "{\"virtualservice\": {\"services\": [{\"port\": 80}], \"auto_allocate_ip\": true}, <strong>\"pool\": {\"ab_pool\": {\"pool_ref\": \"/api/pool/?name=app-green-pool-80\", \"ratio\": 10}}</strong>}"
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
</code></pre> ### Changing the A/B Ratio Once the B pool has passed all tests and is deemed satisfactory, update the ratio in the ab_pool object (in app-blue) to 100 to direct 100 percent of the traffic to app-green. (For brevity, only the labels section is shown in the example.) 
  <pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code> 

  "labels": {
    "FE-Proxy": "yes",
    "avi_proxy": "{\"virtualservice\": {\"services\": [{\"port\": 80}], \"auto_allocate_ip\": true}, \"pool\": {\"ab_pool\": {\"pool_ref\": \"/api/pool/?name=app-green-pool-80\", <strong>\"ratio\": 100}}</strong>}"

</code></pre> After a sufficient time (at least a few minutes to allow time for HTTP connections to close), app-blue can be scaled down to 0. 
  <pre class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>

  "labels": {
    "FE-Proxy": "yes",
    "avi_proxy": "{\"virtualservice\": {\"services\": [{\"port\": 80}], \"auto_allocate_ip\": true}, \"pool\": {\"ab_pool\": {\"pool_ref\": \"/api/pool/?name=app-green-pool-80\", <strong>\"ratio\": 0}}</strong>}"

</code></pre> For the next testing or upgrade cycle, the newer application software version can be deployed on app-blue and the ab_pool ratio can be updated in app-blue to pass an initial 10 percent of the traffic to app-blue, then updated to 100 percent of traffic to app-blue.
 </body>
</html>