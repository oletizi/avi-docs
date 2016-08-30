<!DOCTYPE html>
<html>
<head>
  {% include head.html %}
</head>
<body>

{% include header.html %}

<div class="content">
  <aside class="sidebar col-1" role="complementary">
    <section class="widget search-form">
      <form role="search" method="get" class="search-form form-inline" action="https://kb.avinetworks.com/">
        <div class="input-group">
          <span class="algolia-autocomplete"><input type="search" value="" name="s"
                                                    class="search-field form-control aa-input tether-target tether-enabled tether-abutted tether-abutted-left tether-element-attached-top tether-element-attached-left tether-target-attached-bottom tether-target-attached-left"
                                                    placeholder="Search Avi KB" autocomplete="off" spellcheck="false"
                                                    dir="auto" style="position: relative; vertical-align: top;"><pre
                  aria-hidden="true"
                  style="position: absolute; visibility: hidden; white-space: pre; font-family: brandon_textregular, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; word-spacing: 0px; letter-spacing: normal; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre></span>
    <span class="input-group-btn">
      <button type="submit" class="search-submit btn btn-default">Search</button>
    </span>
        </div>
      </form>
    </section>
    <secton class="widget">
      {% include left-nav.html %}
    </secton>
  </aside>
  <div class="col-2">
    <h1 class="post-title">{{ page.title }}</h1>
    <div class="wrapper">
      {{ content }}
    </div>
  </div>
</div>

{% include footer.html %}

</body>

</html>
