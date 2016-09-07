---
title: DataScript: avi.vs.table_remove
layout: default
---
**Function** **avi.vs.table_remove( [table_name,] key )** **Description** The table API is used to store and retrieve custom data. The avi.vs.table_remove API removes a specified key/value pair from the data store for the specified key. **Events** HTTP_REQ
HTTP_RESP **Parameter** If the optional***table_name*** is not specified, the key is looked up in the default table for the VS. When it is specified, a custom table will be searched.

The ***key***is used to search for the table entry to be deleted. **Returns** None **Note** The key/value entry will be removed from all Service Engines hosting the VS. **Example** TBD