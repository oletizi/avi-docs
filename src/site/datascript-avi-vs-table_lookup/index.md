---
title: DataScript: avi.vs.table_lookup
layout: default
---
<table class="table table-hover"> 
 <tbody> 
  <tr bgcolor="ff4b00"> 
   <td width="100"><span style="color: white; font-size: medium;"><strong>Function</strong></span></td> 
   <td width="600"><span style="color: white;"><b>avi.vs.table_lookup( [table_name,] key [, lifetime_exten] )</b></span></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Description</strong></span></td> 
   <td width="600">The table API is used to store and retrieve custom data. The avi.vs.table_lookup API looks up a key and return the corresponding value. This key-value store is unique per Virtual Service and is mirrored across all Service Engines hosting the VS.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Events</strong></span></td> 
   <td width="600">HTTP_REQ<br> HTTP_RESP</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Parameter</strong></span></td> 
   <td width="600">If the optional <em><strong>table_name</strong></em> is not specified, the key is looked up in the default table for the VS. When it is specified, a custom table will be searched.<p></p> <p>The <em><strong>key</strong></em> is used to look up the value.</p> <p>The optional <strong><em>lifetime_exten</em></strong> flag must be a positive integer, indicating the length of time,&nbsp;in seconds, that should be added to the current lifetime parameter for the key. When not specified, the default value of 300 seconds is used. &nbsp;This means that by default, looking up the value of a key will extend the lifetime of a key by an additional 300 seconds.</p></td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Returns</strong></span></td> 
   <td width="600">Returns Boolean true upon insertion success and false upon insertion failure.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Note</strong></span></td> 
   <td width="600">Inserting a key that already exists will update the lifetime parameter.&nbsp; It does not override the value parameter.</td> 
  </tr> 
  <tr> 
   <td width="100"><span style="font-size: medium;"><strong>Example</strong></span></td> 
   <td width="600">TBD</td> 
  </tr> 
 </tbody> 
</table>