---
title: OpenShift/Kubernetes Service Configuration in Avi Vantage
layout: default
---
## Introduction

 

In an OpenShift or Kubernetes cloud, <a href="https://docs.openshift.com/enterprise/3.0/architecture/core_concepts/pods_and_services.html">service</a> creation triggers the corresponding creation of Avi Vantage <a href="/docs/latest/api-guide/virtualservice.html/">VirtualService</a> and <a href="/docs/latest/api-guide/pool.html">Pool</a> objects. Parameters governing most of the behavior of the Avi Vantage virtual service and its corresponding Avi Vantage pool members are automatically filled in from OpenShift/Kubernetes by the cloud connector. Others can be configured via annotations in the OpenShift/Kubernetes service object. The following article explains what fields are automatically derived by the cloud connector and how to stipulate additional configuration for Avi VirtualServices and Pools.

## Automatic configuration

The following fields in VirtualServices and Pools are automatically derived from OpenShift/Kubernetes services by the cloud connector.

### Avi Vantage VirtualService Fields

<table class="table table-hover table table-bordered table-hover">  
<tbody>               
<tr>    
<td><b>Field</b></td>
<td><b>OpenShift/Kubernetes Field</b></td>
<td><b>Comments</b></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">tenant</span></td>
<td><span style="font-weight: 400;">project/namespace</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">name</span></td>
<td><span style="font-weight: 400;">Service name</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">fqdn</span></td>
<td><span style="font-weight: 400;">name.subdomain</span></td>
<td><i><span style="font-weight: 400;">‘subdomain’</span></i><span style="font-weight: 400;"> is the configured subdomain in the IPAMDNS profile. North-south virtualservices use the north-south DNS profile and east-west virtualservices use the east-west DNS profile.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">ip_address</span></td>
<td><span style="font-weight: 400;">East-west virtual service: service cluster IP if </span><i><span style="font-weight: 400;">use_service_cluster_ip_as_ew_vip</span></i><span style="font-weight: 400;"> is enabled in the cloud; else, auto-allocated from the east-west IPAM object</span><p></p> <p><span style="font-weight: 400;">North-south virtual service: auto-allocated from the north-south IPAM object</span></p></td>
<td><span style="font-weight: 400;">NB</span><i><span style="font-weight: 400;">: use_service_cluster_ip_as_ew_vip can be enabled</span></i><span style="font-weight: 400;"> if kube-proxy is disabled cluster wide.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">services</span></td>
<td><i><span style="font-weight: 400;">port</span></i><span style="font-weight: 400;"> field in the service</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">application_profile</span></td>
<td><i><span style="font-weight: 400;">http_container_ports</span></i><span style="font-weight: 400;"> is a target list of HTTP/HTTPS ports in the cloud object. If all endpoints’ ports match any port in the </span><i><span style="font-weight: 400;">http_container_ports</span></i><span style="font-weight: 400;"> list and the service protocol is </span><i><span style="font-weight: 400;">‘tcp’</span></i><span style="font-weight: 400;">, the virtual service is a layer7 (HTTP/HTTPS) service. If the service protocol is ‘tcp’, but endpoints’ ports don’t match with any port in the </span><i><span style="font-weight: 400;">http_container_ports</span></i><span style="font-weight: 400;"> list, a layer4 TCP virtual service is created. If the service protocol is ‘udp’, a  layer4 UDP virtual service is created.</span></td>
<td><span style="font-weight: 400;">E.g., if some deployment containers containerPort is 8080, some deployment containers containerPort is 9080, and both services should be treated as HTTP/HTTPS, add 8080 and 9080 to the </span><i><span style="font-weight: 400;">http_container_ports </span></i><span style="font-weight: 400;">list in the cloud.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">network_profile</span></td>
<td><span style="font-weight: 400;">Use </span><i><span style="font-weight: 400;">System-TCP-Proxy</span></i><span style="font-weight: 400;"> network profile for layer7 and layer4 TCP virtual services; use </span><i><span style="font-weight: 400;">System-UDP-Fast-Path</span></i><span style="font-weight: 400;"> for layer4 UDP virtual services</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">pool</span></td>
<td><span style="font-weight: 400;">Create a default pool corresponding to a endpoint port; if there are multiple endpoint ports, one of them will be the default pool; other ports will create additional pools.</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">network_security_policy</span></td>
<td><span style="font-weight: 400;">A default network security policy is created for every virtual service.</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">http_policies</span></td>
<td><span style="font-weight: 400;">An HTTP policy set is automatically created with switching rules when there are multiple endpoint ports/pools for a layer7 virtual service. For example, suppose the service object has 2 port mappings, say, (port: 80, targetPort: 8080) and (port: 443, targetPort: 8443). Two pools will be created corresponding to 8080 (pool-8080) and 8443 (pool-8443). An HTTP policy will be created with pool switching rules for port 80 to the pool-8080 and port 443 to pool-8443. For layer4 virtual services, a service_pool_select is used. See below.</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">microservice</span></td>
<td><span style="font-weight: 400;">A microservice is automatically created for every virtual service.</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">service_pool_select</span></td>
<td><span style="font-weight: 400;">A service_pool_select is automatically created with switching rules when there are multiple endpoint ports/pools for a layer4 virtualservice. For example, suppose the service object has 2 port mappings, say, (port: 53, targetPort: 8053, protocol: tcp) and (port: 53, targetPort: 8053, protocol: udp). Two pools will be created corresponding to 8053,tcp (pool-8053-tcp) and 8053,udp (pool-8053-udp). A service_pool_select policy will be created with pool switching rules for port 53,tcp to the pool-8053-tcp and port 53,udp to pool-8053-udp.</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">east_west_placement</span></td>
<td><span style="font-weight: 400;">If default_service_as_east_west_service is enabled in the cloud, services are created by default as east-west virtual services. Else, the east_west_placement flag specified via annotations determines if a service is east-west or north/south.</span></td>
<td><span style="font-weight: 400;">"annotations": {</span><p></p> <p><span style="font-weight: 400;">    "avi_proxy": "{\"virtualservice\": {\"east_west_placement\": false}}"</span></p> <p><span style="font-weight: 400;">    } creates a north-south service</span></p></td>
</tr>
</tbody>
</table> 

