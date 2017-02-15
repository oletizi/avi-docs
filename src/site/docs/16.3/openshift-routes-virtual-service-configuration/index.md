---
title: OpenShift Routes Virtual Service Configuration
layout: layout163
---
In an OpenShift cloud, OpenShift <a href="https://docs.openshift.com/enterprise/3.0/architecture/core_concepts/routes.html">route</a> creation triggers creation of north-south or ingress Avi Vantage VirtualService and Pool objects. <a href="{% vpath %}/openshiftkubernetes-service-configuration-in-vantage/"><span style="font-weight: 400;">OpenShift/Kubernetes Service Configuration in Avi Vantage</span></a>explained how OpenShift/Kubernetes <a href="https://docs.openshift.com/enterprise/3.0/architecture/core_concepts/pods_and_services.html">services</a> map to Avi Vantage's VirtualService and Pool objects. This article explains how OpenShift routes trigger VirtualService and Pool creation in Avi Vantage.

## OpenShift Routes to Avi Vantage Object Mapping

OpenShift routes can be configured in one of two ways as far as virtual IPs are concerned.

* **Dedicated virtual IP per route**: Each OpenShift route is allocated its own VirtualService/Pool and a virtual IP (VIP). This provides the best performance, availability and isolation, but consumes a VIP per route.
* **Shared Virtual IP across multiple routes**: Each OpenShift route is tied to a pre-allocated parent virtual service and will use the parentvirtual service’s virtual IP. This conserves VIPs, but provides variable performance, no isolation, and shares fate with all sibling routes. 

The following table maps each type of OpenShift route to Avi Vantage objects.

<table class="table table-hover table table-bordered table-hover">  
<tbody>     
<tr>    
<td><b>OpenShift route</b></td>
<td><b>Avi Vantage Object</b></td>
<td><b>Comment</b></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Dedicated VIP per route</span></td>
<td><span style="font-weight: 400;">VirtualService, Pool</span></td>
<td><span style="font-weight: 400;">Every route creates a VirtualService, Pool. Absence of annotation </span><i><span style="font-weight: 400;">route_virtualservice</span></i><span style="font-weight: 400;"> creates a dedicated virtual service (that uses a VIP) per route.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Shared VIP: Unsecured host/path-based routes</span></td>
<td><span style="font-weight: 400;">Pool</span></td>
<td><span style="font-weight: 400;">Http_policy is used in parent virtual service to switch host/path to the appropriate pool. Annotation </span><i><span style="font-weight: 400;">route_virtualservice</span></i><span style="font-weight: 400;"> specifies the parent virtual service to which this route is attached.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Shared VIP: Secure routes</span></td>
<td><span style="font-weight: 400;">Child Virtual Hosted/SNI VirtualService, Pool</span></td>
<td><span style="font-weight: 400;">SNI is used to route traffic to the appropriate child VirtualService/Pool. Annotation </span><i><span style="font-weight: 400;">route_virtualservice</span></i><span style="font-weight: 400;"> specifies the parent virtual service to which this route is attached.</span></td>
</tr>
</tbody>
</table> 

## Unsupported Features 

The following features are unsupported.
<ol> 
 <li style="font-weight: 400;"><span style="font-weight: 400;">Passthrough termination with shared VIPs.</span> 
  <ol> 
   <li style="font-weight: 400;"><span style="font-weight: 400;">Solution: Use dedicated VIPs instead.</span></li> 
  </ol> </li> 
 <li style="font-weight: 400;"><a href="https://docs.openshift.com/enterprise/3.2/rest_api/openshift_v1.html#v1-routeport"><span style="font-weight: 400;">RoutePort</span></a><span style="font-weight: 400;"> in </span><a href="https://docs.openshift.com/enterprise/3.2/rest_api/openshift_v1.html#v1-routespec"><span style="font-weight: 400;">RouteSpec</span></a> 
  <ol> 
   <li style="font-weight: 400;"><span style="font-weight: 400;">Solution: Just expose a single port in deployment config.</span></li> 
  </ol> </li> 
</ol> 

## Shared VIP Prerequisites 

Shared VIP routes require that parent VirtualService objects be pre-created.

Create at least two parent virtual services (one for HTTP and one for HTTPS) in every tenant where shared VIP routes are required. 

NB: Avi does not allow virtual services and pools to cross tenant boundaries, so each tenant requires at least one http and one HTTPS virtual service.

### Parent HTTP Virtual Service

