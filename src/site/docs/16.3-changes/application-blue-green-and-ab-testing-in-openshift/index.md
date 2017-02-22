---
title: Application Blue-Green and A/B Testing in OpenShift
layout: default
---
Beginning with release 16.3.4, Avi Vantage supports load balancing for graceful application testing and upgrades in an OpenShift environment using the <code>alternateBackends</code> field in the OpenShift route object. This article overviews the steps and then provides an example workflow.

### Workflow Overview

There are three major steps.

### Step 1: Initial Deployment

<ol> 
 <li><span style="font-weight: 400;">Create a deployment for application with v1</span></li> 
 <li><span style="font-weight: 400;">Create a service for application with v1</span></li> 
 <li><span style="font-weight: 400;">Create a Route for application with service v1</span></li> 
</ol> 

### Step 2: Upgrade to v2

<ol> 
 <li><span style="font-weight: 400;">Create a deployment with version v2</span></li> 
 <li><span style="font-weight: 400;">Create a service for v2</span></li> 
 <li><span style="font-weight: 400;">Update route with both v1 and v2 with some portion of the traffic sent to v2</span></li> 
 <li><span style="font-weight: 400;">Update route to send all traffic to v2</span></li> 
</ol> 

### Step 3: Upgrade to v3 and retire v2

<ol> 
 <li><span style="font-weight: 400;">Create a deployment with version v3</span></li> 
 <li><span style="font-weight: 400;">Create a service for v3</span></li> 
 <li><span style="font-weight: 400;">Update route with both v2 and v3 with some portion of the traffic sent to v3</span></li> 
 <li><span style="font-weight: 400;">Update route to send all traffic to v3</span></li> 
 <li><span style="font-weight: 400;">Update route to remove service v2</span></li> 
 <li><span style="font-weight: 400;">Delete service and deployment v2</span></li> 
</ol> 

Repeat Step 2 and Step 3 for v4 and versions thereafter.

### Example Workflow

### Initial Deployment

### Deployment definition of initial application deployment (<code>dc-v1.json</code>)

