---
title: Search Results
layout: default
---

<div id="version-options">Search in version: </div>

<ul id="search-results" style="list-style: none; padding: 0"></ul>
<script type="text/javascript">
$(document).ready(function(){
var query = window.getURLParameter('search');

var versions = '{{ site.search.versions }}'.split(" ");
console.log("versions: " + versions);
var versionOpts = '';
for (var i = 0; i < versions.length; i++) {
    console.log("Found version: " + versions[i]);
    versionOpts += "<li><a href=\"/search?search=" + query + "&index=" + versions[i] + "\">" + versions[i] + "</a></li>"
}

console.log("Version opts: " + versionOpts);
$('#version-options').append("<ul>" + versionOpts + "</ul>");

var indexName = getURLParameter('index');
indexName = indexName ? indexName : '{{ site.search.index }}'
console.log("Using index: " + indexName );
var client = algoliasearch('{{ site.search.applicationID }}', '{{ site.search.apiKey }}');
var index = client.initIndex(indexName);
var params = { hitsPerPage: 20 };
index.search(query, params)
.then(
  function searchSuccess(content) {
 	var $displayList = $('#search-results');
    for (var i = 0; i < content.hits.length; ++i) {
 	  var hit = content.hits[i];
 	  var snippet = hit.text;
 	  $displayList.append("<li><a href=\"" + hit.url + "\">" 
 	  + "<h2>" + hit.title + "</h2>"
 	  + "<p class=\"link\">" + hit.url + "</p>"
 	  + "<p class=\"snippet\">" + snippet + "</p>"
 	  + "</a></li>")
 	}
 })
 .catch(function searchFailure(err) {
 	console.error(err);
 });

});
</script>