* Switch to the appropriate tenant.<a href="img/Screen-Shot-2016-10-25-at-1.19.41-PM.png"><img class="aligncenter wp-image-16942" src="img/Screen-Shot-2016-10-25-at-1.19.41-PM.png" alt="switch to the appropriate tenant" width="600" height="94"></a> 
<a href="img/Screen-Shot-2016-10-25-at-1.21.45-PM.png"><img class="aligncenter wp-image-16944" src="img/Screen-Shot-2016-10-25-at-1.21.45-PM.png" alt="choose the tenant" width="300" height="278"></a> 
* Click Create Virtual Service and select the Advanced Setup wizard option.
<a href="img/Screen-Shot-2016-10-25-at-1.24.13-PM.png"><img class="aligncenter wp-image-16946" src="img/Screen-Shot-2016-10-25-at-1.24.13-PM.png" alt="Choos Advanced Setup wizard" width="600" height="57"></a> 
* Create a virtual service.  
    * Enter a virtual IP manually or auto-allocate from an IP address pool.
    * Select “Ignore Network reachability constraints for the server Pool”
    * Skip pool creation. Click Next until the virtual service has been successfully created.<a href="img/Screen-Shot-2016-10-25-at-1.25.24-PM.png"><img class="aligncenter wp-image-16948" src="img/Screen-Shot-2016-10-25-at-1.25.24-PM.png" alt="Step 1 in the Advanced Setup virtual service wizard" width="600" height="317"></a> 

### Parent HTTPS Virtual Service

* Switch to the appropriate tenant.<a href="img/Screen-Shot-2016-10-25-at-1.27.09-PM.png"><img class="aligncenter wp-image-16950" src="img/Screen-Shot-2016-10-25-at-1.27.09-PM.png" alt="switch to the appropriate tenant" width="600" height="92"></a><a href="img/Screen-Shot-2016-10-25-at-1.28.27-PM.png"><img class="aligncenter wp-image-16952" src="img/Screen-Shot-2016-10-25-at-1.28.27-PM.png" alt="select the tenant" width="300" height="279"></a> 
* Click Create Virtual Service and select the Advanced Setup wizard. 
* Create a virtual service.  
    * Enter a virtual IP manually or auto-allocate it from an IP address pool.
    * Select “Virtual Hosting VS” and “Parent.”
    * Select “SSL” in services.
    * Select “Ignore Network reachability constraints for the server Pool.”
    * Skip Pool creation. Click Next until your virtual service has been successfully created.<a href="img/Screen-Shot-2016-10-25-at-1.29.43-PM.png"><img class="aligncenter wp-image-16954" src="img/Screen-Shot-2016-10-25-at-1.29.43-PM.png" alt="Screen Shot 2016-10-25 at 1.29.43 PM" width="600" height="315"></a> 

# Route Configuration Examples

**NB**: The following examples assume the following cloud configuration.

* http_container_ports is configured with 80, 8080.
* use_service_cluster_ip_as_ew_vip is enabled (kube-proxy is disabled cluster wide).
* default_service_as_east_west_serviceis enabled (default: on).
* A Network object is created with an IP address pool for north-south VIPs; a north-south IPAM profile is created and linked to the Network object and the cloud is linked to the north-south IPAM profile.
* A Network object is created with a IP address pool for east-west VIPs; an east-west IPAM profile is created and linked to the Network object and the cloud is linked to the east-west IPAM profile. 

## Sample Deployment and Service 

The following deployment and service are examples for deploying HTTP pods.

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

Since default_service_as_east_west_serviceis enabled in the cloud configuration, this service creates an east-west virtual service.

If HTTPS pods are deployed, containerPort is usually 443 or 8443 and service port is 443 or 8443.

## Sample Routes 

### Dedicated VIP for Unsecured Route

The following sample route file creates a unsecured route with a dedicated VIP for service avisvc.

<pre><code class="language-lua">apiVersion: v1
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
metadata:
  name: aviroute
  annotations:
    avi_proxy: '{"virtualservice": {"auto_allocate_ip": true}}'</code></pre>  

Since the route_virtualserviceannotation is not present, this route will create its own virtual service and pool with a dedicated VIP. auto_allocate_ipasks that a VIP be allocated for this virtual service from the IPAM pool.

Each dedicated route will create its own virtual service and pool.

### Shared VIP for Unsecured Route

The following sample route file creates a unsecured route with VIP assigned for parent virtual service parent_http_virtualservicefor service avisvc.

<pre><code class="language-lua">apiVersion: v1
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
metadata:
  name: aviroute
  annotations:
    route_virtualservice: parent_http_virtualservice</code></pre>  

The annotation route_virtualserviceconfigures this as a shared VIP route for parent virtual service parent_http_virtualservice

NB: Parent virtual service parent_http_virtualserviceshould be pre-created.

Unsecured application will be created as a pool for the parent virtual service. Pool name will be of the form routename-aviroute-pool-port-protocol. For example. route name aviroute1will have a pool name aviroute1-aviroute-pool-http-tcp. An HTTP policy will provide host/path switching for the pool.

