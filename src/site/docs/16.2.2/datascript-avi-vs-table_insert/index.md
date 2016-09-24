---
title: DataScript&#58; avi&#46;vs&#46;table_insert
layout: default
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.table_insert( [table_name,] key, value [, lifetime] )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>The table API is used to store and retrieve custom data. The avi.vs.table_insert API stores the value in a key-value store for the key. This key-value store is unique per virtual service and is mirrored across all Service Engines hosting the VS.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>If the optional <em><strong>table_name</strong></em> is not specified, the key-value pair is stored in a default table for the VS. When it is specified, a new table with the custom name will be used. A virtual service with multiple tables can have the same key name with different values for each table.<p></p> <p>The <em><strong>key</strong> </em>is used to look up the value.</p> <p>The <em><strong>value</strong> </em>is the custom data to be stored.</p> <p>The optional <em><strong>lifetime</strong> </em>flag must be a positive integer, indicating the length of time in seconds this record should exist. When the time runs out, the key and value are silently discarded. If the lifetime flag is not specified, the default value of 300 seconds is used.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>Returns Boolean true upon insertion success and false upon insertion failure.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Note</strong></span></td>
<td>Inserting a key that already exists will update the lifetime value of the key. It does not override the value.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Example</strong></span></td>
<td>TBD</td>
</tr>
</tbody>
</table> 