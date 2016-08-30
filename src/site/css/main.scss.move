---
---

@charset "utf-8";

// Our variables
//$base-font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
$font-root: "/static/fonts/";
$base-font-family: brandon-regular, "Helvetica Neue", Helvetica, Arial, sans-serif;
$base-font-size: 14px;
$base-font-weight: 400;
$small-font-size: $base-font-size * 0.875;
$base-line-height: 1.5;

$spacing-unit: 30px;

$text-color: #333;
$background-color: #fdfdfd;
$brand-color: #ff4b00;

$grey-color: #ccc;
$grey-color-light: lighten($grey-color, 40%);
$grey-color-dark: darken($grey-color, 25%);

$border-color: $grey-color;

// Width of the content area
$content-width: 800px;

$on-palm: 600px;
$on-laptop: 800px;

// Use media queries like this:
// @include media-query($on-palm) {
//     .wrapper {
//         padding-right: $spacing-unit / 2;
//         padding-left: $spacing-unit / 2;
//     }
// }
@mixin media-query($device) {
  @media screen and (min-width: $device) {
    @content;
  }
}

@mixin font-face($family-name, $filename) {
  @font-face {
    font-family: $family-name;
    src: url(quote($font-root + $filename + ".eot")); /* IE9 Compat Modes */
    src: url(quote($font-root + $filename + ".eot?#iefix")) format('embedded-opentype'), /* IE6-IE8 */
      //url(quote($font-root + $font-root + $filename +".woff2")) format('woff2'), /* Super Modern Browsers */
    url(quote($font-root + $filename + ".woff")) format('woff'), /* Pretty Modern Browsers */
    url(quote($font-root + $filename + ".ttf")) format('truetype'), /* Safari, Android, iOS */
    url(quote($font-root + $filename + ".svg#svgFontName")) format('svg'); /* Legacy iOS */
  }
}

@include font-face ("brandon-black", "brandontext-black-webfont");
@include font-face ("brandon-bold-italic", "brandontext-bolditalic-webfont");
@include font-face ("brandon-light-italic", "brandontext-lightitalic-webfont");
@include font-face ("brandon-medium", "brandontext-medium-webfont");
@include font-face ("brandon-medium-italic", "brandontext-mediumitalic-webfont");
@include font-face ("brandon-regular-italic", "brandontext-regularitalic-webfont");
@include font-face ("brandon-regular", "hvdfonts-brandontext-regular");

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  margin: 0px;
  padding-top: 125px;
  font: $base-font-size $base-font-family;
  line-height: 1.428571429;
  color: #333;
  background-color: transparent;
}

a {
  color: #ff4b00;
  text-decoration: none;
  background: transparent;
}

input, textarea, keygen, select, button {
  font: $base-font-size $base-font-family;
}

