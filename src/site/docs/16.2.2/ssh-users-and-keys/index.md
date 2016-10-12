---
title: SSH Users and Keys
layout: default
---
The Avi Controller and Avi Service Engines (SEs) use SSH for secure management communication. This requires an SSH user who exists on both the Avi Controller and the Avi SEs, and a copy of the SSH user's public key on the Avi SEs. While SSH setup is automated for some installation types, such as installation into VMware with write access, other installation types require manual setup of these SSH resources:

* <a href="public-key-management-on-se-hosts">Linux server cloud</a>
* <a href="installation-guides/installing-avi-vantage-with-mesosphere-dcos-on-premises">Mesos DC/OS (on-premises)</a> 

### Create SSH User

To create an SSH user on the Avi Controller, use the following steps.

Note: An SSH user and key that already exist can be used. They still must be added to the Avi Controller using these steps. When creating the user account, the existing key for the user can be added by copy-and-pasting it or by importing the key file.
<ol> 
 <li>Navigate to Administration &gt; Settings &gt; SSH Key Settings.</li> 
 <li>Enter the SSH user name (example: root) in the SSH User field.</li> 
 <li>Click Generate SSH Key Value Pair to create a key pair for the user.<br> <a href="img/sshuser-create.png"><img class="alignnone size-full wp-image-10511" src="img/sshuser-create.png" alt="sshuser-create" width="638" height="348"></a>Note: If the user already exists, you can add the user to Vantage by entering the user name on this dialog, selecting Import Private Key, and either copy-and-pasting or importing the key file.</li> 
 <li>Click Save.</li> 
</ol> 

### Download Public Key File

After creating an SSH user on the Avi Controller (using the steps above), the user's public key can be downloaded from the Avi Controller:
<ol> 
 <li>Navigate to Administration &gt; Settings &gt; SSH Key Settings.</li> 
 <li>Click the download icon next to the row for the SSH user.</li> 
</ol> 

<a href="img/Ctlr-sshuser-copykey-3b.png"><img class="alignnone size-full wp-image-10512" src="img/Ctlr-sshuser-copykey-3b.png" alt="Ctlr-sshuser-copykey-3b" width="908" height="249"></a>

