---
title: Public Key Management on SE Hosts (16.2.2)
layout: default
---
When <a href="/installing-avi-vantage-for-a-linux-server-cloud-revised/">installing Vantage for a Linux server cloud</a>, part of the deployment process for a new Avi Service Engine is to add an SSH user to the Avi Controller, then add the same user and its public key to the SE host. The SSH user and key are used by the Controller to log onto the SE host, transfer the Docker container for the Avi SE onto the host, and start the SE within the Docker container.

This article describes how to set up SSH on the Avi Controller and on each Avi SE host so that the Avi Controller can log onto the Avi SEs in a Linux server cloud. Part of this process takes place on the Avi Controller. The other part takes place on each of the Avi SE hosts.

### Add the SSH User to the Avi Controller

On the Avi Controller, add the SSH user and the user's public-private key pair. An SSH account can be created on the Avi Controller (the easy way), or an existing account can be used by adding its username and importing its keys.

Use this section even if the SSH user has already been added. The user's public key needs to be copied so it can be pasted into a command line on each of the Avi SE hosts.

Navigate to Administration > Settings, and click SSH Key Settings. If any SSH users have already been added to the Avi Controller, they are listed here.
<a href="img/sshusers2.png"><img src="img/sshusers2.png" alt="sshusers2" width="814" height="217"></a>While this example shows more than one account, the same account can be used for all the SE hosts. A unique account is not required for each SE host. (The account serves a similar purpose to the well-known secret in a routing protocol topology.)

If creating a new user:

1. Click Create SSH User.
1. Enter the username.
1. Select the Generate SSH Key Value Pair radio button, and click Generate SSH Key Pair.
1. Click Copy to clipboard.
1. Click Save. The SSH user appears in the list.

### Preparing SE hosts

To prepare a host where Service Engines are launched, login to the host as a user that has sudo privileges and run the following command:
<pre><code class="language-lua">curl -ks https://
   
  <controller-ip>
    /api/linux_host_install?username= 
   <username>
     | sudo bash user@machine:~$&nbsp;curl –ks https://10.10.25.46/api/linux_host_install?username=newuser | sudo bash Updating the authorized keys under /etc/ssh/authorized_keys_newuser Checking settings for key-based login... PubKeyAuthentication based login is already set up. Finished configuration 
   </username> 
  </controller-ip></code></pre>

This command invokes an API to download a script that has the public key credentials of the user associated with the cloud and the necessary steps to set up the user in this host. The output of the script is piped to "sudo bash" that then executes these steps.

<pre><code class="language-lua">curl -ks https://
   
  <controller-ip>
    /api/linux_host_install?username= 
   <username>
     | sudo bash user@machine:~$&nbsp;curl –ks https://10.10.25.46/api/linux_host_install?username=newuser | sudo bash Updating the authorized keys under /etc/ssh/authorized_keys_newuser Checking settings for key-based login... PubKeyAuthentication based login is already set up. Finished configuration 
   </username> 
  </controller-ip></code></pre>

### Verify that the SE hosts have been setup

You can now verify if the host has been setup with the SSH credentials correctly from the Avi Controller. 

This verification can be done as a part of adding a server in the Linux cloud by clicking on the icon to which the red arrow points.

<a href="img/Screen-Shot-2016-08-27-at-11.52.36-AM-4.png"><img src="img/Screen-Shot-2016-08-27-at-11.52.36-AM-4.png" alt="Public Key Management on Avi Vantage SE Hosts" width="650" height="666"></a>

If a host is not set up correctly, you will see an error of the following form. It will also provide you with the instructions to setup the host.

<a href="img/linux_cloud_02.png"><img src="img/linux_cloud_02.png" alt="Public Key Management on Avi Vantage SE Hosts" width="650" height="295"></a>

Alternatively, you can also verify that the SE hosts have been setup as a part of the SSH user configuration:

<a href="img/ssh_user_01.png"><img src="img/ssh_user_01.png" alt="Public Key Management on Avi Vantage SE Hosts" width="650" height="223"></a>

A successful setup looks as follows:

<a href="img/linux_cloud_03-1.png"><img src="img/linux_cloud_03-1.png" alt="Public Key Management on Avi Vantage SE Hosts" width="650" height="294"></a>

##