## Additional Virtual Service Configuration Examples

Additional configuration can be provided using annotations in the service configuration. Examples of such configuration include SSL certs, profiles, policies, health monitors, etc. 

**NB**: The following examples assume the following cloud configuration.

* http_container_ports is configured with 80, 8080
* use_service_cluster_ip_as_ew_vip is enabled (kube-proxy is disabled cluster wide)
* default_service_as_east_west_serviceis enabled (default: on)
* A Network object is created with an IP address pool for north-south VIPs; a north-south IPAM profile is created and linked to the Network object and the cloud is linked to the north-south IPAM profile
* A Network object is created with an IP address pool for east-west VIPs; an east-west IPAM profile is created and linked to the Network object and the cloud is linked to the east-west IPAM profile 

### A Layer 7 East-West HTTP Virtual Service

Sample deployment configuration in JSON format.

<pre><code class="language-lua">{
 "kind": "DeploymentConfig",
 "apiVersion": "v1",
 "metadata": {
  "name": "avitest"
 }
 "spec": {
  "template": {
   "metadata": {
    "labels": {   
     "name": "avitest"
    }
   },
   "spec": {
    "containers": [
     {
      "name": "avitest",
      "image": "avinetworks/server-os",
      "ports": [
       {
        "name": "http",
        "containerPort": 8080,
        "protocol": "TCP"
       }
      ]
     }
    ]
   }
  },
  "replicas": 2,
  "selector": {
   "name": "avitest"
  }
 }
}</code></pre>  

Sample service file to create an east-west service in JSON format.

