---
title: Geolocation-based Load Balancing Algorithm for GSLB Members
layout: layout163
---
The geolocation algorithm of the Avi DNS for GSLB directs client requests to the optimal site based on the longitude and latitude of the client and GSLB sites. Each SE in the Avi DNS configuration refers to its own local copy of the geolocation database (geo DB) to make that determination.
<h3>Operation</h3>
Operation of the geolocation algorithm is best explained by example. Refer to figure 1.

A client with IP address = <strong>client_IP</strong> seeks service from a global application implemented by four virtual services (VS-A1 through VS-A4) at four locations, <strong>DC1-DC4</strong>, one of which is an external site. The client's local DNS must resolve the FQDN for the global application to one of four potential addresses, <strong>vip-1, vip-2, vip-3, </strong>or<strong> vip-4</strong>. The first step is to find a DNS capable of making that translation. Either DNS-1 or DNS-2 will do. Each DNS instantiation has access to its own, identical <strong>geo-DB. </strong>Using that database, either DNS-1 or DNS-2 can<strong> </strong>translate the five IP addresses into latitude-and-longitude-based locations.

Note: The selection of DNS-2 is outside the control of Avi Vantage, and thus may have nothing to do with geographical location. We have intentionally chosen a more distant DNS to underscore this fact.

&nbsp;

{% include figure.html title="Avi DNS is authoritative for the FQDN of the global application" url="img/DNS-is-queried.png" alt="Avi DNS is authoritative for the FQDN of the global application" caption="Figure 1. An authoritative DNS for the FQDN is found" %}

&nbsp;

The algorithm running in DNS-2 calculates four distances, determines that dist-1 is the shortest, and therefore responds to the DNS request with vip-1. As figure 2 shows, the client thereafter directs its application request to vip-1.

{% include figure.html title="Geolocation algorithm running in DNS-2 selects vip-1" url="img/client-directs-request-to-closest-site.png" alt="Geolocation algorithm running in DNS-2 selects vip-1" caption="Figure 2. Geolocation algorithm running in DNS-2 selects vip-1" %}

<h4></h4>
<h4>Assigning Geographic Locations to VIPs</h4>
Each GSLB service pool's algorithm is independently set. Current choices are the round-robin, consistent hash, and geolocation algorithms. To implement the geolocation algorithm, the Avi DNS for GSLB must have a way to assign locations to GSLB sites comprising a GSLB service. The choices on a per-GSLB-service basis are as follows:
<ul>
 	<li><strong>Compute location from geo-DB (default)</strong>. This method requires a look-up in a database constructed in advance. This database is described in a subsequent section of this article.</li>
 	<li><strong>Inherit location from site</strong>. With this methodology, each participating GSLB site is assigned a location as part of the GSLB configuration object. The GSLB service's member VS running at the site statically inherits the location associated with this site. This method can be useful when no bulk geo-DB information has been imported.</li>
 	<li><strong>Explicit configuration</strong>. This manual process gives the administrator full control on the most granular level without relying on a pre-populated geo-DB.</li>
</ul>
When the geolocation algorithm is chosen for a given GSLB service, member VSs having VIPs for which locations cannot yet be determined are essentially opaque. DNS responses will never include their VIPs. Instead, the geolocation algorithm will chose a VIP from among the set of VSs whose locations <em>can</em> be determined. If not a single member VS has a VIP whose location can be determined, the Avi DNS for GSLB will fall back to the (weighted) round-robin algorithm.
<h4>Additional Details</h4>
<ol>
 	<li>Since the distance calculation is based purely on a virtual service's VIP, both Avi and external sites are candidates for VIP selection.</li>
 	<li>DNS-2 would have returned vip-2, or vip-3, or vip-4, in geo-proximity order, had health monitoring determined such was appropriate.</li>
 	<li>As with the round-robin algorithm, it is possible to assign <strong>weights</strong> to the VIPs. So far, we have assumed each has an equal weight, i.e., a ratio of 1:1:1:1. Were the weights changed to 1:2:1:1 (in VIP order 1, 2, 3 and 4), a DNS response other than VIP-1 could easily be imagined for this particular client. For example, assume dist-1 = 500 miles and dist-2 = 600 miles. Looking at physical distance alone, vip-1 is indeed the right choice. But assigning a weight of 2 to vip-2 causes the algorithm to compare 500 miles to 600 / 2 miles. Since 300 is less than 500 miles, vip-2 would instead be chosen. One use case for such weighting is a site whose servers are very much faster than servers at other sites. At such a speedy site, server-processing-time savings compare in magnitude to transit times over the WAN. A client's geographic location may justify routing its traffic over a somewhat longer distance for the reward of overall faster roundtrip time.</li>
 	<li>As mentioned in <a href="/gslb-architecture-and-object-model/">Avi GSLB Architecture and Object Model</a>, with appropriate priorities set, Avi GSLB supports disaster recovery sites. In support of such, the geolocation algorithm will only direct clients to VIPs in active (higher priority) GSLB pools, not DR (lower priority) GSLB pools.</li>
 	<li>There are times when a client's IP address does not yield an accurate client location. To address this, the administrator may choose to modifying the DNS application profile to enable <a href="https://en.wikipedia.org/wiki/Extension_mechanisms_for_DNS">EDNS</a>. If this option is selected, and an EDNS subnet extension is present in the DNS request, then it will used instead of the client's IP address.</li>
