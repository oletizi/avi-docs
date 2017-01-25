---
title: Alert Config
layout: 16.2
---
<a href="img/Alert-Workflow.png"><img class=" wp-image-8402 alignright" src="img/Alert-Workflow.png" alt="Alert Workflow" width="490" height="89"></a>Events trigger alerts to actively highlight important information. Avi Vantage includes a number of default alerts via the Operations &gt; Alerts &gt; Alert Config page. The default system alerts may not be deleted, but can be modified or disabled. Alert configs are triggers that determine whether or not an alert should be generated. See the <a href="/docs/16.2/alerts-overview">Alerts Overview</a> for a broader description of the entire process depicted in the above graphic.

### Create an Alert Config

Alert config objects are triggers which determine if a set conditions are true, and then execute the configured actions. The create/edit modal is organized into three sections.

<a href="img/AlertConfig-1.png"><img class="size-full wp-image-7490 alignright" src="img/AlertConfig-1.png" alt="AlertConfig-1" width="321" height="245"></a>

### Basics:

* **Name**: Enter a unique name for the alert configuration.
* **Status**: Enable or disable the alert configuration from generating alerts.
* **Description**: Enter a custom description. 

 

### Condition:

The conditions must be true for the alert config to trigger the alert. If multiple conditions exist, then all conditions must be true.

* <a href="img/AlertConfig-2.png"><img class="size-full wp-image-7491 alignright" src="img/AlertConfig-2.png" alt="AlertConfig-2" width="322" height="446"></a>**Throttle Alert**: The alert may only be triggered once within the specified timeframe. A value of 0 indicates there will be no time-based throttling. The timer begins once the alert is triggered.
* **Source - Event**: An event triggers the alert.  See the <a href="/docs/16.2/events-list">Event List</a> for a list and brief description of all events.
* **Object**: Listen for the desired event within a specified virtual service, Service Engine, or pool.
* **Instance**: Choose from a list of objects, based on the previously defined object type.
* **Number of Occurrences**: The event must be seen X many times before the alert condition is met.
* **Rolling Window**: When unchecked, the condition is true when the Number of Occurrences is met. If the Occurrences value is set to 1, then every occurrence will trigger the alert (though the Throttle Alert may suppress any alerts beyond the first one). If the Occurrences is set to a higher number, such as 100, then the alert is triggered every 100 times the event happens. When the Rolling Window is checked, a corresponding Time Window field must be populated. If the number of Occurrences is true within the specified window of time, then the alert is triggered. Once the time window expires, the Number of Occurrences is reset and the counter begins again. For example, if a client attempts more than 100 TCP connections within a five minute window, trigger the alert.

* **Event Occurs**: Name the event that would trigger the alert.
* **Event Does Not Occur**: This field is optional. When set, this event must not be true during the same time window and number of occurrences as the event defined in the Event Occurs field. 

 

* **<a href="img/AlertConfig-3.png"><img class="size-full wp-image-7492 alignright" src="img/AlertConfig-3.png" alt="AlertConfig-3" width="322" height="212"></a>Source - Metric**:  Metrics trigger the alert. When the Source is set to Metric, a few different options are presented. See the <a href="/docs/16.2/metrics-list">Metric List</a> for a list and brief description of all metrics.
* **Metric Occurs**:  Select the desired metric.
* **Comparator**: The metric entry is compared via *greater than or equals*, *equals*, or *less than or equals* to the averaged entry in the Value field over the specified number of seconds.
* **Value**: Enter the scalar portion of the metric. For example, if one means to specify "2 milliseconds," "2" is the scalar and "milliseconds" is the unit of measure. After a selection is made in the Metric Occurs field, Vantage will auto-populate the unit portion of the Value field. The units of measurement for the various metrics are documented in the <a href="/docs/16.2/api-guide/metrics_query.html">Metrics Query API</a>.
* **Duration**: The alert is triggered if the metric's value is &gt;=, =, or &lt;= to the specified value field, averaged over the period of time specified by the duration.
* **Add New Metric Rule**: Additional rules may be specified. When multiple rules exist, all of them must be true. 

 

### Actions:

* <a href="img/AlertConfig-4.png"><img class="size-full wp-image-7493 alignright" src="img/AlertConfig-4.png" alt="AlertConfig-4" width="322" height="162"></a>Alert Action: Specify an alert action, which defines the type of notifications to generate or other tasks resulting from the triggered alert.
* Alert Expiry Time: The triggered alert will be visible in the Vantage web interface for this duration of time, after which it is deemed expired and deleted. 

 

 
