---
title: Mesos in AWS&#58; Deploying a North-South Application
layout: layout162
---
This article describes how to deploy and verify load-balanced application in a Mesos / Marathon cloud hosted by Amazon Web Services (AWS).

Applications must be created through Marathon, for example with a *curl* command through the CLI or using the "avi_proxy" label in a CloudFormation template. This article includes steps for creating a simple test application using the Marathon CLI. To create an application using labels, see <a href="/docs/16.2/creating-applications-in-mesos-with-marathon-labels/">here</a>.

To deploy a service in this environment:
<ol> 
 <li> <p>Create the application through Marathon.</p> </li> 
 <li> <p>Set the health check and application port numbers in the AWS EC2 instance to the port number assigned to the application by Marathon.</p> </li> 
 <li> <p>Use a browser to navigate to the application.</p> </li> 
</ol> 

Detailed steps are provided below.

## Requirements

The article assumes that Avi Vantage is already <a href="/docs/16.2/installation-guides/installing-mesos-aws-using-the-vantage-cloudformation-template/">installed</a> in the Mesos / Marathon cloud.

The steps in this article require access to the following resources:

* Marathon account with privileges to create an application through Marathon 
* AWS account through which Avi Vantage was installed 
* User account on Avi Controller 
* Docker application (if creating a new application using the CLI)  

## Create an Application Through Marathon

The following commands are entered in an SSH session with Marathon to create a test application:
<ol> 
 <li> <p>Download Docker.json (<a href="https://s3uswest1.amazonaws.com/avitm/Docker.json">https://s3uswest1.amazonaws.com/avitm/Docker.json</a>) and save it in the /Downloads directory.</p> </li> 
 <li> <p>Create a Docker image file such as the following for the application:</p> <pre crayon="false" class="command-line language-bash" data-user="aviuser" data-host="avihost" data-output="1-100" white-space="pre"><code>
{
  "id": "webapp-ew1",
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
  "labels": {}"
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
</code></pre> </li> 
 <li> Start the application to create a virtual service for it: <pre crayon="false" class="command-line language-bash" data-user="aviuser" data-host="avihost"><code>curl -H "Content­Type: application/json" -X POST -d@Downloads/Docker.json http://marathon-ip-or-hostname:8080/v2/apps</code></pre> <p> The H and X options are required. The H option inserts a Content­Type header for the Avi SE application. The X option changes the HTML method of the request from GET (the default) to POST. Replace marathon-ip-or-hostname with the IP address or hostname of Marathon. </p></li> 
</ol> 

## Set the Health-check and Application Port Numbers

<ol> 
 <li> <p>Locate the port number assigned to the application by Marathon:</p> <p>a. Log into the Avi Controller web interface.</p> <p>b. Navigate to Applications &gt; Dashboard, and click on the icon for the virtual service.</p> <p>c. Hover over the virtual service name, to the left of the Edit button. Copy or write down the port number. <a href="img/aws-mesos-vscreate0.jpg"><img src="img/aws-mesos-vscreate0.jpg" alt="aws-mesos-vscreate0" width="432" height="279" class="alignnone size-full wp-image-4613"></a></p> </li> 
 <li> <p>Log into your AWS account, and browse to EC2 Load Balancing instance.</p> </li> 
 <li> <p>Click on <span style="display:inline-block"><img src="img/aws-home-icon.jpg" alt="edit-icon" width="22" height="22" class="alignnone size-full wp-image-3558"></span> to go to the AWS home page.</p> </li> 
 <li> <p>Select EC2 and click on Load Balancing in the left pane.</p> </li> 
 <li> <p>Click on <em>stack-name</em>-public instance in the Load Balancer field as shown in this example: <a href="img/aws-mesos-vscreate.jpg"><img src="img/aws-mesos-vscreate.jpg" alt="aws-mesos-vscreate" width="528" height="228" class="alignnone size-full wp-image-4614"></a></p> </li> 
 <li> <p>Click on the Listeners tab and edit the application port number to the application port number assigned by Marathon. <a href="img/aws-mesos-vscreate2.jpg"><img src="img/aws-mesos-vscreate2.jpg" alt="aws-mesos-vscreate2" width="528" height="225" class="alignnone size-full wp-image-4616"></a></p> </li> 
 <li> <p>Click on the Health Check tab and edit the ELB health check port number to the application port number assigned by Marathon. <a href="img/aws-mesos-vscreate3.jpg"><img src="img/aws-mesos-vscreate3.jpg" alt="aws-mesos-vscreate3" width="528" height="225" class="alignnone size-full wp-image-4615"></a></p> </li> 
</ol> 

## Browse to the Application

<ol> 
 <li> <p>In AWS, click on the Description tab for the ELB instance. <a href="img/aws-mesos-vscreate4.jpg"><img src="img/aws-mesos-vscreate4.jpg" alt="aws-mesos-vscreate4" width="528" height="259" class="alignnone size-full wp-image-4617"></a></p> </li> 
 <li> <p>Copy-and-paste the DNS name (URL) into a new browser window. <a href="img/aws-mesos-vscreate5.jpg"><img src="img/aws-mesos-vscreate5.jpg" alt="aws-mesos-vscreate5" width="528" height="114" class="alignnone size-full wp-image-4618"></a></p> </li> 
</ol> 