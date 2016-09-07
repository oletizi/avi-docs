---
title: Clickjacking Protection
layout: default
---
Starting in version Avi Vantage 15.3, the Avi Controller has clickjacking protection. The clickjacking protection is enabled by default.

Unfortunately, Horizon integration with iframes does not work with the option enabled. To work around this issue, disable the option by logging into the Controller CLI and entering the commands show below:
$> shell Login: admin Password: : > configure systemconfiguration : systemconfiguration> portal_configuration : systemconfiguration:portal_configuration> no enable_clickjacking_protection : systemconfiguration:portal_configuration> save : systemconfiguration> save : > exit $>