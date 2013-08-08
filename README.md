# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.
The Boxen rubygem and the Boxen puppet modules are only a framework for getting
things done.
This repository template is just a basic example of _how_ to do things with them.

## Getting Started

To give you a brief overview, we're going to:

* Install dependencies (basically Xcode)
* Bootstrap a boxen for your self/team/org/company
* Then convert your local copy of that boxen to the post-bootstrapped version

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.

### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.

### Installing

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/schwomp/boxen.git /opt/boxen/repo
cd /opt/boxen/repo
script/boxen
```

Keep in mind this requires you to encrypt your hard drive by default.
If you do not want to do encrypt your hard drive, you can use the `--no-fde`.

```
script/boxen --no-fde
```

## What You Get

My boxen project provides the following by default:

* Homebrew
* Git
* Hub
* dnsmasq w/ .dev resolver for localhost
* rbenv
* Full Disk Encryption requirement
* Node.js
* Ruby 
* ack
* Findutils
* GNU tar

## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.

[Boxen config](config/boxen.rb).

## Halp!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.
