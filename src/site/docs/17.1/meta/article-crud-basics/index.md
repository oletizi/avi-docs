---
title: Article CRUD Basics
layout: layout163
---

{% include youtubePlayer.html id="seeUgfG48_w" %}

<!--
## Create a New Document

**Step 1:** Create a directory for the article in the relevant documentation version.

**Step 2:** Create a file called `index.md` in that directory

**Step 3:** Add the Jekyll frontmatter to the article. It looks like this:
<pre>
---
title: Article CRUD Basics
layout: layout163
---    
</pre>
Feel free to copy it from this document and paste it into your new document, then change the title. Leave the `layout` directive set to `default`

**Step 4:** Add your article text and save your document. See <a href="{% vpath %}/meta/article-authoring-basics">Authoring Basics</a> for basic authoring conventions and best-practices
 

## Add Your Article to the Navigation

If your article is new, you need to find a place to put it in the left navigation. Consult one of the documentation editors for help deciding where to put it.

The left navigation structure is kept here in the docs repo:
 
> avi-docs/src/site/_includes/left-nav.html

Open that file in your editor and add a link to it in the relevant location.

> **Note:** Links to documentation articles from the left nav should not specify a version. Use the "latest" path instead, e.g.:

{% highlight HTML %}... 
  <li><a href="/docs/latest/path/to/your/document/directory">My New Document</a></li>
...{% endhighlight %}

## Double-Check Your Article in Your Browser

* If you are


## Commit Your Changes

* TODO: Add steps

-->
