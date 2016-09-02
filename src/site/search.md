---
title: Search Results
layout: default
---
<ul id="search-results" style="list-style: none; padding: 0"></ul>
<script type="text/javascript">

var query = window.getURLParameter('search');
var client = algoliasearch('{{ site.search.applicationID }}', '{{ site.search.apiKey }}');
var index = client.initIndex('{{ site.search.index }}');
var params = { hitsPerPage: 20 };
index.search(query, params)
.then(
  function searchSuccess(content) {
 	var $displayList = $('#search-results');
    for (var i = 0; i < content.hits.length; ++i) {
 	  var hit = content.hits[i];
 	  var snippet = hit.content;
 	  $displayList.append("<li><a href=\"" + hit.permalink + "\">" 
 	  + "<h2>" + hit.post_title + "</h2>"
 	  + "<p class=\"link\">" + hit.permalink + "</p>"
 	  + "<p class=\"snippet\">" + snippet + "</p>"
 	  + "</a></li>")
 	}
 })
 .catch(function searchFailure(err) {
 	console.error(err);
 });
</script>