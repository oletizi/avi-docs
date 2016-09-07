---
title: DataScript: avi.vs.table_lookup
layout: default
---
**Function** **avi.vs.table_lookup( [table_name,] key [, lifetime_exten] )** **Description** The table API is used to store and retrieve custom data. The avi.vs.table_lookup API looks up a key and return the corresponding value. This key-value store is unique per Virtual Service and is mirrored across all Service Engines hosting the VS. **Events** HTTP_REQ
HTTP_RESP **Parameter** If the optional ***table_name*** is not specified, the key is looked up in the default table for the VS. When it is specified, a custom table will be searched.

The ***key*** is used to look up the value.

The optional ***lifetime_exten*** flag must be a positive integer, indicating the length of time, in seconds, that should be added to the current lifetime parameter for the key. When not specified, the default value of 300 seconds is used.  This means that by default, looking up the value of a key will extend the lifetime of a key by an additional 300 seconds. **Returns** Returns Boolean true upon insertion success and false upon insertion failure. **Note** Inserting a key that already exists will update the lifetime parameter.  It does not override the value parameter. **Example** TBD