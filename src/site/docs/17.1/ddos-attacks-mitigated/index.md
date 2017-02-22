---
title: DDoS Attack Mitigation&#58; What Avi Vantage Protects Against
layout: layout163
---
Avi Vantage is the last line of defense for most applications. In most deployments, Vantage is directly exposed to public, untrusted networks. To protect application traffic, Service Engines (SEs) are able to detect and mitigate a wide range of Layer 4-7 network attacks. The following is a list of common denial of service (DoS) attacks and directed DoS (DDoS) attacks mitigated by Avi Vantage.

 

<table class="table table-hover table table-bordered table-hover">  
<tbody>                          
<tr>     
<td><b>Attack Layer</b></td>
<td><b>Attack Name</b></td>
<td><b>Description</b></td>
<td><b>Mitigation</b></td>
</tr>
<tr>     
<td rowspan="5"><strong>Layer 3</strong></td>
<td><span style="font-weight: 400;">SMURF</span></td>
<td><span style="font-weight: 400;">ICMP packets with the dest IP set as the broadcast IP and the source IP spoofed to the victim’s IP </span></td>
<td><span style="font-weight: 400;">Packets are dropped at the dispatcher layer if the source or destination IP is a broadcast IP or class D/E IP address.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">ICMP flood</span></td>
<td><span style="font-weight: 400;">Excessive ICMP echo requests to the victim</span></td>
<td><span style="font-weight: 400;">ICMP packets are rate limited.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Unknown protocol</span></td>
<td><span style="font-weight: 400;">Packets with unrecognized IP protocol</span></td>
<td><span style="font-weight: 400;">Packets are dropped at the dispatcher layer.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Tear drop</span></td>
<td><span style="font-weight: 400;">Exploit the reassembly of fragmented IP packets</span></td>
<td><span style="font-weight: 400;">Packets are dropped in the protocol stack in the SE if fragment offsets are deemed bad.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">IP fragmentation</span></td>
<td><span style="font-weight: 400;">Bad fragmented packets</span></td>
<td><span style="font-weight: 400;">Packets are dropped in the protocol stack in the SE.</span></td>
</tr>
<tr>     
<td rowspan="12"><strong>Layer 4</strong></td>
<td><span style="font-weight: 400;">SYN flood</span></td>
<td><span style="font-weight: 400;">Send TCP SYNs without acknowledging SYN acks; the victim’s TCP  table will grow rapidly</span></td>
<td><span style="font-weight: 400;">If the TCP table is being filled with half connections (uncompleted TCP 3-way handshakes), begin using SYN cookies.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">LAND</span></td>
<td><span style="font-weight: 400;">Same as SYN flood except the source and dest IP addresses are identical</span></td>
<td><span style="font-weight: 400;">Packets are dropped at the dispatcher layer,</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Port scan</span></td>
<td><span style="font-weight: 400;">TCP/UDP packets on various ports to find out listening ports for next level of attacks; most of those ports are non-listening ports</span></td>
<td><span style="font-weight: 400;">Packets are dropped at the dispatcher layer.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">X-mas tree</span></td>
<td><span style="font-weight: 400;">TCP packets with all the flags set to various values to overwhelm the victim’s TCP stack</span></td>
<td><span style="font-weight: 400;">Packets are dropped in the protocol stack of the SE.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Bad RST flood</span></td>
<td><span style="font-weight: 400;">Send TCP RST packets with bad sequence</span></td>
<td><span style="font-weight: 400;">Packets are dropped in the protocol stack in the SE if the packet sequence numbers are outside the TCP window.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Fake session</span></td>
<td><span style="font-weight: 400;">Guess a TCP sequence numbers to hijack connections</span></td>
<td><span style="font-weight: 400;">To reduce the chance of success for a fake session attack, the SE uses random numbers for the initial sequence numbers.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Bad sequence numbers</span></td>
<td><span style="font-weight: 400;">TCP packets with bad sequence numbers</span></td>
<td><span style="font-weight: 400;">Packets with sequence numbers outside the TCP window are dropped in the protocol stack in the SE.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Malformed/Unexpected flood</span></td>
<td><span style="font-weight: 400;">Unrelated TCP packets after a TCP FIN has been sent</span></td>
<td><span style="font-weight: 400;">Unexpected packets after the FIN are dropped in the protocol stack in the SE.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Zero/small window</span></td>
<td><span style="font-weight: 400;">Attacker advertises a zero or very small window (&lt;100) after the TCP 3-way handshake</span></td>
<td><span style="font-weight: 400;">If the first TCP packet from the client (after a SYN) is received with a zero or small window, the SE drops the packet and a RST is sent.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Rate limiting CPS per IP</span></td>
<td>Connection flood</td>
<td><span style="font-weight: 400;">The rate limits configured in the application profile are applied. (</span>App Profile - DDoS - Rate Limit HTTP TCP)</td>
</tr>
<tr>    
<td><span style="font-weight: 400;">SSL errors</span></td>
<td><span style="font-weight: 400;">Inject SSL handshake errors</span></td>
<td><span style="font-weight: 400;">SE closes the connection after an error.</span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">SSL renegotiation</span></td>
<td><span style="font-weight: 400;">Request for renegotiation after establishing an SSL connection</span></td>
<td><span style="font-weight: 400;">Client-triggered renegotiation is disabled.</span></td>
</tr>
<tr>     
<td rowspan="7"><strong>Layer 7 (HTTP)</strong></td>
<td><span style="font-weight: 400;">Request idle timeout</span></td>
<td><span style="font-weight: 400;">Establishing a connection without sending an HTTP request</span></td>
<td><span style="font-weight: 400;">The control timeout configured in the application profile is used. (</span>App Profile - DDoS - Post Accept Timeout)</td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Size limit for header and request</span></td>
<td>Resource consumption via long request time</td>
<td><span style="font-weight: 400;">The header-size limits configured in the application profile are used. (</span>App Profile - DDoS - HTTP Size)</td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Slow POST</span></td>
<td>Resource consumption via long request time</td>
<td><span style="font-weight: 400;">The body-size limits configured in the application profile are used. (</span>App Profile - DDoS - HTTP Size)</td>
</tr>
<tr>    
<td><span style="font-weight: 400;">SlowLoris / SlowPost</span></td>
<td><span style="font-weight: 400;">Opening multiple connections to the victim by sending partial HTTP requests</span></td>
<td><span style="font-weight: 400;">The header and body timeouts configured in the application profile are used. </span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Invalid requests</span></td>
<td><span style="font-weight: 400;">Invalid header, body, or entity in HTTP request</span></td>
<td><span style="font-weight: 400;">The URI length, header length, and body length limits configured in the application profile are used. </span></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Rate limiting RPS per client IP</span></td>
<td>Request flood</td>
<td>The limit configured in the application profile is used. (App Profile - DDoS - Rate Limit HTTP TCP)<p></p> <p> </p> <p> </p></td>
</tr>
<tr>    
<td><span style="font-weight: 400;">Rate limiting RPS per URL</span></td>
<td>Request flood</td>
<td>The limit configured in the application profile is used. (App Profile - DDoS - Rate Limit HTTP TCP)</td>
</tr>
</tbody>
</table> 

 

 
