---
title: DataScript: avi.vs.table_refresh
layout: default
---
**Function** **avi.vs.table_refresh( [table_name,] key [, lifetime_exten] )** **Description** Refreshes the lifetime of the entry for the key in the key/value store. **Events** HTTP_REQ
HTTP_RESP **Parameter** Looks up the key in the default VS table, unless another table name is specified via the optional ***table_name***.

The **key** is used to search for the desired table entry.

The optional ***lifetime_exten***, a positive integer, is the value in seconds by which to extend the lifetime of the entry in the key/value store. When it is not specified, the default value of 300 seconds is used to extend the lifetime of the entry. **Returns** Boolean *true* upon refresh success and *false* upon refresh failure. **Note** The key/value entry will be removed from all Service Engines hosting the VS. **Example** TBD