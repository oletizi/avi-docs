---
title: SSL / TLS Version Support
layout: layout163
---
Avi Vantage recommends staying up to date with SSL-related security alerts, and ensuring that support for deprecated or insecure versions and ciphers is quickly removed.

Avi Vantage version 15.2 and higher supports the following:

* TLS 1.0
* TLS 1.1
* TLS 1.2  

Vantage version 15.1 and lower supports:

* SSL v3
* TLS 1.0
* TLS 1.1
* TLS 1.2  

Support for SSL v2 and v3 is deprecated in Avi Vantage 15.2 and higher, since these protocols are highly insecure and have been deprecated.

Administrators may customize the allowed SSL / TLS versions within individual TLS profiles. (Navigate to Templates > Security > SSL / TLS Profile.)