Route pool for unsecured service<a href="img/Screen-Shot-2016-10-25-at-1.31.22-PM.png"><img class="aligncenter wp-image-16956" src="img/Screen-Shot-2016-10-25-at-1.31.22-PM.png" alt="parent HTTP virtual service selected" width="600" height="87"></a>

HTTP rule for hostname/path switching to route pool<a href="img/Screen-Shot-2016-10-25-at-1.32.49-PM.png"><img class="aligncenter wp-image-16958" src="img/Screen-Shot-2016-10-25-at-1.32.49-PM.png" alt="HTTRP for hostname/path switching to route pool" width="600" height="318"></a>

### Dedicated VIP for Secured Route with Edge Termination With Certificate Data

The following sample route file creates a secured route with edge termination with a dedicated VIP for service avisvc.

<pre><code class="language-lua">apiVersion: v1                                                                                                      
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
  tls:
    termination: edge
    certificate: |-
      -----BEGIN CERTIFICATE-----
      MIIDsTCCApmgAwIBAgIJANX0VbJbXVUSMA0GCSqGSIb3DQEBCwUAMG8xCzAJBgNV            
     AYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRQwEgYDVQQHDAtTYW50
...
      T5vbDSdlZHM1m+xOjk3jz7nQjORxtsX4qsM0He5fNu1j/76dR4qmjAgx2qPWOGfS
      1I+9RjkgA7bOKIloz28GmCAOJDHdv2ecd0UbFsXu26s0WZFE4g==
      -----END CERTIFICATE-----
    key: |-
      -----BEGIN PRIVATE KEY-----
      MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDb6YAxPwee15eI
      KwUauaQcx23yBk1wV0DhN280WHQ86OIwyPmX7MoVicOwzq0fEzw/Zu+1YfV75+GE
...
      1katRly4cgYeryEX+enH4+N0GrZepL4fHTorflL0nuZMG9HA1MLwYCK3UADqLDJ6
      45f3rxRceTmBoh+nQI5QIWk=
      -----END PRIVATE KEY-----
metadata:
  name: aviroute
  annotations:
    avi_proxy: '{"virtualservice": {"auto_allocate_ip": true}}'</code></pre>  

Since the route_virtualserviceannotation is not present, this route will create its own virtual service and pool with a dedicated VIP.

### Shared VIP for Route With Edge Termination With Certificate Data

The following sample route file creates a secured route with edge termination with VIP assigned for parent virtual service parent_https_virtualservicefor service avisvc.

<pre><code class="language-lua">apiVersion: v1                                                                                                      
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
  tls:
    termination: edge
    certificate: |-
      -----BEGIN CERTIFICATE-----
      MIIDsTCCApmgAwIBAgIJANX0VbJbXVUSMA0GCSqGSIb3DQEBCwUAMG8xCzAJBgNV            
     AYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRQwEgYDVQQHDAtTYW50
...
      T5vbDSdlZHM1m+xOjk3jz7nQjORxtsX4qsM0He5fNu1j/76dR4qmjAgx2qPWOGfS
      1I+9RjkgA7bOKIloz28GmCAOJDHdv2ecd0UbFsXu26s0WZFE4g==
      -----END CERTIFICATE-----
    key: |-
      -----BEGIN PRIVATE KEY-----
      MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDb6YAxPwee15eI
      KwUauaQcx23yBk1wV0DhN280WHQ86OIwyPmX7MoVicOwzq0fEzw/Zu+1YfV75+GE
...
      1katRly4cgYeryEX+enH4+N0GrZepL4fHTorflL0nuZMG9HA1MLwYCK3UADqLDJ6
      45f3rxRceTmBoh+nQI5QIWk=
      -----END PRIVATE KEY-----
metadata:
  name: aviroute
  annotations:
    route_virtualservice: parent_https_vs</code></pre>  

The annotation route_virtualserviceconfigures this as a shared VIP route for parent virtual service parent_https_virtualservice. auto_allocate_ipasks that a VIP be allocated for this virtual service.

NB: Parent VirtualService parent_https_virtualserviceshould be pre-created.

Secure route with a shared VIP will create a SNI based child VirtualService/Pool.

Child SNI VirtualService/Pool<a href="img/Screen-Shot-2016-10-25-at-1.33.59-PM.png"><img class="aligncenter wp-image-16960" src="img/Screen-Shot-2016-10-25-at-1.33.59-PM.png" alt="child SNI virtual service/pool" width="600" height="173"></a>

### Dedicated VIP Secured Route With Edge Termination With Certificate Name

Providing a SSL certificate/key in a text route file is not secure. SSL certificates can be created on an Avi Controller prior to the route creation. The following sample route file creates a secured route with edge termination with a reference to a certificate name instead of providing certificate data in the route file.

<pre><code class="language-lua">apiVersion: v1
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
  tls:
    termination: edge
