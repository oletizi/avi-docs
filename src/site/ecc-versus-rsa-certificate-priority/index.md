---
title: EC versus RSA Certificate Priority
layout: default
---
A virtual service may be configured with both Elliptic Curve (EC) and RSA certificates, to support clients of each type.

When a virtual service is configured with both EC and RSA certificates, Vantage will prioritize on the EC certificates. 

* 
If a client supports ciphers from only one certificate type, Vantage uses that certificate type. 
* 
If the client supports ciphers for both types of certificates, and the virtual service is configured with both types of certificates, the EC certificate will be chosen.

The priority of ECC over RSA is not configurable. Vantage prefers EC instead of RSA due to EC's significantly faster performance with handshake negotiation. On average, processing for ECC is about four times less CPU-intensive than for RSA.

EC also tends to provide significantly higher security. A 256-bit EC certificate (the minimum length supported) is roughly equivalent to a 3k RSA cert.  Additionally, EC cryptography enables Perfect Forward Secrecy (PFS) with significantly less overhead.