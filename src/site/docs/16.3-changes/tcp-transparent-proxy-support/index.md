---
title: TCP Transparent Proxy Support
layout: default
---
Transparent TCP proxy may also be called routed mode or default gateway mode.  In this mode, servers point to the Service Engine's IP address as their default gateway, mitigating the requirement for the Service Engine to Source NAT (SNAT) traffic sent to the destination servers.

Refer to these articles:

* <a href="/default-gateway-ip-routing-on-avi-se/">Default Gateway IP Routing on Avi SE</a>
* <a href="/x-forwarded-for-header-insertion/">X-Forwarded-For Header Insertion</a>
* <a href="/preserve-client-ip/">Preserve Client IP</a>
* <a href="/proxy-protocol-support/">PROXY Protocol Support</a> 