---
title: PROXY Protocol Support 
layout: default
---
By default, Avi Service Engines (SEs) source-NAT (SNAT) traffic destined to servers. Due to SNAT, logs on the application servers will show the layer 3 IP address of the SE rather than the original client’s IP address. Protocol extensions such as  <a href="/x-forwarded-for-header-insertion/">“forwarded” extension of HTTP</a> require knowledge of the underlying protocol. For layer 4 applications, Avi Vantage supports versions 1 (human-readable format) and version 2 (binary format) of the PROXY protocol ( <a href="http://www.haproxy.org/download/1.5/doc/proxy-protocol.txt">PROXY protocol spec</a>), which conveys the original connection parameters to the back-end servers. For layer 4 SSL applications, version 1 is supported. The Avi SE requires no knowledge of the inner protocol. The impact on performance caused by processing of transported information is very minimal.     PROXY protocol spec format:    PROXY TCP4 ( *real source address*) ( *proxy address*) ( *TCP source port*) ( *TCP destination port*) ( *CRLF sequence*)    Example V1 PROXY protocol line:

PROXY TCP4 12.97.16.194 136.179.21.69 31646 80\r\n

### Configuring PROXY Protocol via UI

1. Navigate to Template > Profiles.
1. Within the Application tab, select System-L4-Application.
1. For Type, select L4, as shown below.
1. Click Enable PROXY Protocol.
1. Select which version is desired.
1. When finished changing the profile, click Save.

The profile change affects any virtual services that use the same L4 application profile.

<a href="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png"><img src="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png" alt="Screen Shot 2016-07-18 at 11.10.53 AM" width="600" height="337"></a>

 

### Configuring PROXY Protocol via CLI

The following sequence of CLI commands enable PROXY protocol support and protocol version to be used.
: >**configure applicationprofile System-L4-Application**

: applicationprofile>**tcp_app_profile**

: applicationprofile:tcp_app_profile>**proxy_protocol_enabled**

: applicationprofile:tcp_app_profile>**proxy_protocol_version proxy_protocol_version_1**

: applicationprofile:tcp_app_profile>**save**

: applicationprofile>**save** By default, Avi Service Engines (SEs) source-NAT (SNAT) traffic destined to servers. Due to SNAT, logs on the application servers will show the layer 3 IP address of the SE rather than the original client’s IP address. Protocol extensions such as  <a href="/x-forwarded-for-header-insertion/">“forwarded” extension of HTTP</a> require knowledge of the underlying protocol. For layer 4 applications, Avi Vantage supports versions 1 (human-readable format) and version 2 (binary format) of the PROXY protocol ( <a href="http://www.haproxy.org/download/1.5/doc/proxy-protocol.txt">PROXY protocol spec</a>), which conveys the original connection parameters to the back-end servers. For layer 4 SSL applications, version 1 is supported. The Avi SE requires no knowledge of the inner protocol. The impact on performance caused by processing of transported information is very minimal.     PROXY protocol spec format:    PROXY TCP4 ( *real source address*) ( *proxy address*) ( *TCP source port*) ( *TCP destination port*) ( *CRLF sequence*)    Example V1 PROXY protocol line:

PROXY TCP4 12.97.16.194 136.179.21.69 31646 80\r\n

### Configuring PROXY Protocol via UI

1. Navigate to Template > Profiles.
1. Within the Application tab, select System-L4-Application.
1. For Type, select L4, as shown below.
1. Click Enable PROXY Protocol.
1. Select which version is desired.
1. When finished changing the profile, click Save.

The profile change affects any virtual services that use the same L4 application profile.

<a href="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png"><img src="img/Screen-Shot-2016-07-18-at-11.10.53-AM.png" alt="Screen Shot 2016-07-18 at 11.10.53 AM" width="600" height="337"></a>

 

### Configuring PROXY Protocol via CLI

The following sequence of CLI commands enable PROXY protocol support and protocol version to be used.
: >**configure applicationprofile System-L4-Application**

: applicationprofile>**tcp_app_profile**

: applicationprofile:tcp_app_profile>**proxy_protocol_enabled**

: applicationprofile:tcp_app_profile>**proxy_protocol_version proxy_protocol_version_1**

: applicationprofile:tcp_app_profile>**save**

: applicationprofile>**save**