/**
 * Reset some basic elements
 */
body, h1, h2, h3, h4, h5, h6,
p, blockquote, pre, hr,
dl, dd, ol, ul, figure {
  margin: 0;
  padding: 0;
}

/**
 * Basic styling
 */
body {
  font: $base-font-weight #{$base-font-size}/#{$base-line-height} $base-font-family;
  color: $text-color;
  background-color: $background-color;
  -webkit-text-size-adjust: 100%;
  -webkit-font-feature-settings: "kern" 1;
  -moz-font-feature-settings: "kern" 1;
  -o-font-feature-settings: "kern" 1;
  font-feature-settings: "kern" 1;
  font-kerning: normal;
}

/**
 * Set `margin-bottom` to maintain vertical rhythm
 */
h1, h2, h3, h4, h5, h6,
p, blockquote, pre,
ul, ol, dl, figure,
%vertical-rhythm {
  margin-bottom: $spacing-unit / 2;
}

h1, h2, h3, h4, h5, h6 {
  font-family: brandon-medium;
}

h1 {
  font-size: 34px;
}

/**
 * Images
 */
img {
  max-width: 100%;
  vertical-align: middle;
}

/**
 * Figures
 */
figure > img {
  display: block;
}

figcaption {
  font-size: $small-font-size;
}

/**
 * Lists
 */
ul, ol {
  margin-left: $spacing-unit;
}

li {
  > ul,
  > ol {
    margin-bottom: 0;
  }
}

/**
 * Headings
 */
h1, h2, h3, h4, h5, h6 {
  font-weight: $base-font-weight;
}

/**
 * Links
 */
a {
  color: $brand-color;
  text-decoration: none;

  &:visited {
    color: darken($brand-color, 15%);
  }

  &:hover {
    color: $text-color;
    text-decoration: underline;
  }
}

/**
 * Blockquotes
 */
blockquote {
  color: $brand-color;
  border-left: 4px solid $grey-color-light;
  padding-left: $spacing-unit / 2;
  font-style: italic;

  > :last-child {
    margin-bottom: 0;
  }
}

/**
 * Code formatting
 */
pre,
code {
  font-family: Inconsolata;
  font-size: 15px;
  /*    border: 1px solid $grey-color-light;
      border-radius: 3px;
      background-color: #eef;
      */
}

pre.console, code.console {
  background-color: #000000;
  color: #ffffff;
}

code {
  padding: 1px 5px;
}

pre {
  padding: 8px 12px;
  overflow-x: auto;

  > code {
    border: 0;
    padding-right: 0;
    padding-left: 0;
  }
}

/**
 * Wrapper
 */
.wrapper {
  max-width: -webkit-calc(#{$content-width} - (#{$spacing-unit} * 2));
  max-width: calc(#{$content-width} - (#{$spacing-unit} * 2));
  margin-right: auto;
  margin-left: auto;
  padding-right: $spacing-unit;
  padding-left: $spacing-unit;
  @extend %clearfix;

  @include media-query($on-laptop) {
    max-width: -webkit-calc(#{$content-width} - (#{$spacing-unit}));
    max-width: calc(#{$content-width} - (#{$spacing-unit}));
    padding-right: $spacing-unit / 2;
    padding-left: $spacing-unit / 2;
  }
}

/**
 * Clearfix
 */
%clearfix {

  &:after {
    content: "";
    display: table;
    clear: both;
  }
}

/**
 * Icons
 */
.icon {

  > svg {
    display: inline-block;
    width: 16px;
    height: 16px;
    vertical-align: middle;

    path {
      fill: $grey-color;
    }
  }
}

/**
 * Tables
 */
table {
  border-collapse: collapse;
}
th, td {
  padding: 8px;
  line-height: 1.428571429;
  vertical-align: top;
}

tr {
  border-top: 1px solid #ddd
}

tr:hover {
  background-color: #f6f6f6;
}