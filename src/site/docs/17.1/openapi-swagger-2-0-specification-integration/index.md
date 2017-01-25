---
title: OpenAPI (Swagger 2&#46;0) Specification Integration
layout: layout171
---
Starting with release 16.3, Avi Vantage includes support for the <a href="http://github.com/OAI/OpenAPI-Specification"><span style="font-weight: 400;">OpenAPI Specification</span></a>(fka Swagger RESTful API Documentation Specification). It can be accessed via the Avi API Documentation link in the pull-down menu, as shown in the below screenshot.

<a href="img/Screen-Shot-2016-11-14-at-5.17.57-AM.png"><img class="aligncenter wp-image-19977" src="img/Screen-Shot-2016-11-14-at-5.17.57-AM.png" alt="Accessing Avi API documentation from the UI" width="800" height="172"></a>

## **Swagger UI Integration into Avi Controller**

The Swagger UI is fully integrated into the Avi Controller. Admins can search from a list of API specifications via search bar as shown.

<a href="img/Screen-Shot-2016-11-14-at-5.26.44-AM.png"><img class="aligncenter wp-image-19980" src="img/Screen-Shot-2016-11-14-at-5.26.44-AM.png" alt="Selecting documentation for the Pool object" width="800" height="293"></a>

Once a resource is selected, the location of the specification file is shown on the top right corner of the page. These specifications can be downloaded and used with<a href="http://swagger.io/tools/"><span style="font-weight: 400;"> swagger tools </span></a>like
<ol> 
 <li style="font-weight: 400;"><a href="http://swagger.io/tools/swagger-editor"><b>Swagger Editor</b></a><span style="font-weight: 400;">: Interactive tool for developing and viewing Swagger specifications.</span></li> 
 <li style="font-weight: 400;"><a href="http://swagger.io/tools/swagger-codegen"><b>Swagger Codegen</b></a><span style="font-weight: 400;">: Generates Client SDKs in several languages.</span></li> 
</ol> 

## **Swagger API “Try it out” Feature**

Swagger UI also has a built-in “try it out!” functionality to try the API right from the context of the API documentation. The feature requires basic authentication setting to be enabled in the Avi Controller. 

The output provides
<ol> 
 <li style="font-weight: 400;"><span style="font-weight: 400;">Allowed query and body parameters</span></li> 
 <li style="font-weight: 400;"><span style="font-weight: 400;">Equivalent <code>curl</code> command for the API</span></li> 
 <li style="font-weight: 400;"><span style="font-weight: 400;">API response from the Controller</span></li> 
</ol> 

The following shows example of fetching all the pools via try it out!

<a href="img/pool-doc.png"><img class="aligncenter wp-image-19982" src="img/pool-doc.png" alt="Pool object documentation" width="800" height="727"></a>
