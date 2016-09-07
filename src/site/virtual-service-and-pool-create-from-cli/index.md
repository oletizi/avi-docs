---
title: CLI: Virtual Service and Pool Creation
layout: default
---
During virtual service creation, the virtual service will need to point to a pool, which the system expects to exist already.

From the CLI, this configuration can be performed as two tasks:

1. 
Create the pool.
1. 
Create the virtual service.

### Pool Creation

: > configure pool Test : pool> servers ip 10.1.1.100 port 80 : pool:servers> save : pool> servers ip 10.1.1.101 port 80 : pool:servers> save : pool> where Tenant: admin +------------+------------+ | Field | Value | +------------+------------+ | name | Test | | servers[1] | | | ip | 10.1.1.100 | | port | 80 | | servers[2] | | | ip | 10.1.1.101 | | port | 80 | +------------+------------+ : pool> save

 

### Virtual Service Creation

Once the pool is created, the next step is to create the virtual service:
: > configure virtualservice Test_VS : virtualservice> address 10.10.10.10 : virtualservice> services port 80 : virtualservice> pool_ref Test

     

Note: The example in this article shows only the minimum configuration required to successfully deploy a new application. Many additional options are available for customizing virtual services and pools.