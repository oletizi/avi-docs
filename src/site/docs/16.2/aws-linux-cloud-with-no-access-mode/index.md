---
title: AWS Linux Cloud with No-access Mode
layout: default
---
This article describes how to set up IP address management (IPAM) in an Avi Vantage deployment onto a Linux server cloud 
in Amazon Web Services (AWS). These steps deploy Avi Vantage into AWS in no <a href="/docs/16.2/orchestrator-access-modes">access mode</a>.

The setup process consists of the following tasks:

* Create a <a href="/docs/16.2/iam-role-setup-for-installation-into-aws">role in IAM</a> using the supplied JSON file: avicontroller-role-ipam-policy.json
* Launch the Avi Controller using the IAM role. This starts the setup wizard.
* Afer initial setup, use the Avi Controller web interface to edit the Default-Cloud to add Linux server cloud settings, including the IP address management (IPAM) profile.
* Use the Avi Controller CLI to enable no-access settings Avi Service Engines (SEs). 

## Create a Role in IAM

Use the following JSON file to create a role in IAM. Use the following name for the file: avicontroller-role-ipam-policy.json

<pre>{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1450393199000",
            "Effect": "Allow",
            "Action": [
                "ec2:AssignPrivateIpAddresses",
                "ec2:CreateNetworkInterface",
                "ec2:CreateTags",
                "ec2:DeleteNetworkInterface",
                "ec2:DeleteTags",
                "ec2:DescribeAddresses",
                "ec2:DescribeInstanceAttribute",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeInstances",
                "ec2:DescribeNetworkInterfaceAttribute",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeRegions",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSubnets",
                "ec2:DescribeTags",
                "ec2:DescribeVpcs",
                "ec2:ModifyNetworkInterfaceAttribute",
                "ec2:ResetNetworkInterfaceAttribute",
                "ec2:UnassignPrivateIpAddresses"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
</pre> 

## Launch and Finish with the Setup Wizard

Launch the avi-controller using this role. Configure an administrator account, and enter DNS and NTP server information. On the Orchestrator page, select No Orchestrator. Exit the wizard.

## Configure Cloud Settings

Before beginning these steps, ensure the following for each SE or server host:

* Correct vNIC(s)
* Source-destination checking disabled
* Security group(s): must allow all ports (protocols) for VPC CIDR (at least ports '73', '97', and '63') 

To configure the cloud:

<ol> 
 <li>Navigate to the Avi Controller web interface and go to Infrastructure &gt; Clouds.</li> 
 <li>Click the edit icon in the row for Default-Cloud.</li> 
 <li>Select Linux as the infrastructure type and click Next.</li> 
 <li>Create an SSH user account. (While this account is not required for no-access deployment, the configuration popup still requires it.)</li> 
 <li>Create the IPAM profile:Select Create from the IPAM Profile pull-down list. Enter or select the following values: 
  <ul> 
   <li>Name: String</li> 
   <li>Type: AWS</li> 
   <li>DNS Name Server (NS) records: if needed</li> 
   <li>Credential type: IAM role or access key</li> 
   <li>AWS region</li> 
   <li>VPC ID</li> 
  </ul> <p>The credentials (access key or IAM role) provide the permissions to look up networks and Virtual Machines (VMs), create or delete Elastic Network Interfaces (ENIs), and manage private IP addresses (allocate, deallocate, assign, or de-assign). Additionally, if an IAM role is used, permissions are granted to add, look up, and delete ENI tags.</p></li> 
 <li>To add servers, click Add new server.<br> Note: For no-access mode, do not add any servers.</li> 
</ol> 

When the State is Cloud-Ready, the cloud configuration changes are complete.

## Create a Virtual Service

<ol> 
 <li>Navigate to Applications &gt; Dashboard and click Create Virtual Service &gt; Basic Setup.</li> 
 <li>Enter required values: 
  <ul> 
   <li>Name: string</li> 
   <li>Type: HTTP, HTTPS, or L4</li> 
   <li>VIP address: either a host address or the subnet from which to select the address</li> 
   <li>Certificate (if type is HTTPS)</li> 
  </ul> </li> 
 <li>Click Save.</li> 
</ol> 

Note: If no host has any vNICs on the pool subnet(s), enable the the following option: Ignore network reachability constraints for the server pool

## Configure Avi SE Settings for No-access Mode

If deploying in no-access mode, some configuration in the Vantage CLI also is required.

Enter the following commands to let the Avi Controller connect to SE nodes without attempting to use SSH for authentication:

<pre>: &gt; configure controller properties 
: controllerproperties&gt; allow_unauthenticated_nodes 
: controllerproperties&gt; save
</pre> 

Enter the following commands to enable tunneling support for Avi SEs:

<pre class="">: &gt; configure serviceengineproperties 
: seproperties&gt; se_bootup_properties 
: seproperties:se_bootup_properties&gt; se_ip_encap_ipc 1
: seproperties:se_bootup_properties&gt; se_tunnel_mode 1
: seproperties:se_bootup_properties&gt; save
: seproperties&gt; save
</pre> 