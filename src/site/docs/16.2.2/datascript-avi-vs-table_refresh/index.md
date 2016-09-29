---
title: DataScript&#58; avi&#46;vs&#46;table_refresh
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.table_refresh( [table_name,] key [, lifetime_exten] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>Refreshes the lifetime of the entry for the key in the key/value store.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>Looks up the key in the default VS table, unless another table name is specified via the optional <strong><em>table_name</em></strong>.<p></p> <p>The <strong>key</strong> is used to search for the desired table entry.</p> <p>The optional <em><strong>lifetime_exten</strong></em>, a positive integer, is the value in seconds by which to extend the lifetime of the entry in the key/value store. When it is not specified, the default value of 300 seconds is used to extend the lifetime of the entry.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>Boolean <em>true</em> upon refresh success and <em>false</em> upon refresh failure.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Note</strong></span></td>
<td>The key/value entry will be removed from all Service Engines hosting the VS.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>TBD</td>
</tr>
</tbody>
</table> 