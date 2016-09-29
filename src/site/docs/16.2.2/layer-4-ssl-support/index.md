---
title: Layer 4 SSL Support
layout: default
---
Avi Vantage release 16.2 and later versions support layer 4 SSL virtual services. All client-facing ports will be SSL-terminated. Unlike the HTTP application profile, there is no possibility to mix-and-match SSL and non-SSL ports on an SSL Profile app. For SSL termination of HTTP protocol, use <a href="/docs/configuration-guide/templates/profiles/application-profile/#http-profile">HTTP/HTTPs application profile</a>. Requests are forwarded to back-end servers in the clear.

To apply and tune this feature, use the following touch points within the UI:

* The SSL application type is selectable in either the Virtual Service Basic or Advanced Setup wizards. As shown in figure 1, click SSL for Application Type. Port 443 is the default, but can be changed. The required certificate can be self-signed or one of the other certs visible in the pulldown menu. 

### <a href="img/Screen-Shot-2016-07-08-at-5.04.20-PM.png"><img class="alignnone size-full wp-image-10792" src="img/Screen-Shot-2016-07-08-at-5.04.20-PM.png" alt="Screen Shot 2016-07-08 at 5.04.20 PM" width="1021" height="604"></a>Figure 1. Basic Setup wizard showing selection of SSL application type.

* The default application profile, System-SSL-Application, appears under the Application tab of Templates. Vantage will automatically associate it with SSL type applications unless a change is made to the virtual service's settings.Refer to figure 2. 

<a href="img/Screen-Shot-2016-07-08-at-5.30.19-PM.png"><img class="size-full wp-image-10793 aligncenter" src="img/Screen-Shot-2016-07-08-at-5.30.19-PM.png" alt="Screen Shot 2016-07-08 at 5.30.19 PM" width="748" height="535"></a>

### Figure 2. The System-SSL-Application application template is a standard component of each Avi Vantage release.

* Edit the virtual service's settings if the system-standard defaults for the application, TCP/UDP, and SSL profiles need to be changed. Refer to figure 3. 

### <a href="img/Screen-Shot-2016-07-08-at-6.05.41-PM.png"><img class="size-full wp-image-10798 aligncenter" src="img/Screen-Shot-2016-07-08-at-6.05.41-PM.png" alt="Screen Shot 2016-07-08 at 6.05.41 PM" width="847" height="720"></a>Figure 3. Vantage automatically associates an SSL type application with system-standard application, TCP/UDP, and SSL profiles.

* To enable the PROXY protocol for your layer 4 SSL VS, or to tune the TCP connection rate limiter settings, use the application profile editor, depicted in figure 4. Note that you have the option to enable either version 1 or version 2 of the PROXY protocol. 

<a href="img/Screen-Shot-2016-07-08-at-5.54.51-PM.png"><img class="size-full wp-image-10797 aligncenter" src="img/Screen-Shot-2016-07-08-at-5.54.51-PM.png" alt="Screen Shot 2016-07-08 at 5.54.51 PM" width="856" height="516"></a>

### Figure 4. The System-SSL-Application application template can be edited by the user.

 

 