<pre><code class="language-lua">{
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": {
    "name": "avitest1"
  },
  "spec": {
    "template": { 
      "metadata": {
        "labels": {
          "name": "avitest1"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "avitest1",
            "image": "avinetworks/server-os",
            "ports": [
              {
                "name": "foo",
                "containerPort": 8080,
                "protocol": "TCP"
              },
              {
                "name": "bar",
                "containerPort": 8443,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    },
    "replicas": 2,
    "selector": {
      "name": "avitest1"
    }
  }
}</code></pre>    

### Create the deployment using OpenShift client

<code>&gt;oc create -f dc-v1.json</code>

### Service definition of initial service (<code>svc-v1.json</code>)

<pre><code class="language-lua">{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvc1",
    "labels": {
        "svc": "avisvc1"
    }
  },
  "spec": {
    "ports": [
    {
      "name": "foo",
      "port": 80,
      "targetPort": 8080
    }
    ],
    "selector": {
      "name": "avitest1"
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

### Create the service using OpenShift client

<pre><code class="language-lua">&gt;oc create -f svc-v1.json</code></pre>  

### Route definition for service (<code>route-v1.yaml</code>)

<pre><code class="language-lua">apiVersion: v1
kind: Route
spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 1
  tls:
    termination: edge
    insecureEdgeTerminationPolicy: Allow
    certificate: |-
      -----BEGIN CERTIFICATE-----
      MIIDCTCCAfOgAwIBAgIBCDALBgkqhkiG9w0BAQswJjEkMCIGA1UEAwwbb3BlbnNo
      ...
      UAqJt303OByAvy9dBg==
      -----END CERTIFICATE-----
    key: |-
      -----BEGIN RSA PRIVATE KEY-----
      ...
      i4epcek7DaW+zYJaLf1D6B7FW7k0ddPOvRZrl5+XvJCiChYIhcrzvQ==
      -----END RSA PRIVATE KEY-----
metadata:
  name: aviroute1</code></pre>  

### Create the Route using OpenShift client

oc create -f route-v1.json

### Upgrade to v2

### Deployment definition of initial application deployment (<code>dc-v2.json</code>)

<pre><code class="language-lua">{
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": {
    "name": "avitest2"
  },
  "spec": {
    "template": { 
      "metadata": {
        "labels": {
          "name": "avitest2"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "avitest2",
            "image": "avinetworks/server-os",
            "ports": [
              {
                "name": "foo",
                "containerPort": 8080,
                "protocol": "TCP"
              },
              {
                "name": "bar",
                "containerPort": 8443,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    },
    "replicas": 2,
    "selector": {
      "name": "avitest2"
    }
  }
}</code></pre>  

### Create the deployment using OpenShift client

<pre><code class="language-lua">&gt;oc create -f dc-v2.json</code></pre>  

### Service definition of initial service (<code>svc-v2.json</code>)

<pre><code class="language-lua">{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvc2",
    "labels": {
        "svc": "avisvc2"
    }
  },
  "spec": {
    "ports": [
    {
      "name": "foo",
      "port": 80,
      "targetPort": 8080
    }
    ],
    "selector": {
      "name": "avitest2"
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

### Create the service using OpenShift client

<pre><code class="language-lua">&gt;oc create -f svc-v2.json</code></pre>  

### Update Route with both v1 and v2 with some portion of the traffic sent to v2

### To edit the route using OpenShift client:

<pre><code class="language-lua">&gt;oc edit route aviroute1</code></pre>  

### Add an <code>alternateBackend</code> as follows to the spec (<code>route-v2.yaml</code>):

<pre><code class="language-lua">spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 1
  alternateBackends:
  - kind: Service
    name: avisvc2
    weight: 1
  tls:
...</code></pre>  

### Update Route to send all traffic to v2

### To edit the route using OpenShift client:

<pre><code class="language-lua">&gt;oc edit route aviroute1</code></pre>  

### Send all traffic to v2 (<code>route-v21.yaml</code>)

<pre><code class="language-lua">spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 0
  alternateBackends:
  - kind: Service
    name: avisvc2
    weight: 1
  tls:
...</code></pre>  

### Upgrade to v3

Deployment definition of initial application deployment (<code>dc-v3.json</code>)

<pre><code class="language-lua">{
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": {
    "name": "avitest3"
  },
  "spec": {
    "template": { 
      "metadata": {
        "labels": {
          "name": "avitest3"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "avitest3",
            "image": "avinetworks/server-os",
            "ports": [
              {
                "name": "foo",
                "containerPort": 8080,
                "protocol": "TCP"
              },
              {
                "name": "bar",
                "containerPort": 8443,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    },
    "replicas": 2,
    "selector": {
      "name": "avitest3"
    }
  }
}</code></pre>  

### Create the deployment using OpenShift client

<pre><code class="language-lua">&gt;oc create -f dc-v3.json</code></pre>  

Service definition of initial service (<code>svc-v3.json</code>)

<pre><code class="language-lua">{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvc3",
    "labels": {
        "svc": "avisvc3"
    }
  },
  "spec": {
    "ports": [
    {
      "name": "foo",
      "port": 80,
      "targetPort": 8080
    }
    ],
    "selector": {
      "name": "avitest3"
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

### Create the service using OpenShift client

<pre><code class="language-lua">&gt;oc create -f svc-v3.json</code></pre>  

### Update Route with both v2 and v3 with some portion of the traffic sent to v3

To edit the route using OpenShift client:

<pre><code class="language-lua">&gt;oc edit route aviroute1</code></pre>  

Add an <code>alternateBackend</code> as follows to the spec (<code>route-v2.yaml</code>):

<pre><code class="language-lua">spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 0
  alternateBackends:
  - kind: Service
    name: avisvc2
    weight: 1
  - kind: Service
    name: avisvc3
    weight: 1
  tls:
...</code></pre>  

### Update Route to send all traffic to v3

To edit the route using OpenShift client:

<pre><code class="language-lua">&gt;oc edit route aviroute1</code></pre>  

### Send all traffic to v3 (<code>route-v31.yaml</code>)

<pre><code class="language-lua">spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 0
  alternateBackends:
  - kind: Service
    name: avisvc2
    weight: 0
  - kind: Service
    name: avisvc3
    weight: 1
  tls:
...</code></pre>  

...

### Update Route to remove service v2

To edit the route using OpenShift client:

<pre><code class="language-lua">&gt;oc edit route aviroute1</code></pre>  

Remove service v2 (<code>route-v32.yaml</code>)

<pre><code class="language-lua">spec:
  host: aviroute1.avi.local
  to:
    kind: Service
    name: avisvc1
    weight: 0
  alternateBackends:
  - kind: Service
    name: avisvc3
    weight: 1
  tls:
...</code></pre>  

### Delete service and deployment v2

To delete service and deployment the route using OpenShift client:

<pre><code class="language-lua">&gt;oc delete service avisvc2
&gt;oc delete dc avitest2</code></pre>  

 

