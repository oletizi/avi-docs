---
title: API - HTTP PATCH Support
layout: default
---
Beginning in Avi Vantage 16.2, the HTTP method PATCH can be used in a limited fashion, as described in this article.

Vantage 16.2 supports use of PATCH to perform the following operations:

* Update scalar fields (string, bool, int32, and so on).
* Add a new entry to a list in an object.
* Update an entry in a list in an object.
* Unset scalar fields. This causes the fields to be reset to their default values, if applicable.
* Delete an entry from a list in an object.

### Editing Nested Fields

In the current release, editing nested fields using PATCH is supported only to a field depth of 1 (one). PATCH is not supported for editing objects with deep nesting characterestics. To accomplish an edit to a nested field, PATCH will expect the data to be in the following form:
{ "add": { } }

1

2
3

4
5 {

     "add" :  {
        

     }
}

or

{ "replace": { } }

1

2
3

4
5 {

     "replace" :  {
        

     }
}

or

{ "delete": { } }

1

2
3

4
5 {

     "delete" :  {
        

     }
}

In the case of scalar fields, both "add" or "replace" is equivalent in that they replace the value of the scalar field with the value provided. In the case of a list, "add" indicates that the specified set of entries needs to be added to the list and "replace" indicates that the list itself is replaced with what is specified in the request. "delete" is used to remove specified entries from the list.

## Examples

The following examples use PATCH to update server information in a pool. The pool is identified by its UUID.

### Add Servers to a Pool

This request to the Vantage API adds two new servers (1.1.1.1 and 1.1.1.2) to an existing pool.
API: /api/pool/pool_uuid Data: { "add": { "servers": [ { "ip": { "addr": "1.1.1.1", "type": "V4" } }, { "ip": { "addr": "1.1.1.2", "type": "V4" } } ] } }

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
15

16
17

18
19

20 API :  / api / pool / pool_uuid

Data :
{

     "add" :  {
         "servers" :  [

             {
                 "ip" :  {

                     "addr" :  "1.1.1.1" ,
                     "type" :  "V4"

                 }
             } ,

             {
                 "ip" :  {

                     "addr" :  "1.1.1.2" ,
                     "type" :  "V4"

                 }
             }

         ]
     }

}

### Update Server Information in a Pool

This request to the Vantage API updates one of the servers in an existing pool:
API: /api/pool/pool_uuid Data: { "add": { "servers": [ { "ip": { "addr": "1.1.1.1", "type": "V4" }, "ratio": 10 } ] } }

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
15 API :  / api / pool / pool_uuid

Data :
{

     "add" :  {
         "servers" :  [

             {
                 "ip" :  {

                     "addr" :  "1.1.1.1" ,
                     "type" :  "V4"

                 } ,
                 "ratio" :  10

             }
         ]

     }
}

Note: If a field is an array of structures, each structure is typically identified by a key (combination of the fields within the structure). This is used to identify the element in the list to update. In the case of pool servers, the server key is identified by "ip", "port".

### Replace servers in a pool with a new set of servers

This request replaces the entire server list with a new server list. The other fields of the pool remain intact.
API: /api/pool/pool_uuid Data: { "replace": { "servers": [ { "ip": { "addr": "3.3.3.3", "type": "V4" }, }, { "ip": { "addr": "3.3.3.4", "type": "V4" }, } ] } }

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
15

16
17

18
19

20 API :  / api / pool / pool_uuid

Data :
{

     "replace" :  {
         "servers" :  [

             {
                 "ip" :  {

                     "addr" :  "3.3.3.3" ,
                     "type" :  "V4"

                 } ,
             } ,

             {
                 "ip" :  {

                     "addr" :  "3.3.3.4" ,
                     "type" :  "V4"

                 } ,
             }

         ]
     }

}

### Delete a Server from a Pool

This request deletes one of the servers from an existing pool:
API: /api/pool/pool_uuid Data: { "delete": { "servers": [ { "ip": { "addr": "3.3.3.3", "type": "V4" }, } ] } }

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

14 API :  / api / pool / pool_uuid

Data :
{

     "delete" :  {
         "servers" :  [

             {
                 "ip" :  {

                     "addr" :  "3.3.3.3" ,
                     "type" :  "V4"

                 } ,
             }

         ]
     }

}

### Updating Scalar Fields

The examples in this section set some scalar fields.
The following request enables HTTP request queuing and sets the default server port to 8080.
API: /api/pool/pool_uuid Data: { "replace": { "request_queue_enabled": True, "default_server_port": 8080 } }

1

2
3

4
5

6
7

8 API :  / api / pool / pool_uuid

Data :
{

     "replace" :  {
         "request_queue_enabled" :  True ,

         "default_server_port" :  8080
     }

}

The following request resets the default server port to the system default, by deleting its explicit setting from the pool.

API: /api/pool/pool_uuid Data: { "delete": { "default_server_port": 8080 } }

1

2
3

4
5

6
7 API :  / api / pool / pool_uuid

Data :
{

     "delete" :  {
         "default_server_port" :  8080

     }
}