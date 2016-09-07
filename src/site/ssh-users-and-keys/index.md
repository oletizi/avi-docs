---
title: SSH Users and Keys
layout: default
---
The Avi Controller and Avi Service Engines (SEs) use SSH for secure management communication. This requires an SSH user that exists on both the Avi Controller and the Avi SE, and a copy of the SSH user's public key on the Avi SE. While SSH setup is automated for some types of installation, such as installation into VMware with write access, other types of installation require manual setup of these SSH resources:

* <a href="/public-key-management-on-se-hosts">Linux server cloud</a>
* <a href="/installing-avi-vantage-with-mesosphere-dcos-on-premises">Mesos DC/OS (on-premises)</a>

### Create SSH User

To create an SSH user on the Avi Controller, use the following steps.

Note: An SSH user and key that already exist can be used. They still must be added to the Avi Controller using these steps. When creating the user account, the existing key for the user can be added by copy-and-pasting it or by importing the key file.

1. Navigate to Administration > Settings > SSH Key Settings.
1. Enter the SSH user name (example: root) in the SSH User field.
1. Click Generate SSH Key Pair to create a key pair for the user.
<a href="img/sshuser-create.png"><img src="img/sshuser-create.png" alt="sshuser-create" width="638" height="348"></a>

Note: If the user already exists, you can add the user to Vantage by entering the user name on this dialog, selecting Import Private Key, and either copy-and-pasting or importing the key file.
1. Click Save.

### Download Public Key File

After creating an SSH user on the Avi Controller (using the steps above), the user's public key can be downloaded from the Avi Controller:

1. Navigate to Administration > Settings > SSH Key Settings.
1. Click the download icon next to the row for the SSH user.

<a href="img/Ctlr-sshuser-copykey-3b.png"><img src="img/Ctlr-sshuser-copykey-3b.png" alt="Ctlr-sshuser-copykey-3b" width="908" height="249"></a>