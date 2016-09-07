---
title: DataScript: avi.vs.table_insert
layout: default
---
**Function** **avi.vs.table_insert( [table_name,] key, value [, lifetime] )** **Description** The table API is used to store and retrieve custom data. The avi.vs.table_insert API stores the value in a key-value store for the key. This key-value store is unique per virtual service and is mirrored across all Service Engines hosting the VS. **Events** HTTP_REQ
HTTP_RESP **Parameter** If the optional ***table_name*** is not specified, the key-value pair is stored in a default table for the VS. When it is specified, a new table with the custom name will be used. A virtual service with multiple tables can have the same key name with different values for each table.

The ***key***is used to look up the value.

The ***value***is the custom data to be stored.

The optional ***lifetime***flag must be a positive integer, indicating the length of time in seconds this record should exist. When the time runs out, the key and value are silently discarded. If the lifetime flag is not specified, the default value of 300 seconds is used. **Returns** Returns Boolean true upon insertion success and false upon insertion failure. **Note** Inserting a key that already exists will update the lifetime value of the key. It does not override the value. **Example** TBD