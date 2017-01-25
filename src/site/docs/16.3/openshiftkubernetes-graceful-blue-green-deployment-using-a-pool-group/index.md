---
title: OpenShift/Kubernetes - Graceful Blue-Green Deployment Using a Pool Group
layout: layout163
---
The PoolGroup feature supports a virtual service (application) to be serviced by one or more pools. In this case, each of the the pools receives a share of the traffic for the application, based on configuration.

This article describes how to deploy A/B or canary pools for a virtual service in a OpenShift/Kubernetes cluster.

## Overview

In an OpenShift/Kubernetes cloud, to deploy a virtual service (application) that uses a pool group, first create a regular service with a listener. The regular service creates a virtual service, a pool group and a pool. Then create a service with just maps to the deployment pods but without a listener of its own. This service results in a pool creation. Update the first service's annotation to add the second service to the first service's pool group. This results in a single service/listener with multiple pools in its pool group and steps 2 and 3 can be repeated to continuously update the service.

### Example

Step 1: Sample deployment configuration in JSON format.

<pre><code class="language-lua">{
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": { 
    "name": "avitestA" 
  },
  "spec": {
    "template": {
      "metadata": {
        "labels": { 
          "name": "avitestA"
        },
        "spec": {
          "containers": [
            {
              "name": "avitestA",
              "image": "avinetworks/server-os",
              "ports": [
                { 
                  "name": "http", "containerPort": 8080, "protocol": "TCP" 
                }
              ]
            }
          ]
        }
      }
    },
    "replicas": 2,
    "selector": { 
      "name": "avitestA" 
    }
  }
}

{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvcA",
    "labels": { 
      "svc": "avisvcA" 
    },
    "annotations": {
      "avi_proxy": "{\"virtualservice\": {\"east_west_placement\": false}}"
    }
  },
  "spec": {
    "ports": [{ 
      “name”: “http”, "port": 80, "targetPort": “http” 
    }],
    "selector": { 
      "name": "avitestA" 
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

Step 2: Sample configuration for a 'B' deployment and service with no listener. This will result in just a pool creation called avisvcB.

<pre><code class="language-lua">{
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": { 
    "name": "avitestB" 
  },
  "spec": {
    "template": {
      "metadata": {
        "labels": { 
          "name": "avitestB"
        },
        "spec": {
          "containers": [
            {
              "name": "avitestB",
              "image": "avinetworks/server-os",
              "ports": [
                { 
                  "name": "http", "containerPort": 8080, "protocol": "TCP" 
                }
              ]
            }
          ]
        }
      }
    },
    "replicas": 2,
    "selector": { 
      "name": "avitestB" 
    }
  }
}

{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvcB",
    "labels": { 
      "svc": "avisvcB" 
    },
    "annotations": {
      "proxy_listener": "no"
    }
  },
  "spec": {
    "ports": [{ 
      “name”: “http”, "port": 80, "targetPort": “http” 
    }],
    "selector": { 
      "name": "avitestB" 
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

Step 3: Deploy a A/B pool or canary pattern for the application by modifying service annotations for the virtual service.

<pre><code class="language-lua">oc annotate --overwrite services avisvcA avi_proxy='{"virtualservice": {"east_west_placement": false}, "poolgroup": {"members": [{"ratio": 10, "pool_ref": "/api/pool/?name=avisvcA-pool-http-tcp"}, {"ratio": 1, "pool_ref": "/api/pool/?name=avisvcB-pool-http-tcp"}]}}'</code></pre>  

This will result in 10% of new traffic being gracefully redirected to avisvcB. Existing connections are still preserved.

To direct 100% of new connections to pool avisvcB:

<pre><code class="language-lua">oc annotate --overwrite services avisvcA avi_proxy='{"virtualservice": {"east_west_placement": false}, "poolgroup": {"members": [{"ratio": 0, "pool_ref": "/api/pool/?name=avisvcA-pool-http-tcp"}, {"ratio": 1, "pool_ref": "/api/pool/?name=avisvcB-pool-http-tcp"}]}}'</code></pre>  

After sufficient time has passed, avisvcA can be emptied by setting replicas to 0. However, avisvcA should not be deleted, since the listener and pool group are anchored by avisvcA.

<pre><code class="language-lua">oc annotate --overwrite services avisvcA avi_proxy='{"virtualservice": {"east_west_placement": false}, "poolgroup": {"members": [{"ratio": 1, "pool_ref": "/api/pool/?name=avisvcB-pool-http-tcp"}]}}'</code></pre>  

Steps 2 and 3 can be repeated to deploy additional deployment versions.

