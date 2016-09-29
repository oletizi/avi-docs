---
title: System Requirements&#58; Hardware
layout: default
---
Avi Vantage runs on standard x86-based servers, with no requirement for special-purpose hardware. In general, adding hardware capacity will greatly expand overall system capacity, for both SEs and Controllers. Please consult an Avi sales engineer or Avi technical support for recommendations tailored to meet the specific needs of your applications and environment.

The minimum hardware requirements are:

* **Controller:** 8 vCPU cores, 24 GB RAM, and 64 GB of storage. (Click <a href="/docs/latest/avi-controller-sizing">here</a> for more details about sizing the Avi Controllers.)
* **Service Engine:** 2 vCPU cores, 2 GB RAM, and 10 GB of storage. (Click <a href="/docs/latest/sizing-service-engines">here</a> for more details.) 

A typical deployment will have three Controllers in a redundant Controller cluster. The number of SEs required will depend on the number of applications being served by Avi Vantage and the configured level of redundancy.

**Notes:**

* Reservation for CPU and memory is strongly preferred, but not required.
* Modifying resource settings on VMs, such as CPU cores or RAM, requires powering down the VM, making the changes, and then powering the VM back on. 