---
title: Purge an Object from HTTP Cache
layout: default
---
Often a single object or page may become stale, such as when a website is updated. Rather than invalidate or expire all objects from Vantage's HTTP content cache, only the impacted items should be invalidated. The following commands show how to perform this action from the CLI.

When the virtual service and pool are running on redundant or scaled out Service Engines, purging the object from cache will be performed on all applicable SEs for the pool.

 

1:  Check to see if the desired object exists within the cache. The truncated example below returns the stats from the object found in the cache.
: > show pool prod-l7-pool httpcache filter resource_name analytics.js -------------------------------------------------------------------------------- URI: /path1/analytics.js ctype: text/javascript raw_key: pool-0-4]avinetworks.com:/path1/analytics.js key: e6ce7ac2ab8668a8acc9f2d505281412 key_extn: data_size: 146398 meta_size: 172 hdr_size: 414 body_size: 145984 date_time: 1449185388 last_mod_time: -1 etag: "-725089702" (Thu Dec 3 23:29:48 2015) (Wed Dec 31 23:59:59 1969) in_time: 1449187395 exp_age: 120 init_age: 2007 last_used: (Fri Dec 4 00:03:15 2015) (Fri Dec 4 00:05:15 2015) --------------------------------------------------------------------------------

1

2
3

4
5

6
7

8
9

10
11

12
13

14
15 :  >  show pool prod - l7 - pool httpcache filter resource_name analytics . js

 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

URI :  / path1 / analytics . js
ctype :  text / javascript

raw_key :  pool - 0 - 4 ] avinetworks . com : / path1 / analytics . js
key :  e6ce7ac2ab8668a8acc9f2d505281412

key_extn :
   data_size :  146398                meta_size :  172                  hdr_size :  414        body_size :  145984

   date_time :  1449185388            last_mod_time :  - 1                etag :  "-725089702"                                                   
     ( Thu Dec    3  23 : 29 : 48  2015 )      ( Wed Dec  31  23 : 59 : 59  1969 )                                                                       

   in_time :  1449187395              exp_age :  120                    init_age :  2007        last_used :             
     ( Fri Dec    4  00 : 03 : 15  2015 )      ( Fri Dec    4  00 : 05 : 15  2015 )                                                                       

                          
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

 

2:  To clear the object from cache:
: > clear pool prod-l7-pool httpcache resource_name analytics.js

1 :  >  clear pool prod - l7 - pool httpcache resource_name analytics . js

 

3:  Validate the object has been removed from cache:
: > show pool prod-l7-pool httpcache filter resource_name analytics.js -------------------------------------------------------------------------------- --------------------------------------------------------------------------------

1

2
3

4 :  >  show pool prod - l7 - pool httpcache filter resource_name analytics . js

 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --