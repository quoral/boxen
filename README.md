# My Boxen

This is my boxen, it has many things. Many wierd things. And many ugly things.
If you value your mind as a coder, proceed lightly. If you are here for trying to find nice and proper ways of structuring your boxen: __Go somewhere else__
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

#### OS X 10.9 (Mavericks)

If you are using [`b26abd0` of boxen-web](https://github.com/boxen/boxen-web/commit/b26abd0d681129eba0b5f46ed43110d873d8fdc2)
or newer, it will be automatically installed as part of Boxen.
Otherwise, follow instructions below.

#### OS X < 10.9

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.

### Bootstrapping

Create a **new** git repository somewhere on the internet.
It can be private or public -- it really doesn't matter.
If you're making a repository on GitHub, you _may not_ want to fork this repo
to get started.
The reason for that is that you can't really make private forks of public
repositories easily.

Once you've done that, you can run the following to bootstrap
your boxen:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/kallekrantz/boxen.git /opt/boxen/repo
```

Now that your boxen is bootstrapped, you can run the following to
install the default configuration from this repo:

```
cd /opt/boxen/repo
./script/boxen
```

You can also skip the above steps and <a href="#customizing">customize your
boxen</a> before installing it.

Keep in mind this requires you to encrypt your hard drive by default.
If you do not want to do encrypt your hard drive, you can use the `--no-fde`.

```
./script/boxen --no-fde
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

## Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run.

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (ex. /path/to/your-boxen/Puppetfile):

    # Core modules for a basic development environment. You can replace
    # some/most of these if you want, but it's not recommended.

    github "repository", "2.0.2"
    github "dnsmasq",    "1.0.0"
    github "gcc",        "1.0.0"
    github "git",        "1.2.2"
    github "homebrew",   "1.1.2"
    github "hub",        "1.0.0"
    github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
    github "nginx",      "1.4.0"
    github "nodejs",     "2.2.0"
    github "ruby",       "4.1.0"
    github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
    github "sudo",       "1.0.0"

    # Optional/custom modules. There are tons available at
    # https://github.com/boxen.

    github "java",     "1.1.0"

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.1.0" from the github repository
"boxen/puppet-java".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.1.0"
    include java

### Node definitions

Puppet has the concept of a
['node'](http://docs.puppetlabs.com/references/glossary.html#agent),
which is essentially the machine on which Puppet is running. Puppet looks for
[node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions)
in the `manifests/site.pp` file in the Boxen repo. You'll see a default node
declaration that looks like the following:

``` puppet
node default {
  # core modules, needed for most things
  include dnsmasq

  # more...
}
```

### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default.
But just like any other source code, throwing all your work into one massive
file is going to be difficult to work with. Instead, we recommend you
use modules in the `Puppetfile` when you can and make new modules
in the `modules/` directory when you can't. Then add `include $modulename`
for each new module in `manifests/site.pp` to include them.
One pattern that's very common is to create a module for your organization
(e.g., `modules/github`) and put an environment class in that module
to include all of the modules your organization wants to install for
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
```

 If you'd like to read more about how Puppet works, we recommend
 checking out [the official documentation](http://docs.puppetlabs.com/)
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.

## Halp!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.
