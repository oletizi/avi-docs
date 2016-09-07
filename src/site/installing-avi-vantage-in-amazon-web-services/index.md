---
title: Installing Avi Vantage in Amazon Web Services
layout: default
---
This guide describes how to install an Amazon Web Services (AWS) EC2 instance of Avi Vantage. The instructions in this guide can be used for installing Avi Vantage 16.1.*x*.

## About Avi Vantage

Avi Vantage consists of the Avi Controller and multiple Avi Service Engines (SEs). The Avi Controller analyzes traffic and can request spin-up/spin-down of SEs to load balance traffic.

## Credential Method

When deploying Avi Vantage within Amazon Web Services (AWS), the installation wizard prompts for input of credential information. You are not required to enter AWS Secret and Access key credentials.The credentials can be entered in either of the following forms:

* **Identity and Access Management (IAM) roles:** A set of policies that define access to resources within AWS. The roles and the policies that define their access are defined in JSON files. This method does not require an AWS account key. Instead, the role and policy files must be downloaded from Avi Networks and installed using the AWS CLI. (Download links for the role and policy files, and the required AWS CLI syntax, are provided in <a href="/iam-role-setup-for-installation-into-aws/">this article</a>.) After setting up the IAM roles, return to this article to install the Avi Vantage EC2 instance. Use this method if you don't want to enter AWS credentials.
* **AWS customer account key:** A unique authentication key associated with the AWS account. If using this method, continue reading.

## Protocol Ports Used by Avi Vantage for Management Communication

In an AWS deployment, the Avi Controller and Avi Service Engines use the following ports for management. The firewall should allow traffic for these ports.
Traffic Source Traffic Destination Ports To Allow Avi Controller Avi Controller TCP 22 (SSH)
TCP 8443
TCP 5054 Avi Service Engine TCP 22 Mgmt Net *See section below the table.* Avi Service Engine Avi Controller TCP 22
TCP 8443
UDP 123 Mgmt Net TCP 22
TCP 80 *(optional)*
TCP 443
TCP 5054 *(if using the optional <a href="/2016/02/26/cli-installing-the-cli-shell/">CLI shell</a> for remote management access)*

### Ports Used by Controller for Network Services

The Controller may send traffic to the following UDP ports as part of network operation:

* TCP 25 (SMTP)
* UDP 53 (DNS)
* UDP 123 (NTP)
* UDP 162 (SNMP traps)
* UDP 514 (Syslog)

The firewall also should allow traffic from the Controller to these ports.

## Installation

To install Avi Vantage in AWS, deploy an EC2 instance of the Avi Controller, then run the Avi Controller setup wizard.

### Deploying an EC2 Avi Controller Instance