@include media-query($on-laptop) {
  header.banner {
    padding-top: 36px;
    transition: padding 0.3s;
    background-color: #2a2a2d;
    border-color: transparent;
    top: 0;
    border-width: 0 0 1px;
    border-radius: 0;
    position: fixed;
    right: 0;
    left: 0;
    z-index: 1030;
    min-height: 50px;
    display: block;
  }

  .container {
    padding-left: 25px;
    padding-right: 25px;
    // TODO: responsive media detection
    width: 1170px;
    margin-right: auto;
    margin-left: auto;

    .navbar-header {
      margin-right: 0;
      margin-left: 0;
      float: left;

      .navbar-toggle {
        // TODO: Make the display sensitive to screen size
        display: none;
        position: relative;
        float: right;
        margin-right: 15px;
        padding: 9px 10px;
        margin-top: 8px;
        margin-bottom: 8px;
        color: #eee;
        background-color: transparent;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 0;
      }

      .sr-only {
        position: absolute;
        width: 1px;
        height: 1px;
        margin: -1px;
        padding: 0;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        border: 0;
      }

      .site-title-container {
        margin: 0;

        h1.site-title {
          font-size: 11px;
          position: relative;
          line-height: initial;
          display: inline-block;
          margin: 0;
          img {
            margin-bottom: 10px;
          }
        }

        .site-title {
          float: left;
          clear: left;
          font-size: 18px;
          font-weight: bold;
          line-height: 48px;
          text-transform: uppercase;
          /* margin: -10px; */

          a {
            color: #fb5100;
          }
        }
      }

    }
  }

  .navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
    border-color: #101010;
    margin-right: 0;
    margin-left: 0;
    box-shadow: none;
  }

  .navbar-collapse {
    height: auto !important;
    max-height: 340px;
    overflow: visible !important;
    width: auto;
    border-top: 0;
    box-shadow: none;
  }

  .navbar-right {
    padding-right: 25px;
    padding-top: 15px;
    float: right !important;
    .sublinks {
      position: absolute;
      display: block;
      top: 15px;
      margin-left: -45px;
      a {
        color: #ff4b00;
        text-transform: uppercase;
        font-family: 'brandon-regular', sans-serif;
        text-decoration: none;
        font-size: 11px;
        margin-right: 5px;
      }
    }
    .btn {
      display: inline-block;
      margin-bottom: 0;
      font-weight: normal;
      text-align: center;
      vertical-align: middle;
      cursor: pointer;
      background-image: none;
      white-space: nowrap;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
    }

    .btn-primary {
      line-height: 40px;
      margin-top: 5px;
      padding: 0 15px;
      background-color: #ff4b00;
      color: #fff;
      border-radius: 3px;
      text-transform: uppercase;
      font-size: 14px;
      transition: background-color 0.3s, margin 0.3s;
      border: 0;
    }
  }

  .navbar-nav {
    float: left;
    margin-left: 25px;
    width: auto;

    padding-top: 15px;
    padding-left: 0;
    list-style: none;
    li {
      float: left;
      position: relative;
      display: block;
      a {
        display: block;
        margin-left: 0;
        margin-right: 0;
        padding-top: 15px;
        padding-bottom: 15px;
        color: white;
        background-color: transparent;
        transition: all 0.5s;
        font-size: 14px;
        font-weight: normal;
        line-height: 20px;
        text-decoration: none;
        text-transform: uppercase;
      }
      .dropdown-menu {
        position: absolute;
        left: 0;
        z-index: 1000;
        min-width: 160px;
        margin: 0;
        padding: 75px 0 15px;
        top: 30px;
        width: 220px;
        float: none;
        border-radius: 4px;
        list-style: none;
        font-size: 14px;
        background-clip: padding-box;
        display: none;
      }
    }
  }
}

.content {
  padding-left: 15px;
  .col-1, .col-2 {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
  }
  .sidebar {
    border-left: 1px solid #eee;

    .search-form {
      input, textarea, keygen, select, button {
        font-size: $small-font-size;
      }
      .input-group {
        position: relative;
        display: table-cell;
        z-index: 2;
        float: left;
        width: 100%;
        min-width: 225px;
        margin-bottom: 0;
        border-collapse: separate;
        border-bottom-right-radius: 0;
        border-top-right-radius: 0;
        .form-control {
          float: left;
          height: 34px;
          padding: 6px 12px;
          color: #555;
          background-color: #fff;
          background-image: none;
          border: 1px solid $border-color;
        }
        .input-group-btn {
          position: relative;
          white-space: nowrap;
          width: 1%;
          vertical-align: middle;
          display: table-cell;
        }
        .btn {
          position: relative;
          color: #333;
          background-color: #fff;
          display: inline-block;
          height: 34px;
          margin-bottom: 0;
          font-weight: normal;
          text-align: center;
          vertical-align: middle;
          cursor: pointer;
          background-image: none;
          border: 1px solid $border-color;
          white-space: nowrap;
          padding: 6px 12px;
          line-height: 1.428571429;
          border-radius: 0;
        }
      }
      span.algolia-autocomplete {
        display: inherit !important;
      }
    }
  }
}

$expandable-padding: 5px;
$expandable-indent: 2 * $expandable-padding;
#expandable-nav {
  padding-top: $expandable-padding;
  padding-left: 0;
  list-style: none;
  ul {
    padding-left: $expandable-indent;
    list-style: none;
  }
  .collapseomatic {
    padding-top: $expandable-padding;
  }
  .collapseomatic_content, .collapseomatic_excerpt {
    padding-left: $expandable-indent;
  }
}
