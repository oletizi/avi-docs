---
title: Determine When an Object Was Created / Modified / Deleted
layout: default
---
View the events log to inspect when an object was created, modified, or deleted.

 

### GUI

For tier one objects such as virtual services, pools, Service Engines, and Controllers, an event tab exists within the object's details page of the GUI.  This will filter the events to only show entries for the specific object.  For an event such as create, change the display time to show a long enough frame of time to include the desired event.  If the object is deleted, it is not possible to navigate into the object to view its events.

All events are able to be viewed view the *Operations > All Events* page.  This page is unfiltered and shows all objects, even after they have been deleted.  This includes sub objects such as profiles, certificates and groups.  Note that some roles may not have permissions to the Operations tab.

 

### API

CONFIG_CREATE API, looking back through the events for a period of one year.
https://10.1.1.1/api/analytics/logs?type=2&page_size=10000&filter=co(all,%22**config_create**%22)&filter=ne(internal,EVENT_INTERNAL)&filter=co(event_pages,EVENT_PAGE_ALL)&end=2015-11-17T02:29:13.073Z&duration=31536000&step=262800

 

CONFIG_DELETE API, looking back through the events for a period of one year.
https://10.1.1.1/api/analytics/logs?type=2&page_size=10000&filter=co(all,%22**config_delete**%22)&filter=ne(internal,EVENT_INTERNAL)&filter=co(event_pages,EVENT_PAGE_ALL)&end=2015-11-17T02:29:13.073Z&duration=31536000&step=262800