1. Access Amazon Web Services (AWS) using https://aws.amazon.com and log in using your AWS credentials.
1. Click on EC2 to go to the Virtual Machine deployment options. <a href="img/aws-install-awsconsole1-2.png"><img src="img/aws-install-awsconsole1-2.png" alt="aws-install-awsconsole1" width="1148" height="671"></a>
1. Click on Launch Instance to start the EC2 deployment process. <a href="img/aws-install-awsconsole2-1.png"><img src="img/aws-install-awsconsole2-1.png" alt="aws-install-awsconsole2" width="1145" height="672"></a>
1. Click on My AMIs in the left pane and select (checkmark) Shared with me. Filter the list to display AMIs that have the Avi-Controller tag. The Avi Vantage AMI should be listed, with name “Avi-Controller-<Version>”. For example, select AMI Avi-Controller-16.1-9018 AMI to deploy Avi Vantage Controller version 16.1 onto a virtual machine (VM). <a href="img/aws-install-awsconsole3-1.png"><img src="img/aws-install-awsconsole3-1.png" alt="aws-install-awsconsole3" width="1150" height="651"></a>
1. Choose instance type m4.xlarge from the Instance Type pull-down list, and click Next.Note: While this example shows 4 CPUs and 16 MB memory, the recommendation for Avi Controller nodes is 8 CPUs and 24 MB memory.<a href="img/aws-install-awsconsole4-2.png"><img src="img/aws-install-awsconsole4-2.png" alt="aws-install-awsconsole4" width="1147" height="652"></a>
1. Select the appropriate VPC from the Network pull-down list and select the management network from the Subnet pull-down list. Also select the Enable termination protection option.<a href="img/aws-install-awsconsole5-updated.png"><img src="img/aws-install-awsconsole5-updated.png" alt="aws-install-awsconsole5-updated" width="1148" height="650"></a>Note: If installing with an <a href="/iam-role-setup-for-installation-into-aws/">IAM role</a> instead of an AWS customer account key, select role AviController-Refined-Role. (If a name other than AviController-Refined-Role was used when setting up the role, select that role name instead.)
1. In the Size (G/B) field, enter 64 to allocate 64 GB to the Avi Controller instance, and click Next.<a href="img/aws-install-awsconsole6-2.png"><img src="img/aws-install-awsconsole6-2.png" alt="aws-install-awsconsole6" width="1146" height="649"></a>
1. Enter a name for the Avi Controller instance. <a href="img/aws-install-awsconsole7-2.png"><img src="img/aws-install-awsconsole7-2.png" alt="aws-install-awsconsole7" width="1148" height="651"></a>
1. Create a security group that allows <a href="/protocol-ports-used-by-vantage-for-management-communication/">traffic through the firewall</a>, to allow management communication between the Avi Controller and the Avi Service Engines (SEs).<a href="img/aws-install-awsconsole8-1.png"><img src="img/aws-install-awsconsole8-1.png" alt="aws-install-awsconsole8" width="1148" height="650"></a>
1. (Optional) Select SSD as the storage type. (This enhances the responsiveness of the Avi Controller web interface.) <a href="img/aws-install-awsconsole9-1.png"><img src="img/aws-install-awsconsole9-1.png" alt="aws-install-awsconsole9" width="1149" height="649"></a>
1. Review your EC2 instance, and click Launch. <a href="img/aws-install-awsconsole10-1.png"><img src="img/aws-install-awsconsole10-1.png" alt="aws-install-awsconsole10" width="1149" height="672"></a>Select a key pair for AMI authentication or create a new key pair.
<a href="img/aws-install-awsconsole11-1.png"><img src="img/aws-install-awsconsole11-1.png" alt="aws-install-awsconsole11" width="1149" height="672"></a>
1. The deployment status of the Avi Controller EC2 instance into AWS is displayed. When the instance is ready (status "running"), you can access the instance using a private or public IP address.<a href="img/aws-install-awsconsole12-2.png"><img src="img/aws-install-awsconsole12-2.png" alt="aws-install-awsconsole12" width="1147" height="646"></a>

### Setting Up the Avi Controller Instance

After deploying an EC2 instance of the Avi Controller, use a browser to navigate to the Avi Controller's management IP address to start the setup wizard.

1. Configure basic system settings:

* Administrator account
* DNS and NTP server information
<img src="img/aws-install-ctlrsetup1.png" alt="" width="275" height="406" align="left"> <img src="img/aws-install-ctlrsetup2.png" alt="" width="275" height="357" align="left" hspace="12" vspace="6">
* Select AWS as the infrastructure type:

<img src="img/aws-install-ctlrsetup3.png" alt="" width="275" height="436" align="left">
* Enter AWS account settings:

* Access key and secret key: needed by the Avi Controller to communicate with AWS API.

<img src="img/aws-install-ctlrsetup4.png" alt="aws-install-ctlrsetup4" width="275" height="360">

* Use AWS IAM roles: can be selected if the Avi Controller VM in AWS was created using an <a href="/iam-role-setup-for-installation-into-aws/">appropriate IAM role</a>.

<img src="img/aws-install-ctlrsetup5.png" alt="aws-install-ctlrsetup5" width="275" height="262">

* Proxy IP and port: if using a custom proxy configuration between your corporate network and AWS.

<img src="img/aws-install-ctlrsetup6.png" alt="aws-install-ctlrsetup6" width="275" height="410">
* Configure network settings.
<img src="img/aws-install-ctlrsetup7.png" alt="aws-install-ctlrsetup7" width="275" height="185">
* Configure tenancy settings.
<img src="img/aws-install-ctlrsetup8.png" alt="aws-install-ctlrsetup8" width="275" height="222">

 

This completes the installation process. The Avi Controller is now ready for <a href="/docs/configuration-guide/applications/virtual-services/create-virtual-service/">deploying virtual services</a>.