<pre><code class="language-lua">{
 "kind": "Service",
 "apiVersion": "v1",
 "metadata": {
   "name": "avisvc",
   "labels": {
      "svc": "avisvc"
   },
  },
  "spec": {
   "ports": [{
    “name”: “http”,
    "port": 80,
    "targetPort": “http”
  }],
  "selector": {
   "name": "avitest"
  },
  "type": "LoadBalancer"
 }
}</code></pre>  

Since default_service_as_east_west_serviceis enabled in the cloud configuration, this service creates an east-west virtual service. Since use_service_cluster_ip_as_ew_vipis enabled, this virtual service uses the same virtual IP as the cluster IP for this service. 

### A Layer 7 North-South HTTPs Virtual Service

Sample deployment configuration in JSON format.

<pre><code class="language-lua">{
 "kind": "DeploymentConfig",
 "apiVersion": "v1",
 "metadata": {
  "name": "avitest"
 },
 "spec": {
  "template": {
   "metadata": {
    "labels": {
     "name": "avitest"
     }
    },
    "spec": {
     "containers": [
      {
       "name": "avitest",
       "image": "avinetworks/server-os",
       "ports": [
       {
        "name": "https",
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
   "name": "avitest"
  }
 }
}</code></pre>  

Sample service file to create a north-south service in JSON format.

<pre><code class="language-lua">{
 "kind": "Service",
 "apiVersion": "v1",
 "metadata": {
  "name": "avisvc",
  "labels": {
     "svc": "avisvc"
  },
  "annotations": {
     "avi_proxy": "{\"virtualservice\": {\"services\": [{\"port\": 443, \"enable_ssl\": true}], \"auto_allocate_ip\": true, \"east_west_placement\": false, \"ssl_key_and_certificate_refs\": [\"avisvccert\"], \"ssl_profile_ref\": \"/api/sslprofile/?name=System-Standard\"}}"
    }
  },
  "spec": {
     "ports": [{
      “name”: “https”,
      "port": 443,
      "targetPort": “https”
     }],
  "selector": {
   "name": "avitest"
  },
  "type": "LoadBalancer"
 }
}</code></pre>  

Annotations:

<ol> 
 <li style="font-weight: 400;"><i><span style="font-weight: 400;">services </span></i><span style="font-weight: 400;">overrides the default service in the spec and configures SSL/TLS offload on the VirtualService. If SSL/TLS is configured, the default cert will be used if no cert is provided</span></li> 
 <li style="font-weight: 400;"><i><span style="font-weight: 400;">auto_allocate_ip</span></i><span style="font-weight: 400;"> set to true asks that a Virtual IP be allocated for this service from the north-south IPAM profile IP address pool</span></li> 
 <li style="font-weight: 400;"><i><span style="font-weight: 400;">east_west_placement</span></i><span style="font-weight: 400;"> set to false indicates this is a north-south virtualservice</span></li> 
 <li style="font-weight: 400;"><i><span style="font-weight: 400;">ssl_profile_ref</span></i><span style="font-weight: 400;"> uses the </span><i><span style="font-weight: 400;">System-Standard</span></i><span style="font-weight: 400;"> SSL profile for illustration purposes. If unspecified, it defaults to the </span><i><span style="font-weight: 400;">System-Standard </span></i><span style="font-weight: 400;">SSL profile. </span></li> 
 <li style="font-weight: 400;"><i><span style="font-weight: 400;">ssl_key_and_certificate_refs</span></i><span style="font-weight: 400;"> asks that a certificate called </span><i><span style="font-weight: 400;">avisvccert</span></i><span style="font-weight: 400;"> be used for the service. NB: The certificate </span><i><span style="font-weight: 400;">avisvccert</span></i><span style="font-weight: 400;"> should have been pre-created, else VirtualService creation will fail</span></li> 
</ol> 

### A Layer 4 East-West HTTP Virtual Service

Sample deployment configuration in JSON format.

<pre><code class="language-lua">{                                                                                                                     
  "kind": "DeploymentConfig",
  "apiVersion": "v1",
  "metadata": {
    "name": "avitest"
  },
  "spec": {
    "template": {
      "metadata": {
        "labels": {
          "name": "avitest"
       }
      },
      "spec": {
        "containers": [
          {
            "name": "avitest",
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
      "name": "avitest"
    }
  }
}</code></pre>  

Sample service file to create an east-west service in JSON format.

<pre><code class="language-lua">{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvc",
    "labels": {
        "svc": "avisvc"
    },
  },
  "spec": {
    "ports": [
    {
      "name": "foo",
      "port": 80,
      "targetPort": 8080
    },
    {
      "name": "bar",
      "port": 443,
      "targetPort": "bar"
    }
    ],
    "selector": {
      "name": "avitest"
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

 

NB: Container port 8443 doesn’t match with any port (80, 8080) in http_container_ports. So, a layer4 TCP virtual service will be created in this case.

### Exposing Just a Single L4 Port While Service Has Multiple Ports

The service port has 2 ports, 443 and 80, mapped to targetPorts foo and bar. Avi annotations creates a north-south service with an auto-allocated VIP, a Layer4 (TCP) application profile and specifies just a single port. The single port is switched to pool avisvc-pool-bar-tcp. Pool names are of the form servicename-pool-targetPort-protocol.

<pre><code class="language-lua">{
  "kind": "Service",
  "apiVersion": "v1",
  "metadata": {
    "name": "avisvc",
    "labels": {
        "svc": "avisvc"
    },
    "annotations": {
        "avi_proxy": "{\"virtualservice\": {\"auto_allocate_ip\": true, \"east_west_pl
acement\": false, \"application_profile_ref\": \"/api/applicationprofile/?name=System-L4-Application\", \"services\": [{\"port\"
: 443}], \"service_pool_select\": [{\"service_port\": 443, \"service_pool_ref\": \"/api/pool/?name=avisvc-pool-bar-tcp\"}]}}"
    }
  },
  "spec": {
    "ports": [
    {
      "name": "foo",
      "port": 443,
      "targetPort": 8080
    },
    {
      "name": "bar",
      "port": 80,
      "targetPort": "bar"
    }
    ],
    "selector": {
      "name": "avitest"
    },
    "type": "LoadBalancer"
  }
}</code></pre>  

### Analytics Policy to Enable Real-time Metrics and Full Client Logs

### The following service file creates an east-west service with real-time metrics and full client logs enabled.

<pre><code class="language-lua">{
 "kind": "Service",
 "apiVersion": "v1",
 "metadata": {
  "name": "avisvc",
  "labels": {
     "svc": "avisvc"
  },
  "annotations": {
    "avi_proxy": "{\"virtualservice\": {\"analytics_policy\": {\"metrics_realtime_update\": {\"duration\": 0, \"enabled\":true}, \"client_insights\": \"NO_INSIGHTS\", \"full_client_logs\": {\"enabled\":true}}}}"
  }
 },
 "spec": {
  "ports": [
  {
   "name": "http",
   "port": 80,
   "targetPort": "http"
  }
  ],
  "selector": {
   "name": "avitest"
  },
  "type": "LoadBalancer"
 }
}</code></pre>  

### Changing the Default Load-balancing Algorithm for the Default Pool

The following annotation sets the load-balancing algorithm to round robin from the default (least connections) for the default pool of a virtual service.


<pre><code class="language-lua">"annotations": {
    "avi_proxy": "{\"pool\": {\"lb_algorithm\": \"LB_ALGORITHM_ROUND_ROBIN\"}}"
}</code></pre>  

### Adding Custom Health Monitors for a Pool

The following annotation adds multiple health monitors to the default pool.


<pre><code class="language-lua">"annotations": {
"avi_proxy": "{\"pool\": {\"health_monitor_refs\": [\"/api/healthmonitor?name=User-HM\", \"/api/healthmonitor?name=System-TCP\"]}}"
}</code></pre>  