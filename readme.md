# Avi Markdown-Based Documentation

This is a port of the Avi knowledge base using a Markdown-based system to write and publish documentation for Avi Networks.

It uses ruby and Jekyll to render Markdown to html at build time:

    https://jekyllrb.com/

Jekyll ships with a continuous rendering server suitable for local development. It watches the directory that contains the markdown source files and renders the target html files on demand. It also provides a built-in http server that makes it trivial to view edits locally virtually in real time.

[TOC levels=4]: # "## Contents"
## Contents
- [Get Started](#get-started)
    - [Basic Steps](#basic-steps)
    - [Prepare Toolkit for Mac OS](#prepare-toolkit-for-mac-os)
    - [Prepare Toolkit for Ubuntu Desktop](#prepare-toolkit-for-ubuntu-desktop)
        - [Special Instructions for Ubuntu 14.x](#special-instructions-for-ubuntu-14x)
    - [Prepare Toolkit for Windows](#prepare-toolkit-for-windows)
    - [Post Toolkit Installation](#post-toolkit-installation)
- [Adding New Files](#adding-new-files)
    - [Configuring the Header](#configuring-the-header)
- [Committing Changes](#committing-changes)
- [Content Creation and Publishing Lifecycle](#content-creation-and-publishing-lifecycle)
- [Editor Options](#editor-options)
- [How it Works](#how-it-works)
    - [Source and Target Files](#source-and-target-files)
    - [Templates](#templates)
    - [Includes](#includes)
    - [Data](#data)

## Get Started

### Basic Steps

* Add your public ssh key to your github account:

      [GitHub Instructions](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

* Clone this repository:

    `git clone git@github.com:oletizi/avi-docs.git`

* Run the renderer/server:

    `cd avi-docs; ./bin/serve.sh`

* Open the following URL in your browser:

    http://localhost:4000/docs/

* Make edits to files here:

    *&lt;path/to/avi-docs&gt;*`/src/site/docs/`

* The rendered html files live here:

    *&lt;path/to/avi-docs&gt;*`/src/site/_site/docs`

### Prepare Toolkit for Mac OS

* Clone this repository:

    `git clone git@github.com:oletizi/avi-docs.git`

* If ruby isn't already installed, install ruby:

    https://www.ruby-lang.org/en/documentation/installation/#homebrew

* Install the "Bundler" gem:

    sudo gem install bundler

* Run `bundle install` from the `src/site` directory in the project directory:

    cd avi-docs/src/site
    bundle install

  I you have trouble installing the jekyll gem, see this troubleshooting advice:

    http://stackoverflow.com/questions/31972968/cant-install-gems-on-os-x-el-capitan

* If git is not already installed, install git. There are a few ways to do that. Pick your favorite from these options:

    https://www.atlassian.com/git/tutorials/install-git/

### Prepare Toolkit for Ubuntu Desktop

* Install git:

    sudo apt-get install git
  
* Clone this repository:

    `git clone git@github.com:oletizi/avi-docs.git`
    
* Install ruby (plus the ruby development package):

    sudo apt-get install ruby ruby-dev

* Install zlib:

    sudo apt-get install zlib1g-dev

* Install the "Bundler" gem:

    sudo gem install bundler
    
* Run `bundle install` from the `src/site` directory in the project directory:

    cd avi-docs/src/site
    bundle install
    

    
#### Special Instructions for Ubuntu 14.x

Ranga reported the following steps were necessary to get ruby, gem, and jekyll installed:

    sudo apt-get install ruby2.0
    sudo apt-get install ruby2.0-dev
    sudo rm /usr/bin/ruby
    sudo rm /usr/bin/gem
    sudo ln -s /usr/bin/ruby2.0 /usr/bin/ruby
    sudo ln -s /usr/bin/gem2.0 /usr/bin/gem
    sudo gem install jekyll

### Prepare Toolkit for Windows

Ugh. Seriously? Ideally, you'd be using a real development platform. But, if you really need it, I'll figure it out. Most of it is probably pretty straightforward except the stuff that uses a CLI. Windows CLI interaction is always a giant pain, although it can usually be done with Cygwin.

If you need to try this on Windows, the first thing you should do is install Cygwin. Then, let's talk.

### Post Toolkit Installation

* Add your public ssh key to your github account:

    https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

* Clone this repository (see above)
* Run the renderer/server (see above)
* Open the local site in your browser (see above)
* Try some edits. The renderer will display rendering time when it is finished)
* Reload the relevant page in your browser

## Adding New Files

Adding new files is pretty straightforward. Create the file where you want it to live in the document tree and add the `.md` file extension. It will automatically be picked up by the renderer.

### Configuring the Header

There is a little bit of magic you'll have to add to the top of the markdown file.

For example, look at the file `src/site/docs/16.1/cli-guide/index.md`. At the top of the file is a header delimited by three dashes and a newline before and after the header. You *must* hadd that header. At the minimum, the header must contain values for 'layout' and 'title'.

The value for 'layout' will determine which template the renderer will use.
 
The value for 'title' will determine the title header in the HTML target and the top-level H1 tag.

There may be other header options in the future, but these are the only ones we're using right now.

## Committing Changes

Any changes that you make must be committed and pushed via git in order to show up on the live site.

There are plenty of tutorials out there on how to use git, so I won't write a primer here. Suffice it to say that there are both CLI and GUI options for using git.

You can commit anything you want locally, but in order to push your changes to the public GitHub repo, you'll need to be added as a collaborator to the repo. But, during this testing process, you don't really need to push anything to the repo.

If and when we move to this infrastructure, we'll likely use the Avi GitHub account and everyone who needs to will have commit access.

## Content Creation and Publishing Lifecycle

At the moment, there is no functioning publishing scheme, but here's basically how it will work:

* A particular branch (probably `master`) will be designated as the "publishing" branch. Anything checked into that branch will be rendered and published automatically to the live site.
* Work on content for a new version of the software should be done in a dedicated branch for that version. When that version is released, the corresponding documentation branch will be merged into the publishing branch and pushed live.
* Small edits may be made directly in the publishing branch
* Larger-scale edits&mdash;especially those that span multiple files and days of work&mdash;should probably be done in a dedicated branch and merged into the publishing branch when it is tested and approved.

## Editor Options

There are tons of good editors out there to choose from. I personally use one of the JetBrains IDEs:

> https://www.jetbrains.com/

There's a markdown plugin called [Markdown Navigator](https://plugins.jetbrains.com/plugin/7896?pr=idea) that works for any of them (I'm using phpStorm at the moment, but I also use IntelliJ IDEA and WebStorm). All of the JetBrains IDEs also contain git plugins to make using git a snap.

The paid version of the JetBrains Markdown Navigator plugin has a nifty side-by-side view that lets you edit in one pane and view the rendered output in a pane next to it which makes it handy to get a sense for how your markup will be rendered.  

I've also looked at these other text editors and they are all serviceable:

* [TextMate](https://macromates.com/)&mdash;*Not sure about its markdown or git support, but considering how popular it is, I'd be surprised if it wasn't available.*
* [Atom](https://atom.io/)&mdash;*Also has a good markdown plugin. Appears to have git support.*
* [Sublime Text](https://www.sublimetext.com/)&mdash;*Same caveats apply as for TextMate*

**Important:** *Don't* try to use a visual (WYSIWYG) editor like Word to edit this stuff. It won't work and you'll be very disappointed. Markdown is source code, not text.

## How it Works

Ultimately, what gets served as the documentation is static HTML. This HTML is generated (similar to a compile process) by a template-based markdown renderer.

The source files are written in markdown with a bit of header information to describe stuff like which template to use to render the HTML.

### Source and Target Files

The source markdown lives in 
    
    src/site/... 
    
The rendered (target) content gets written to 

    src/site/_site/...
    
### Templates

The template files (also called "Layouts") live in

    src/site/_layouts
    
### Includes

Templates may include common files. Includes live in

    src/site/_includes
    
### Data

There are some json files that describe the hierarchical outline of each section. This will likely get replaces by a version of the "left-nav" in the current KB site.

Those json files live here:

    src/site/_data
    
Don't worry too much about this data stuff. It probably won't be the same when this is all over with.