metadata:
  name: aviroute
  annotations:
    avi_proxy: '{"virtualservice": {"auto_allocate_ip": true, "ssl_key_and_certificate_refs": ["foocertificate"]}}'</code></pre>  

### Dedicated VIP Secured Route With Edge Termination, insecureEdgeTerminationPolicy Allowing HTTP Traffic With a Certificate Name

The following sample route file creates a secured route with edge termination with a reference to a certificate name instead of providing certificate data in the route file.

<pre><code class="language-lua">apiVersion: v1
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
  tls:
    termination: edge
    insecureEdgeTerminationPolicy: Allow
metadata:
  name: aviroute
  annotations:
    avi_proxy: '{"virtualservice": {"auto_allocate_ip": true, "ssl_key_and_certificate_refs": ["cert1"]}}'</code></pre>  

### Dedicated VIP Secured Route With Edge Termination, Re-encryption and insecureEdgeTerminationPolicy Serving a Redirect for HTTP Traffic

The following sample route file creates a secured route with edge termination and re-encryption.

<pre><code class="language-lua">apiVersion: v1                                                                                                      
kind: Route
spec:
  host: aviroute.local
  to:
    kind: Service
    name: avisvc
  tls:
    termination: reencrypt
    certificate: |-
      -----BEGIN CERTIFICATE-----
      MIIDsTCCApmgAwIBAgIJANX0VbJbXVUSMA0GCSqGSIb3DQEBCwUAMG8xCzAJBgNV            
     AYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRQwEgYDVQQHDAtTYW50
...
      T5vbDSdlZHM1m+xOjk3jz7nQjORxtsX4qsM0He5fNu1j/76dR4qmjAgx2qPWOGfS
      1I+9RjkgA7bOKIloz28GmCAOJDHdv2ecd0UbFsXu26s0WZFE4g==
      -----END CERTIFICATE-----
    key: |-
      -----BEGIN PRIVATE KEY-----
      MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDb6YAxPwee15eI
      KwUauaQcx23yBk1wV0DhN280WHQ86OIwyPmX7MoVicOwzq0fEzw/Zu+1YfV75+GE
...
      1katRly4cgYeryEX+enH4+N0GrZepL4fHTorflL0nuZMG9HA1MLwYCK3UADqLDJ6
      45f3rxRceTmBoh+nQI5QIWk=
      -----END PRIVATE KEY-----
metadata:
  name: aviroute
  annotations:
    avi_proxy: '{"virtualservice": {"auto_allocate_ip": true}}'</code></pre>  

Since insecureEdgeTerminationPolicyis absent, the default behavior in such cases is to redirect HTTP traffic to HTTPS.

# Automatic Configuration

The following fields in the VirtualServices and Pools objects are automatically derived from OpenShift routes by the cloud connector.

<table class="table table-hover table table-bordered table-hover">  
<tbody>              
<tr>    
<td><b>VirtualService Field</b></td>
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
<td><span style="font-weight: 400;">host</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">ip_address</span></td>
<td><span style="font-weight: 400;">Dedicated VIP: Can be explicitly specified via annotations or auto-allocated from the north-south IPAM object. For auto-allocation, auto_allocate_ip should be set to true via annotations. </span><p></p> <p><span style="font-weight: 400;">Shared VIP: If parent virtual service is specified, ip_address isn’t required.</span></p></td>
<td><span style="font-weight: 400;">E.g. auto-allocation</span><i><span style="font-weight: 400;">: </span></i><p></p> <p><i><span style="font-weight: 400;">annotations:</span></i></p> <p><i><span style="font-weight: 400;"> avi_proxy: '{"virtualservice": {"auto_allocate_ip": true}}'</span></i></p></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">services</span></td>
<td><i><span style="font-weight: 400;">port</span></i><span style="font-weight: 400;"> field in the corresponding service</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">application_profile</span></td>
<td><span style="font-weight: 400;">Always </span><i><span style="font-weight: 400;">Layer7</span></i></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">network_profile</span></td>
<td><span style="font-weight: 400;">Always </span><i><span style="font-weight: 400;">System-TCP-Proxy</span></i></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">pool</span></td>
<td><span style="font-weight: 400;">Default pool corresponding to service</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">network_security_policy</span></td>
<td><span style="font-weight: 400;">A default network security policy is created for every new or child SNI virtual service</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">http_policies</span></td>
<td><span style="font-weight: 400;">Shared VIP: Used for switching host/route to pools for unsecured routes</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">microservice</span></td>
<td><span style="font-weight: 400;">A microservice is automatically created for every new or child SNI virtual service</span></td>
<td></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">east_west_placement</span></td>
<td><span style="font-weight: 400;">Always north-south</span></td>
<td></td>
</tr>
</tbody>
</table> 