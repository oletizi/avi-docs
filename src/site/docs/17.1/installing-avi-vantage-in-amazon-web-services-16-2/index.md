---
title: Installing Avi Vantage in Amazon Web Services (16&#46;2+)
layout: layout163
---
This guide describes how to install an Amazon Web Services (AWS) EC2 instance of Avi Vantage. The instructions in this guide can be used for installing Avi Vantage 16.2 and subsequent releases.

Also of interest: <a href="{% vpath %}/aws-cross-account-assumerole-support/">AWS Cross-Account AssumeRole Support</a>

## 1. About Avi Vantage

Avi Vantage consists of the Avi Controller and multiple Avi Service Engines (SEs). The Avi Controller analyzes traffic and, based on real-time analytics, can scale out / scale in SEs to load-balance traffic that may vary over time.

## 2. Deployment Prerequisites

### Knowledge of AWS VPC

Knowledge of <a href="http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Introduction.html">AWS VPC</a> (Virtual Private Cloud) is required for configuring your network space (e.g., availability zone, subnets of Controller and SEs).

All IP addresses (e.g., Controller management IP, SE management IP, virtual service IPs, and server IP addresses) need to be planned and configured accordingly.

## 3. Credential Method

When deploying Avi Vantage within Amazon Web Services (AWS), the installation wizard prompts for input of credential information.
You are not required to enter AWS Secret and Access key credentials. The credentials can be entered in either of the following forms:

* **Identity and Access Management (IAM) roles:** A set of policies that define access to resources within AWS. The roles and the policies that define their access are defined in JSON files. This method does not require an AWS account key. Instead, the role and policy files must be downloaded from Avi Networks and installed using the AWS CLI. (Download links for the role and policy files, and the required AWS CLI syntax, are provided in <a href="{% vpath %}/iam-role-setup-for-installation-into-aws/">this article</a>.) After setting up the IAM roles, return to this article to install the Avi Vantage EC2 instance. Use this method if you don't want to enter AWS credentials.
* **AWS customer account key:** A unique authentication key associated with the AWS account. If using this method, continue reading.

## 4. Protocol Ports Used by Avi Vantage for Management Communication

In an AWS deployment, the Avi Controller and Avi Service Engines use the following ports for management. The firewall should allow traffic for these ports.
<table class="table table table-bordered table-hover">  
<tbody>       
<tr>    
<th>Traffic Source
</th>
<th>Traffic Destination
</th>
<th>Ports To Allow
</th>
</tr>
<tr>    
<td rowspan="3">Avi Controller</td>
<td>Avi Controller</td>
<td>TCP 22 (SSH)<p></p> <p>TCP 8443</p> <p>TCP 5054</p></td>
</tr>
<tr>   
<td>Avi Service Engine</td>
<td>TCP 22</td>
</tr>
<tr>   
<td>Management Net</td>
<td><em>See section below the table.</em></td>
</tr>
<tr>    
<td>Avi Service Engine</td>
<td rowspan="2">Avi Controller</td>
<td>TCP 22<p></p> <p>TCP 8443</p> <p>UDP 123</p></td>
</tr>
<tr>   
<td>Management Net</td>
<td>TCP 22<p></p> <p>TCP 80 <em>(optional)</em></p> <p>TCP 443</p> <p>TCP 5054 <em>(if using the optional <a href="{% vpath %}/cli-installing-the-cli-shell/">CLI shell</a> for remote<br> management access)</em></p></td>
</tr>
</tbody>
</table>  

### 4.1 Ports Used by the Controller for Network Services

The Controller may send traffic to the following UDP ports as part of network operation:

* TCP 25 (SMTP)
* UDP 53 (DNS)
* UDP 123 (NTP)
* UDP 162 (SNMP traps)
* UDP 514 (Syslog) 

The firewall also should allow traffic from the Controller to these ports.

## 5. Installation

To install Avi Vantage in AWS, deploy an EC2 instance of the Avi Controller; then run the Avi Controller setup wizard.

### 5.1 Deploying an EC2 Avi Controller Instance

<ol>
 <ol>
  <li>Access Amazon Web Services (AWS) using<a href="https://aws.amazon.com"> https://aws.amazon.com</a> and log in using your AWS credentials.</li>
  <li>Go to the Avi Vantage page on AWS Marketplace <a href="https://aws.amazon.com/marketplace/pp/B01ICD3R7E">here</a>. <a href="img/avi_aws_marketplace_01.png"><img class="alignnone size-full wp-image-24107" src="img/avi_aws_marketplace_01.png" alt="Avi Vantage on AWS Marketplace" width="2559" height="1277"></a></li>
 </ol>
</ol>

 

<ol>
 <li>Click Continue to start the AMI deployment process. You can either perform a 1-Click launch or a Manual Launch via the EC2 console, API, or CLI. The subsequent screenshots  below go through the Manual (EC2 Console) installation process.<br> <a href="img/avi_aws_marketplace_02.png"><img class="alignnone size-full wp-image-24109" src="img/avi_aws_marketplace_02.png" alt="AVI AWS AMI" width="2558" height="1284"></a></li>
 <li>Based on deployment scale considerations, choose an appropriate instance type. Amazon defines its EC2 instance types <a href="https://aws.amazon.com/ec2/instance-types/">here</a>. The following table lists the minimum requirements for the VMs on which the Avi Controller and Avi SEs are installed.
  <div></div> 
  <table class="table"> 
   <tbody> 
    <tr> 
     <th width="60%">Component</th> 
     <th>Memory</th> 
     <th>vCPUs</th> 
     <th>Disk</th> 
    </tr> 
    <tr> 
     <td>Avi Controller</td> 
     <td>24 GB</td> 
     <td>8</td> 
     <td>64 GB</td> 
    </tr> 
    <tr> 
     <td>Service Engine</td> 
     <td>2 GB</td> 
     <td>2</td> 
     <td>10 GB</td> 
    </tr> 
   </tbody> 
  </table> <p> </p></li>
 <li>For the Avi Controller, Avi recommends the following Instance Types:
  <div></div>
  <table class="table">
   <tbody>
    <tr>
     <th width="60%">Deployment Size</th>
     <th>Virtual Service Scale</th>
     <th>Instance Type</th>
     <th>Memory</th>
     <th>vCPUs</th>
     <th>Disk (Minimum)</th>
    </tr>
    <tr>
     <td>Small</td>
     <td>100</td>
     <td>m4.2xlarge</td>
     <td>32 GB</td>
     <td>8</td>
     <td>64 GB</td>
    </tr>
    <tr>
     <td>Medium</td>
     <td>1000</td>
     <td>c4.4xlarge /<br> m4.4xlarge</td>
     <td>30 GB /<br> 64 GB</td>
     <td>16 / 16</td>
     <td>64 GB</td>
    </tr>
    <tr>
     <td>Large</td>
     <td>5000</td>
     <td>c4.8xlarge /<br> m4.10xlarge</td>
     <td>60 GB /<br> 160 GB</td>
     <td>32 /<br> 40</td>
     <td>64 GB</td>
    </tr>
   </tbody>
  </table> <p>Refer to the section <em>Disk Capacity Allocation</em> on the <a href="/avi-controller-sizing">Avi Controller Sizing KB</a> for recommended hard disk size.</p> <p>For added resiliency and redundancy, the Avi Controller can be deployed as a 3-node cluster. [See <a href="/overview-of-vantage-high-availability/">Overview of Vantage High Availability</a>.] In this case, a separate VM is needed for each of the 3 Avi Controller nodes. The requirements are the same for each node.</p> <p>At the time of this writing, Avi supports only 1 data vNIC per SE.</p> <p>The below example shows a choice of 4 CPUs and 16 GB memory.</p> <p><img class="alignnone size-full wp-image-12830" src="img/m4_xlarge_instance.png" alt="m4_xlarge_instance" width="2880" height="1800"></p></li>
 <li>Select the appropriate VPC from the Network pull-down list and select the network from the Subnet pull-down list. This is the subnet in which the Controller will get the IP for the management NIC. Also, select the Enable termination protection option.<br> <a href="img/VPC_options.png"><img class="alignnone size-full wp-image-12909" src="img/VPC_options.png" alt="VPC_options" width="2870" height="1795"></a>Note: If installing with an <a href="/iam-role-setup-for-installation-into-aws/">IAM role</a> instead of an AWS customer account key, select IAM role if you have created as explained in <a href="/installing-avi-vantage-in-amazon-web-services-16-2/#3_Credential_Method">Credential Method</a>. In this example we have used the IAM Role "AviController-Refined-Role."</li>
 <li>In the Size (G/B) field, enter 64 to allocate 64 GB to the Avi Controller instance, and go to the "Next:Tag Instance" option.<a href="img/Storage.png"><img class="alignnone size-full wp-image-12844" src="img/Storage.png" alt="Storage" width="2880" height="1800"></a></li>
 <li>Enter a name for this Avi Controller instance.<a href="img/Tag_instance.png"><img class="alignnone size-full wp-image-12846" src="img/Tag_instance.png" alt="Tag_instance" width="2868" height="1794"></a></li> 
 <li>Create a security group that allows <a href="{% vpath %}/protocol-ports-used-by-avi-vantage-for-management-communication/">traffic<br> through the firewall</a>, to allow management communication between the Avi Controller and the Avi Service Engines<br> (SEs)<a href="img/Security_group.png"><img class="alignnone size-full wp-image-12840" src="img/Security_group.png" alt="Security_group" width="2880" height="1800"></a></li>
 <li>(Optional) Select SSD as the storage type. (This enhances the responsiveness of the Avi Controller web interface.) <a href="img/SSD.png"><img class="alignnone size-full wp-image-12842" src="img/SSD.png" alt="SSD" width="2880" height="1795"></a></li>
 <li>Review your EC2 instance, and click Launch. <a href="img/Review_instance_launch.png"><img class="alignnone size-full wp-image-12834" src="img/Review_instance_launch.png" alt="Review_instance_launch" width="2880" height="1800"></a></li> 
 <li><strong>Key pair settings:<br> </strong><p></p> 
  <ul> 
   <li>If you don't have key pair, create new key pair. After downloading the key pair, change the permissions to "400" (chmod 400 ".pem") to do SSH.<br> <img class="alignnone size-full wp-image-12832" src="img/New_key_pair.png" alt="New_key_pair" width="2880" height="1800"></li>
   <li>If you have key pair, select a key pair for AMI authentication.<br> <img class="alignnone size-full wp-image-12824" src="img/Existing_key_pair.png" alt="Existing_key_pair" width="2880" height="1800"></li> 
  </ul> <p> </p></li> 
 <li>The deployment status of the Avi Controller EC2 instance into AWS is displayed. When the instance is ready (status "running"), you can access the instance using a private or public IP address. Wait for all checks to pass before setting up the Controller. <a href="img/running_instance.png"><img class="alignnone size-full wp-image-12836" src="img/running_instance.png" alt="running_instance" width="2870" height="1798"></a></li>
</ol> 

### 5.2 Setting Up the Avi Controller Instance

After deploying an EC2 instance of the Avi Controller, use a browser to navigate to the Avi Controller's management IP address (10.144.137.13 for our case as shown in the previous steps) to start the setup wizard.
<ol class="md-ignore">
 <ol class="md-ignore">
  <ol class="md-ignore">
   <ul>
    <li>Configure basic system settings:
     <ul>
      <li>Administrator account</li>
      <li>Network DNS and NTP server information</li>
      <li>Email and SMTP information</li>
     </ul> </li>
   </ul>
  </ol>
 </ol>
</ol>


<a href="img/AVI_setup.png"><img class="wp-image-12814 aligncenter" src="img/AVI_setup.png" alt="AVI_setup" width="282" height="402"></a>


<a href="img/Fig2.png"><img class="wp-image-11588 aligncenter" src="img/Fig2.png" alt="Fig2" width="293" height="356"></a>

<a href="img/email_SMTP_settings.png"><img class="aligncenter wp-image-20544" src="img/email_SMTP_settings.png" alt="email_SMTP_settings" width="293" height="260"></a>
<ol class="md-ignore">
 <ol class="md-ignore">
  <ol class="md-ignore">
   <ul>
    <li>Select Amazon Web Services as the infrastructure type:</li>
   </ul>
  </ol>
 </ol>
</ol>


<a href="img/aws-install-ctlrsetup-infra-262.png"><img class="wp-image-9505 aligncenter" src="img/aws-install-ctlrsetup-infra-262.png" alt="aws-install-ctlrsetup-infra-262" width="219" height="348"></a>

<ol class="md-ignore">
 <ol class="md-ignore">
  <ol class="md-ignore">
   <ul>
    <li>Enter AWS account settings:
     <ul>
      <li>Access credentials are needed by the Avi Controller to communicate with AWS API. Enter the access key and secret access key.<a href="img/AWS_credentials-1.png"><img class="wp-image-12876 aligncenter" src="img/AWS_credentials-1.png" alt="AWS_credentials" width="250" height="342"></a></li>
      <li>(Optional) Proxy Host and Proxy Port: Complete these fields if there is a custom proxy between your corporate network and AWS.<a href="img/AWS_proxy.png"><img class="wp-image-12878 aligncenter" src="img/AWS_proxy.png" alt="AWS_proxy" width="263" height="415"></a></li>
      <li>If using an <a href="/iam-role-setup-for-installation-into-aws/">IAM role</a>, instead select Use AWS IAM Roles.<img class="wp-image-12826 aligncenter" src="img/IAM.png" alt="IAM" width="265" height="262"></li>
      <li>Configure SE Management Network. This is the subnet in which the Controller will place the management VNIC of SEs. The management network of SE should be reachable from Controller management IP.<br> Note: While creating virtual service, make sure to select a VIP subnet that has reachability to the SE's management subnet.</li>
     </ul> </li>
   </ul>
  </ol>
 </ol>
</ol>

<a href="img/SE-management-nw.png"><img class="wp-image-12838 aligncenter" src="img/SE-management-nw.png" alt="SE management nw" width="334" height="329"></a>

<ol class="md-ignore">
 <ol class="md-ignore">
  <ol class="md-ignore">
   <ul>
    <li>Configure tenancy settings.<a href="img/VMware-deploy-WriteAccessmode-Ctlr-setup-multtenantsbox-162.png"><img class="wp-image-9418 aligncenter" src="img/VMware-deploy-WriteAccessmode-Ctlr-setup-multtenantsbox-162.png" alt="VMware-deploy-WriteAccessmode-Ctlr-setup-multtenantsbox-162" width="214" height="173"></a></li>
    <li>To verify the installation, navigate to Infrastructure &gt; Clouds, click Default-Cloud, and then click the Status button.<a href="img/cloud_progress.png"><img class="alignnone size-full wp-image-12820" src="img/cloud_progress.png" alt="cloud_progress" width="2871" height="805"></a></li>
    <li><a href="img/cloud_green.png"><span style="color: #000000;">Status should turn green, indicating the installation was successful.</span><img class="alignnone size-full wp-image-12818" src="img/cloud_green.png" alt="cloud_green" width="2867" height="798"></a></li>
   </ul>
  </ol>
 </ol>
</ol>

This completes the installation process. The Avi Controller is now ready for <a href="/docs/configuration-guide/applications/virtual-services/create-virtual-service/">deploying virtual services</a>.

### A Note on Instance Types for the Avi Service Engines:

Avi Service Engines are deployed on AWS automatically by the Avi Controller, as required for the virtual services that have been configured.

Avi SEs can be run on various Instance Types. This can be configured under the "Service Engine Group" -> Advanced setting.

On a per-instance-type basis <a href="http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI">this AWS table</a> shows the maximum number of network interfaces, as well as the maximum number of IPv4 and IPv6 addresses per interface.

The below table shows the maximum SSL TPS performance achievable on some EC2 instance types.

<table class="table table table-bordered table-hover">
<tbody>
<tr>
<th>Instance Type
</th>
<th>SSL TPS Performance
</th>
</tr>
<tr>
<td>c4.large</td>
<td>2,400</td>
</tr>
<tr>
<td>c4.xlarge</td>
<td>4,900</td>
</tr>
<tr>
<td>c4.4xlarge</td>
<td>19,000</td>
</tr>
</tbody>
</table>

Notes :

<ol class="md-ignore">
 <li>Currently Avi uses 1 data vNIC for all data traffic. This is apart from the 1 vNIC used for control-plane communication with the Avi Controllers and other Service Engines.</li>
 <li>SSL performance (TPS - transactions per second) has been measured with 1 virtual service configured (HTTPS, EC certificate) and GET requests for a 128-byte payload without session reuse. More details regarding Service Engine performance can be found <a href="/ssl-performance/">here</a>.</li>
</ol>

.

