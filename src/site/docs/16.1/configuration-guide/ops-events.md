---
layout: configuration-guide
title: Events
---

Events are used throughout the system to provide a history of relevant changes that have occurred. Events are a permanent record, and can be used to generate Alerts which can take action on the Event. Events are viewable in the context of specific objects, such as a Virtual Service, a Pool, or a Server. Viewing Events from the Operations menu provides an unfiltered view of all Events across the system or the tenant.

### All Events

Select Operations > Events to open the All Events page, which shows all Events for the entire Avi Vantage system. Events pages elsewhere within Avi Vantage will be filtered by the context of the section they exist within, such as only showing Events relevant to the Virtual Service they are being viewed within.

<a href="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_events-2.jpg" rel="attachment wp-att-4967"><img src="http://kb.avinetworks.com/wp-content/uploads/2015/12/admin_events-2.jpg" alt="admin_events" width="862" height="408" class="alignnone size-full wp-image-4967" /></a>

The top of this page displays the following items:

*   **Search:** The Search field allows you to filter the audit trail using whole words contained within the individual events.

*   **Refresh:** Updates the audit trail events that are displayed for the selected time frame.

*   **Number:** Total number of entries being displayed. The date/time range of those events appear beneath the Search field on the left.

*   **Clear Selected:** If filters have been added to the Search field, the Clear Selected X icon on the right side of the search bar will remove those filters. Each active search filter will also contain an X that can be clicked to remove a specific filter.

*   **Histogram:** The Histogram shows the number of events over the period of time selected. The X-axis is time, while the Y-axis is the number of events during that bar's period of time.
    
    *   Hovering the cursor over a Histogram bar displays the number of entries represented by that bar during a period of time.
    
    *   Click and drag inside the histogram to refine the date/time period which further filters the events shown. When drilling in on the time in the Histogram, a Zoom to Selected link appears above the Histogram. This expands the drilled in time to expand to the width of the Histogram, and also changes the Displaying time pull-down menu to Custom. To return to the previously selected time period, use the Display menu to select a new time period.

*   **Include Internal**: By default, a number of events are not shown as they tend to be noisy and less relevant for general purpose.  Avi support may ask to enable this option when working with support to troubleshoot more esoteric issues.

### Config Audit Trail

Select Operations > Events > Config Audit to open the Config Audit Trail page, which presents an audit trail of user activity events as well as changes to the system configuration over the period of time selected. This is a filtered view of the All Events, showing only events related to configuration changes.

![][1]

The table at the bottom of the Config Audit Trail tab displays the events that matched the current time window and any potential filters. The following information appears for each event:

*   **Timestamp:** Date and time the event occurred. Highlighting a section of the Histogram allows further filtering of events within a smaller time window.

*   **Event Type:** This page is scoped to only show Configuration event types. Configuration events track changes to the Avi Vantage configuration. These changes may be made by an administrator (through the CLI, API, or GUI), or by automated policies.

*   **Resource Name:** Name of the object related to the event, such as the Pool, Virtual Service, Service Engine, or Controller. For User_Login Events, this will show the username that attempted to log in.

*   **Event Code:** A short event definition, such as User_Login, Config_Create, Config_Modify, or Config_Delete.

*   **Description:** A complete event definition. For configuration events, the description will also show the username of the Avi Vantage account that made the change.

*   **Expand/Contract:** Clicking the + plus or - minus sign for an event log either expands that event log to display more detail or contracts that event log to display only summary information. Clicking the plus and minus icons in the table header expands and collapses all entries in this tab.

For configuration events, expanding the event displays a difference comparison between the previous and new configurations.

*   New fields will appear highlighted in green in the new configuration.

*   Removed fields will appear highlighted in red.

*   Changed fields will show highlighted in yellow.

 [1]: /wp-content/uploads/2016/01/admin_configuration.jpg