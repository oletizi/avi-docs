---
title: Meta -- Docs Getting Started on MacOS
layout: default
---

## Install Homebrew

Homebrew is a package manager for MacOS. It's awesome.

Go to [the Homebrew website and follow the one-line instructions:](http://brew.sh/)

> <http://brew.sh>

## Check Ruby Version

Check your version of ruby to make sure it's up-to-date:

<pre class="command-line language-bash" data-output="2"><code>ruby -v
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin15]</code></pre>

If the ruby version is less than 2.0, use Homebrew to update ruby:

<pre class="command-line language-bash"><code>brew install ruby</code></pre>

## Install the Bundler Gem

Bundler is a dependency manager for ruby. Install it thusly:

<pre class="command-line language-bash" data-output="2"><code>sudo gem install bundler</code></pre>

## Setup Your Github Account

If you don't already have a GitHub account, [go get one (you probably should have one, anyway)](http://github.com//):

> <http://github.com/>

If you aren't already a collaborator on the avi-docs github repository, send me and email (orion AT avinetworks.com) with your GitHub username and I'll add you as a collaborator.

## Create an SSH Key and Upload it to GitHub

You'll need an SSH key registered with GitHub to use it properly. GitHub has detailed instructions here:

> <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>

## Clone the Avi-Docs Repository

<pre><code class="command-line language-bash">cd ~
git clone {{ site.meta.repo_url }}</code></pre>

## Prepare the Repository

The first time you use the local repository, you need to install some Ruby stuff:

<pre><code class="command-line language-bash">cd avi-docs/src/site
bundle install --path vendor/bundle</code></pre>

## Run the Local Web Server

The docs system <a href="https://jekyllrb.com" target="_blank">Jekyll</a> includes a web server that runs locally on your machine at port 4000, watches changes you make to the files in the documentation, and re-renders the documention as needed.

Start the web server:

<pre class="command-line language-bash" data-output="3-100"><code>cd ~/avi-docs
./bin/serve.sh
Executing "bundle exec jekyll serve --host=0.0.0.0 --incremental " from /Users/orion/work/workspace/avi-docs/src/site
Configuration file: /Volumes/Extra/work/workspace/avi-docs/src/site/_config.yml
            Source: /Volumes/Extra/work/workspace/avi-docs/src/site
       Destination: /Volumes/Extra/work/workspace/avi-docs/src/site/_site
 Incremental build: enabled
      Generating... 
                    done in 3.161 seconds.
        ** ERROR: directory is already being watched! **

        Directory: /Volumes/Extra/work/workspace/avi-docs/src/site/docs/latest

        is already being watched through: /Volumes/Extra/work/workspace/avi-docs/src/site/docs/16.2.2

        MORE INFO: https://github.com/guard/listen/wiki/Duplicate-directory-errors
 Auto-regeneration: enabled for '/Volumes/Extra/work/workspace/avi-docs/src/site'
Configuration file: /Volumes/Extra/work/workspace/avi-docs/src/site/_config.yml
    Server address: http://0.0.0.0:4000/
  Server running... press ctrl-c to stop.</code></pre>

## View Your Local Docs Site

Point your web browser at the local web server:

> <http://localhost:4000/>

Congratulations, you're all set up.

## Next Steps

[Create or update an article &rsaquo;](/docs/16.2.2/meta/article-crud-basics/)