</ol>
<h3>The Geo-DB</h3>
In the lifecycle of an Avi GSLB configuration, geographic information for geolocated services is first loaded into the GSLB leader Avi Controller, in bulk or on a location-by-location basis. The data are placed into Avi geo-DB format (specified below) for download into all Avi DNS SEs in the SE group. As a reminder, this group is dedicated to DNS; no application VSs are allowed in it. The Avi geo-DB is subsequently replicated to all follower Avi DNS instantiations, so that any one of them (DNS-1 and DNS-2 in the above example) can reply to client-local DNSs with the same optimally located VIP.

Fields in the Avi format are sufficient in number and kind to accommodate information defined in popular 3rd-party geolocation databases. A single record contains these fields:
<ul>
 	<li>IP address range start</li>
 	<li>IP address range end</li>
 	<li>Latitude</li>
 	<li>Longitude</li>
 	<li>Full name of city, e.g., USA/California/San Francisco</li>
 	<li>Tag is reserved for special uses, e.g., to store a customer-defined value for region, say "West"</li>
</ul>
Multiple files can be specified as input for source IP address to location mapping. A priority mechanism will be used to decide which data should dominate if and when multiple sources stipulate a distance for a given IP address.

In the beta release of the geolocation algorithm, only one format for source of location information is supported. Easy conversion from other formats to the Avi format is possible. Such data will be merged into <em>one</em>, static, composite geo-DB in Avi format. However, in future releases, data from other sources, such as MaxMind will be importable.

Clients of global applications are assumed to have public or private addresses. From the perspective of Avi GSLB, they have <em>direct</em> network access to either public or private VIPs, but not both simultaneously. In public networks, network address translation may engage private sites, but such private IPs are transparent to the geolocation algorithm that governs public-client access. Accordingly, the geo-DB is responsible to contain one or the other kind of address, not both simultaneously.
<h4>Impact on Controller and SE Configuration</h4>
To support the geolocation algorithm, special consideration must be given when configuring Controllers and the SEs implementing Avi DNS for GSLB.
<ul>
 	<li><strong>Memory Allocation</strong>. An Avi geo-DB can be very large (e.g., can easily contain 3 million entries). Accordingly, the minimum recommendation for an Avi DNS SE is 8 GB. An additional knob stipulates the amount of memory (2GB recommended) to be exclusively devoted to the geo-DB.</li>
 	<li><strong>Disk Allocation</strong>. An Avi geo-DB can be very large (e.g., can easily contain 3 million entries). Accordingly, an extra 2 GB is recommended for disk size. Controller disk size likewise needs to increase beyond the norm, since it is the first place the data are assembled.</li>
 	<li>When the Avi geo-DB is large, the DNS Service Engine needs some time to load the entries into memory. In the <strong>Beta release, </strong>the SE properties need to be modified to increase the heartbeat timers, to account for this time.</li>
</ul>
<ul>
 	<li>The CLI commands for these are discussed in the CLI section.</li>
</ul>
<h3><strong>CLI Interface</strong></h3>
&nbsp;
<ul>
 	<li><strong>Service Engine properties</strong></li>
</ul>
<pre class="">configure serviceengineproperties
  se_agent_properties
    controller_registration_timeout_sec 120
    controller_heartbeat_timeout 60
  save
save</pre>
<ul>
 	<li><strong>Service Engine Group properties</strong></li>
</ul>
<pre class="">configure serviceenginegroup
  memory_per_se 4096
  extra_shared_config_memory 2048
  save</pre>
<ul>
 	<li><strong>Upload Geo DB file(s)</strong></li>
</ul>
<ul>
 	<li><strong>Create GSLB Geo Profile</strong></li>
</ul>
<pre class=""> configure gslbgeodbprofile
  files
    filename
    priority 10
    save
  save

</pre>
<ul>
 	<li><strong>Set Geo Load balancing algorithm in GSLB Service pool</strong></li>
</ul>
&nbsp;
<h3><strong>Troubleshooting</strong></h3>
<ul>
 	<li style="text-align: left;">To verify correct operation from the perspective of clients, check Avi Vantage's logs.</li>
 	<li style="text-align: left;">If a DNS SE does not have sufficient memory to host the geo-DB, the SE event SE_GEO_DB_FAILURE is generated. If this occurs, the administrator must re-size the Service Engine by modifying the Service Engine group properties, and thereafter restart the SEs.</li>
</ul>