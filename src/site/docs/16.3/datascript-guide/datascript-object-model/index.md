---
title: DataScript&#58; Object Model
layout: 16.3
---
DataScripts are attached to Virtual Services. Each DataScript will executed when an event is triggered, such as an HTTP request or HTTP response is received by the Virtual Service. Each DataScript objects will include at least one, and potentially more events.

A Virtual Service may have multiple DataScripts attached. If multiple DataScripts use the same events, such as HTTP request, then the order of the DataScripts assigned to the Virtual Service will be taken into account for the order of processing of the DataScripts. For instance, if the first DataScript is set to discard all client requests to the /secure directory, and the second DataScript is set to redirect all authenticated clients making requests for the /secure directory to a different path, the second DataScript will never be executed.

The supported events are:

* **HTTP_REQ** - This event triggers when the request line and all the headers of the HTTP request have been parsed successfully, but before any potential POST body has been received.
* **HTTP_RESP** - This event triggers when the response status line and all headers of the HTTP response have been parsed successfully, but before the response body has been received. 

This object model allows the flexibility to create a library of DataScripts. A Virtual Service can be configured to refer to any DataScript object from this collection, provided it is of the same protocol as the DataScript’s events. To use a DataScript with an HTTP request event, the Virtual Service must be configured for application type HTTP. Each Virtual Service object can refer to any number of DataScripts. All DataScripts are parsed during configuration time. Hence, any incorrect DataScript would result in a failure when attempting to save the new or modified DataScript. The configuration time error is reported as an aid in debugging. When a DataScript execution encounters a failure, the script execution aborts for that HTTP request or response. An HTTP Internal Server Error is sent to the client and a client log is generated with the stack trace of the aborted script to aid in debugging.

 