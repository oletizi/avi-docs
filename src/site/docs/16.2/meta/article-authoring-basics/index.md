---
title: Article Authoring Basics
layout: 16.2
---

## Markdown

The documentation is written primarily [in Markdown](https://daringfireball.net/projects/markdown/syntax) (actually, a slight variant called [Kramdown](http://kramdown.gettalong.org/syntax.html)), with HTML required in some instances. The syntax is very simple and readable. The basics can be learned in five minuts or less:

>    <https://daringfireball.net/projects/markdown/syntax>

## Links

The standard markdown syntax for links looks like this:

>   `[the text of the link](http://example.com/)`

TODO: describe when you have to use HTML syntax

## Images

1. create a directory called "img" in the article folder
1. take a screenshot or locate the image you want to include.
1. Copy/move your screenshot (or other image) to the img folder
1. Rename the screenshot something meaningful
1. Add an image tag referencing that screenshot:
    >    `<img src="img/my-screenshot.png">`

### Horizontal Alignment

If you would like to align images horizantally (left, center, right), add one of the classes to the image tag:

**Left aligned:** 
>   `<img class="alignleft" src="img/myimage.png" alt="some alt text" title="some title text">`

**Centered:** 
>   `<img class="aligncenter" src="img/myimage.png" alt="some alt text" title="some title text">`

**Right aligned:** 
>   `<img class="alignright" src="img/myimage.png" alt="some alt text" title="some title text">`

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

---

## Code

Code blocks, including DataScript, can be formatted and highlighted using the `highlight` tag:

**Example:**

<pre>
{&#37; highlight lua linenos &#37;}
local ccTLD_map = {es="01345F", fi="5146FF", cn="45DFX", io="123456", ly="ABC123"}
host = avi.http.host()

if not host then
  avi.http.close_conn()
elseif string.sub(host, 1, #"www.avi.") == "www.avi." then
  i,j = string.find(host, "avi")
  ccTLD = string.sub(host, j+2, -1)
  new_query = "?mandate=" .. ccTLD_map[ccTLD]
  old_query = avi.http.get_query()

  if #old_query &gt; 0 then
    new_query = new_query .. "&amp;" .. old_query
  end
    avi.http.redirect("www.avi.com" ..
      avi.http.get_path() ..
      new_query, 302)
end
{&#37; endhighlight &#37;}
</pre>

**Result**

{% highlight lua linenos %}
local ccTLD_map = {es="01345F", fi="5146FF", cn="45DFX", io="123456", ly="ABC123"}
host = avi.http.host()

if not host then
  avi.http.close_conn()
elseif string.sub(host, 1, #"www.avi.") == "www.avi." then
  i,j = string.find(host, "avi")
  ccTLD = string.sub(host, j+2, -1)
  new_query = "?mandate=" .. ccTLD_map[ccTLD]
  old_query = avi.http.get_query()

  if #old_query > 0 then
    new_query = new_query .. " & " .. old_query
  end
    avi.http.redirect("www.avi.com" ..
      avi.http.get_path() ..
      new_query, 302)
end
{% endhighlight %}

## CLI


## Lists 

## Links

### Cross-Referencing Other Articles

Here's a link to <a href="/docs/16.2/tenants/">the Tenants article &rsaquo;</a>

* TODO: Describe the link structure and why it's important to embed the version number in the url

### Links to Outside Resources


