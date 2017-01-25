---
title: Meta -- Docs Ubuntu Getting Started
layout: 16.2
---

## Choose Ubuntu Version
* [Ubuntu 16.x](#ubuntu-16.x)
* [Ubuntu 14.x](#ubuntu-14.x)

## Ubuntu 16.x

### Install Required Unix Tools

The default Linux environment on Windows doesn't have very much installed on it, so we need to install a few packages:

<pre><code class="command-line language-bash">sudo apt-get update
sudo apt-get install make gcc git zlib1g-dev</code></pre>

### Install Ruby

 <pre class="command-line language-bash"><code>sudo apt-get install ruby ruby-dev</code></pre>

### Install the "Bundler" Gem

<pre><code class="command-line language-bash">sudo gem install bundler</code></pre>

### Setup Your Github Account

If you don't already have a GitHub account, [go get one (you probably should have one, anyway)](http://github.com//):

> <http://github.com/>

If you aren't already a collaborator on the avi-docs github repository, send an email to the docs admin (&lt;{{ site.meta.admin_name }}&gt; {{ site.meta.admin_email }}) with your GitHub username and request to be added as a collaborator.

### Create an SSH Key and Upload it to GitHub

You'll need an SSH key registered with GitHub to use it properly. GitHub has detailed instructions here:

> <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>

### Clone the Avi-Docs Repository

<pre><code class="command-line language-bash">cd ~
git clone {{ site.meta.repo_url }}</code></pre>

### Prepare the Repository

The first time you use the local repository, you need to install some Ruby stuff:

<pre><code class="command-line language-bash">cd avi-docs/src/site
bundle install --path vendor/bundle</code></pre>

This may take a little while. Maybe a good time to get coffee. But, you only have to do this once.

### Run the Local Web Server

The docs system (Jekyll) includes a web server that runs locally on your machine at port 4000, watches changes you make to the files in the documentation, and re-renders the documention as needed.

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

### View Your Local Docs Site

Point your web browser at the local web server:

> <http://localhost:4000/>

Congratulations, you're all set up.

### Next Steps

<a href="/docs/16.2.2./meta/article-crud-basics/">Create or update an article &rsaquo;</a>

## Ubuntu 14.x

### Install Required Unix Tools

The default Linux environment on Windows doesn't have very much installed on it, so we need to install a few packages:

<pre><code class="command-line language-bash">sudo apt-get update
sudo apt-get install make gcc git zlib1g-dev</code></pre>

### Install Ruby

The default Ruby is too old, so we'll install a packaged version from BrightBox.

<pre><code class="command-line language-bash">sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.3 ruby2.3-dev ruby-switch
</code></pre>

### Install the "Bundler" Gem

<pre><code class="command-line language-bash">sudo gem install bundler</code></pre>

### Setup Your Github Account

If you don't already have a GitHub account, [go get one (you probably should have one, anyway)](http://github.com//):

> <http://github.com/>

If you aren't already a collaborator on the avi-docs github repository, send an email to the docs admin (&lt;{{ site.meta.admin_name }}&gt; {{ site.meta.admin_email }}) with your GitHub username and request to be added as a collaborator.

### Create an SSH Key and Upload it to GitHub

You'll need an SSH key registered with GitHub to use it properly. GitHub has detailed instructions here:

> <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>

### Clone the Avi-Docs Repository

<pre><code class="command-line language-bash">cd ~
git clone {{ site.meta.repo_url }}</code></pre>

### Prepare the Repository

The first time you use the local repository, you need to install some Ruby stuff:

<pre><code class="command-line language-bash">cd avi-docs/src/site
bundle install --path vendor/bundle</code></pre>

This may take a little while. Maybe a good time to get coffee. But, you only have to do this once.

### Run the Local Web Server

The docs system (Jekyll) includes a web server that runs locally on your machine at port 4000, watches changes you make to the files in the documentation, and re-renders the documention as needed.

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

### View Your Local Docs Site

Point your web browser at the local web server:

> <http://localhost:4000/>

Congratulations, you're all set up.

### Next Steps

<a href="/docs/16.2.2./meta/article-crud-basics/">Create or update an article &rsaquo;</a>