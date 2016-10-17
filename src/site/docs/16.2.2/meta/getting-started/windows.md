---
title: Meta -- Getting Started
layout: default
---

## Enable the Windows Subsystem for Linux

The Windows Subsystem for Linux is a new way from Microsoft and Canonical to run a Linux envirnment inside Windows. If you like *NIX, but need to use Windows, this is a great new environment. We'll be using it to install and run the docs site locally.

The official instructions for turning this feature on is [available from Microsoft here:](https://msdn.microsoft.com/commandline/wsl/install_guide)

> <https://msdn.microsoft.com/commandline/wsl/install_guide>

but, here are the basic steps:

* Turn on Developer Mode
    * Open Settings -> Update and Security -> For developers
    * Select the Developer Mode radio button

* Enable Windows Subsystem for Linux
      - Open Control Panel
      - Search for “features”
      - Open “Turn windows features on or off”
      - Turn on “Windows Subsystem for Linux”
      - Reboot

* Open a PowerShell as administrator (search for "PowerShell", right click on it and choose to run it as administrator) and run the following command:
  > `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
  
* Open a command shell (search for "cmd") and run `bash`

* Accept the license

Windows will now download and install the Linux environment. This might be a good time to grab a cup of coffee.

## Install Required Unix Tools

