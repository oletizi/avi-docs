---
title: SSH Key-based Login to Avi Controller
layout: layout171
---
Starting with release 16.3, Avi Vantage provides a mechanism to manage public keys whereby the admin user may login with the SSH rather than username-password credentials.  This article describes the CLI and REST API interfaces involved.

## **Using the Command Line Interface**

To upload a key:

<code>&gt;upload adminkey public_key "&lt;public key&gt;"</code>

To delete a specific key:

<code>&gt;delete adminkey public_key "&lt;public key&gt;"</code>

To delete all the keys:

<code>&gt;delete adminkey</code>

## **Using the REST API **

To upload a key:

<code>POST https://&lt;controller-ip&gt;/api/adminkey</code>
<code>JSON data: {"key":"&lt;public key&gt;"}</code>

To delete a specific key:

<code>DELETE https://&lt;controller-ip&gt;/api/adminkey?key=&lt;public key&gt;</code>

To delete all the keys:

<code>DELETE https://&lt;controller-ip&gt;/api/adminkey?key</code>
