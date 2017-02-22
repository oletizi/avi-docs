---
title: HTTPS Responses Not Served from Cache
layout: layout163
---
When an HTTP application profile with caching enabled is attached to a virtual service, valid and redundant responses from the servers are expected to be served from the Avi Service Engine (SE) cache. However, if the connection between the client and the SE or the SE and the server uses SSL (with SSL terminated at the SE), responses will not be served from the cache. This is a known issue and will be resolved in a future release.
