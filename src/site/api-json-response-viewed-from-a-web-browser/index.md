---
title: API: JSON Response Viewed in a Web Browser
layout: default
---
API responses from the Avi Controller are formatted as JSON. When viewed from within a web browser, the responses look like endless run-on sentences:
<pre><code class="language-lua">{"dimensions": ["METRICS_DIMENSION_METRIC_TIMESTAMP", "METRICS_DIMENSION_COUNTRY", "METRICS_DIMENSION_OS", "METRICS_DIMENSION_URL", "METRICS_DIMENSION_DEVTYPE"], "anomaly_options": {"entity": {"description": "uuid of the entity type"}, "server": {"description": "server ip:port"}, "metric_entity": {"default": 1, "description": "Metrics Types supported"}, {
  "dimensions": [
    "METRICS_DIMENSION_METRIC_TIMESTAMP",
    "METRICS_DIMENSION_COUNTRY",
    "METRICS_DIMENSION_OS",
    "METRICS_DIMENSION_LANG",
  ],
  "anomaly_options": {
    "entity": {
      "description": "uuid of the entity type"
    },
    "server": {
      "description": "server ip:port"
    },</code></pre>

To view the JSON blob in a human-readable format such as in this example, install a JSON viewer extension to your browser. (There are many free viewers available for all browsers.)

<pre><code class="language-lua">{"dimensions": ["METRICS_DIMENSION_METRIC_TIMESTAMP", "METRICS_DIMENSION_COUNTRY", "METRICS_DIMENSION_OS", "METRICS_DIMENSION_URL", "METRICS_DIMENSION_DEVTYPE"], "anomaly_options": {"entity": {"description": "uuid of the entity type"}, "server": {"description": "server ip:port"}, "metric_entity": {"default": 1, "description": "Metrics Types supported"}, {
  "dimensions": [
    "METRICS_DIMENSION_METRIC_TIMESTAMP",
    "METRICS_DIMENSION_COUNTRY",
    "METRICS_DIMENSION_OS",
    "METRICS_DIMENSION_LANG",
  ],
  "anomaly_options": {
    "entity": {
      "description": "uuid of the entity type"
    },
    "server": {
      "description": "server ip:port"
    },</code></pre>