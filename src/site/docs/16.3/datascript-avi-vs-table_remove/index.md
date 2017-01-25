---
title: DataScript&#58; avi&#46;vs&#46;table_remove
layout: 16.3
---
<table class="table table-hover table table-bordered table-hover">  
<tbody>        
<tr>   
<td><span style="color: white; font-size: medium;"><strong>Function</strong></span></td>
<td><span style="color: white;"><b>avi.vs.table_remove( [table_name,] key )</b></span></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Description</strong></span></td>
<td>The table API is used to store and retrieve custom data. The avi.vs.table_remove API removes a specified key/value pair from the data store for the specified key.</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Events</strong></span></td>
<td>HTTP_REQ<br> HTTP_RESP</td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Parameter</strong></span></td>
<td>If the optional<strong><em> table_name</em></strong> is not specified, the key is looked up in the default table for the VS. When it is specified, a custom table will be searched.<p></p> <p>The <strong><em>key</em> </strong>is used to search for the table entry to be deleted.</p></td>
</tr>
<tr>   
<td><span style="font-size: medium;"><strong>Returns</strong></span></td>
<td>None</td>
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