---
title: Article Authoring Basics
layout: default
---

## Markdown

The documentation is written primarily [in Markdown](https://daringfireball.net/projects/markdown/syntax) (actually, a slight variant called [Kramdown](http://kramdown.gettalong.org/syntax.html)), with HTML required in some instances. The syntax is very simple and readable. The basics can be learned in five minuts or less:

>    <https://daringfireball.net/projects/markdown/syntax>

## Links

The standard markdown syntax for links looks like this:

>   `[the text of the link](http://example.com/)`

## Images

1. create a directory called "img" in the article folder
1. take a screenshot or locate the image you want to include.
1. Copy/move your screenshot (or other image) to the img folder
1. Rename the screenshot something meaningful
1. Add an image tag referencing that screenshot:
    >    `<img src="img/my-screenshot.png">`

## Captioned Figures

1. Follow the [steps above to create and copy/move your image](#inserting-an-image)
1. Include the "figure.html" macro (everything except the "url" parameter is optional):
    <pre>
    {&#37; include figure.html 
      url="img/the-filename-of-your-image" 
      caption="Add your caption here"
      align="&lt;alignleft|aligncenter|alignright&gt;"
      alt="put some alt text in" title="give the image a title" &#37;}  
    </pre>

## Code

## Lists 

## CLI

## Links

### Cross-Referencing Other Articles

Here's a link to <a href="/docs/16.2.2/tenants/">the Tenants article &rsaquo;</a>

* TODO: Describe the link structure and why it's important to embed the version number in the url

### Links to Outside Resources


