---
title: CLI&#58; HTTP Cache Configuration
layout: layout171
---
This article describes the CLI commands that are most commonly used for configuring the HTTP cache.  

<pre class="">: &gt; show applicationprofile System‐HTTP     

+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+
| Field                             | Value                             |
+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+
| uuid                              | applicationprofile‐0‐2            |
| name                              | System‐HTTP                       |
| type                              | APPLICATION_PROFILE_TYPE_HTTP     |
| http_profile                      |                                   |
|   ...                             | ...                               |
|   cache_config                    |                                   |
|     enabled                       | True                              |
|     xcache_header                 | True                              |
|     age_header                    | True                              |
|     date_header                   | True                              |
|     min_object_size               | 100                               |
|     max_object_size               | 4194304                           |
|     default_expire                | 600                               |
|     heuristic_expire              | False                             |
|     max_cache_size                | 0                                 |
|     query_cacheable               | True                              |
|     mime_types_group_refs[1]      | System‐Cacheable‐Resource‐Types   |
|     aggressive                    | False                             |
+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐+
</pre> 

**enabled** ­ Enable/disable HTTP object caching.

False = disable True = enable 

**xcache_header** ­ Enable/disable adding an X-Cache header to content served from the cache, which indicates to the client that the object was served from an intermediate cache.

False = disable True = enable 

**age_header** ­ Enable/disable adding an Age header to content served from the cache, to indicate to the client the number of seconds the object has been in the cache.

False = disable True = enable 

**date_header** ­ If a Date header was not added by the server, add a Date header to the object served from the cache. This indicates to the client when the object was originally sent by the server to the cache.

False = disable True = enable 

**query_cacheable** ­ Allow caching of objects whose URI included a query argument. When disabled, these objects are not cached. When enabled, the request must match the URI query to be considered a hit.

False = disable True = enable 

**default_expire** ­ Default expiration time of cache objects received from the server without a Cache­Control expiration header. This value may be overwritten by the Heuristic Expire setting heuristic_expire.­ If a response object from the server does not include the Cache-Control header, but does include a Last-Modified header, the system will use this time to calculate the Cache-Control expiration. If unable to solicit a Last-Modified header, then the system will fall back to the Cache Expire Time value.

False = disable True = enable 

**min_object_size** ­ Minimum size object to store in the cache.

False = disable True = enable 

**max_object_size** ­ Maximum size object to store in the cache.

False = disable True = enable 

**max_cache_size** ­ Maximum size, in bytes, of the cache. The default (zero) indicates auto configuration. 

**mime_types_list** ­ Whitelist cacheable mime types. If both the Cacheable Mime Types string list and string group are empty, this defaults to the following: /*//*

text//*, images//* 

**mime_types_black_list** ­ Blacklist non­-cacheable mime types.

text/css, text/blah 

**mime_types_group_uuids** ­ Whitelist string group of cacheable mime types. 

**mime_types_black_group_uuids** ­ Blacklist string group of non­cacheable mime types. 

**aggressive** ­ Enable/disable caching objects without Cache­Control headers.

False = disable True = enable 

 

### Show Cached Objects from the Pool's Cache

<pre class="">: &gt; show pool prod-l7-pool httpcache

Config: enabled=True min_object_size=0 max_object_size=0 max_cache_size=33363600 default_expire=600
  age_header=True xcache_header=True heuristic_expire=0 date_header=True query_cacheable=0 aggressive=0
  mime_white_list=
  mime_white_group=
  effective_white_mime_types=*/*
  mime_black_list=
  mime_black_group=
  effective_black_mime_types=
--------------------------------------------------------------------------------
URI: /test.js
  ctype: application/x-javascript
  raw_key: pool-0-4]widgets.test.com:5000/test.js
  key: c5d6c9adf844e1c8671707e98bd1f767
  raw_extn:
  key_extn:
  data_size: 43056 meta_size: 205 hdr_size: 310 body_size: 42746 mbuf_head: 0x600006fb8880
  date_time: 1410026395 last_mod_time: 1409662024 etag: "830a10a95fb2a1cac5290f:1409662024"
  CLI Support
   (Sat Sep 6 17:59:55 2014) (Tue Sep 2 12:47:04 2014)
  in_time: 1410026395 exp_age: 604800 init_age: last_used: reuse_cnt:
  (Sat Sep 6 17:59:55 2014) (Sat Sep 13 17:59:55 2014)
  handle: 0x600000df1548 proc_id: C1_L7 refcnt: 1
  mcache_out: has_vary: True no_exp_info: exp_age_hrt: is_expired:
  is_purged: no_txm: proxy_reval: must_reval: reval:
  ae_type_bm: 0xb (IGD) ce_type_bm: ce_top: is_chunked:
--------------------------------------------------------------------------------</pre> 

 

### Show Cache Statistics

<pre>: &gt; show pool prod-l7-pool httpcachestats

+-------------------+----------------+
| Field             | Value          |
+-------------------+----------------+
| se_ref            | SE_Aggregate   |
| proc_id           | PROC_Aggregate |
| available_size    | 667273600      |
| current_size      | 19680552       |
| objects           | 925            |
| lookups           | 3244           |
| hits              | 1              |
| additions         | 941            |
| deletions         | 16             |
| out_of_mem_evicts | 0              |
| served_bytes      | 1706           |
+-------------------+----------------+</pre> 

 

### Clear Cache Objects

<pre>: &gt; clear pool prod‐l7‐pool httpcache</pre> 

 

### Clear Cache Statistics

<pre>: &gt; clear pool prod‐l7‐pool httpcachestats</pre> 

 

### Filter Cache Objects

<pre>: &gt; show pool prod-l7-pool httpcache filter resource_type html

+----------------------------------------------------------------
URI: /boxtv.cms
ctype: text/html
raw_key: pool-0-4-test.com:5000/test.cms
key: d6fae30e568de8cef6fd40f5
key_extn:
  data_size: 763             meta_size: 160
  date_time: 1410026396      last_mod_time: 1409953279
    (Sat Sep 6 17:59:56 2014)  (Fri Sep 5 21:41:19 2014)
  in_time: 1410026396        exp_age: 13283
    (Sat Sep 6 17:59:56 2014)  (Sat Sep 6 21:41:19 2014)
...
-----------------------------------------------------------------</pre> 

 

Here is another example.

<pre>: &gt; show virtualservice prod-l7 httpstats

+---------------------+--------+
| Field               | Value  |
+---------------------+--------+
| ...                          |
| cache_hits          | 83     |
| cache_bytes         | 713364 |
+---------------------+--------+</pre> 