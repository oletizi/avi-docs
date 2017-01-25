---
title: Troubleshooting an MTU Problem
layout: default
---
The issue is MTU. In 16.2.3, we added support to pay attention to the MTU that DHCP provides. In this case, we are seeing MTU of 9001 on the interfaces. However, the whole path is NOT setup for jumbo MTU. 

I use serviceengineproperties and set the global_mtu to 1500. Now things are working fine for kbstage.

Thanks

-Kiron

On Fri, Oct 7, 2016 at 7:27 PM, Orion Letizi <<a href="mailto:orion@avinetworks.com"><span class="s3">orion@avinetworks.com</span></a>>wrote:

Is it possible to login to the service engine and try to get to the wordpress server (via lynx or similar) to see if it’s at least trivially possible to login to the wordpress instance from the service engine host without going through Vantage?

Cheers,

—Orion

On Oct 7, 2016, at 6:16 PM, Abhi Joglekar <<a href="mailto:abhijeet@avinetworks.com"><span class="s4">abhijeet@avinetworks.com</span></a>> wrote:

Kiron,

Take a look at the last packet capture on the controller (about 2 MB in size), and filter tcp.port == 16719. That's the backend connection to server on which the SSL handshake works, but the application payload gets no acks from the server.

On Fri, Oct 7, 2016 at 6:11 PM, Abhi Joglekar <<a href="mailto:abhijeet@avinetworks.com"><span class="s3">abhijeet@avinetworks.com</span></a>>wrote:

I debugged this issue for last couple hours. Here is what is happening:

1) Vantage gets the WordPress login request, parses and re-creates the Proxy Request to the backend

2) Completes the SSL handshake successfully, then sends out the proxy request (encrypted) which is 1482 bytes of TCP Segment size.

3) For the next 10 secs, we keep sending re-transmissions. 

4) Finally, after about another 10 secs, the server sends an SSL alert (wanting to close). The Ack number indicates that it never got the packet that we sent it in (2) (encrypted HTTP request)

5) And then follows up with Fin and the connection terminates. 

Couple of things would like to debug:

**1) Can the 1482 bytes of TCP segment fit in the MTU on the backend? Kiron/Ramku, any changes in the TCP stack recently?**

2) Run tcpdump on the server. I have to head out now, but will do that. That will tell us if the packet in (2) ever reached the server. 

3) Enable TCP debugs on SE and trace the packet as it goes out of the SE to the server.

**I have a feeling that the packet never reaches the server, and 1482 seems to indicate it could be a fragmentation issue on the server network. Kiron?**

If the above is all good, and we find that packet does reach the server, then will want to look into the encrypted payload and see if we are corrupting the HTTP request. But, given that we never got an ack from the server, seems like a network level issue at this point.

thanks

-- abhijeet

  

On Oct 5, 2016, at 11:22 PM, Mohammed Aziz <<a href="mailto:aziz@avinetworks.com"><span class="s4">aziz@avinetworks.com</span></a>> wrote:

Hello Guru,

       For the past couple of days the <a href="/docs/17.1/"><span class="s4">kbstage.avinetworks.com</span></a> seems to be flaky and gets a bad gateway error.

<image.png>

Thanks and warm Regards,

Aziz.

________________________________

Raphael Frommer

<a href="http://www.avinetworks.com/">Avi Networks, Inc.</a>

Technical Education & Documentation

<a href="tel:%2B1%20408%20203%200269">+1 408 203 0269</a>
