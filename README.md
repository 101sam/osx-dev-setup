![LimitlessV logo](http://www.limitlessv.com/wp-content/uploads/2015/06/logo-alt-300x200.png)

# Scripts to use for setup development environment on Mac OS X

The challenges when you setup your workstation to development mode is time-consuming. I used this repository to setup my development machine.

```
Warning!
Some of the steps require manual changes read the instructions.
```

>This setup targets the following area:


>* Python 2.7 & 3.6 with Virtual Environments.
>* Machine learning & Deep learning using Python 2.7 & 3.6.
>* Packages to solved trading strategies & finance challenges.
>* Packages for face recognition.
>* Databases and Datasets.
>
>

### Geting started:

# Section 1: Installation
### Single Setup Script

#### Running with Git

##### Clone the Repo

	$ cd ~; mkdir projects; cd projects
	$ git clone https://github.com/limitlessv/osx-dev-setup.git;cd projects; ./start all

##### Run the ./start Script with Command Line Arguments

     usage: ./start [option]

    +---------------------------------------------------------------------+
    | To install ALL packages run:                                        |
    |      ./start all                                                    |
    +---------------------------------------------------------------------+
    | To install the following packages [bootstrap,                       |
    |                                    prepareOS,                       |
    |                                    brew,                            |
    |                                    brewCTF,                         |
    |                                    osx                              |
    |                                    anaconda]                        | 
    |                                    run:                             |
    |     ./start python                                                  |
    |                                                                     |
    | (*) Personal prefered installation, in case no need to              |
    |    install local databases.                                         |
    +---------------------------------------------------------------------+
    | To install selected packagess run:                                  |
    |     ./start bootstrap prepareOS brew osx                            |
    +---------------------------------------------------------------------+
    | or:                                                                 |
    |     ./start bootstrap prepareOS brew brewCTF osx                    |
    +---------------------------------------------------------------------+
    | or:                                                                 |
    |     ./start bootstrap prepareOS brew brewCTF osx anaconda           |
    +---------------------------------------------------------------------+
    | or:                                                                 |
    |     ./start bootstrap prepareOS brew brewCTF osx pydata             |
    +---------------------------------------------------------------------+
    | or:                                                                 |
    |    ./start bootstrap prepareOS brew brewCTF osx anaconda datastores |
    +---------------------------------------------------------------------+
    | or:                                                                 |
    |    ./start bootstrap prepareOS brew brewCTF osx pydata datastores   |
    +---------------------------------------------------------------------+


**Scripts tested on OS X 10.12 Sierra.**

* [Single Setup Script](#single-setup-script)
* [bootstrap/bootstrap.sh script](#bootstrapsh-script)
    * Syncs dev-setup to your local home directory `~`
* [osx/prepareOS.sh script](#osxprepsh-script)
    * Updates OS X and installs Xcode command line tools
* [homebrew/brew.sh script](#brewsh-script)
    * Installs common Homebrew formulae and apps
* [homebrew/brew-CTF.sh script](#brewsh-CTF-script)
    * Installs Capture the Flag (CTF) is a special kind of information security competitions.
* [osx/osx.sh script](#osxsh-script)
    * Sets up OS X defaults geared towards developers
* [python/pyAnaconda.sh script](#anaconda-script)
    * Sets up python using Anaconda distribution
    * Setup py36 virtual enviroment. 
    * Setup py27 virtual enviroment.
* [pydata.sh script](#pydatash-script)
    * Sets up python for data analysis
    * Setup py36 virtual enviroment. 
    * Setup py27 virtual enviroment.
* [datastores.sh script](#datastoressh-script)
    * Sets up common data stores


The [bootstrap.sh script](#bootstrapsh-script) contains Vim customizations.

###bootstrap.sh script

<p align="center">
  <img src="http://www.limitlessv.com/wp-content/uploads/2017/07/commands.png">
  <br/>
</p>

The `bootstrap/bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

Run the `bootstrap/bootstrap.sh` script:

    $ source bootstrap/bootstrap.sh


### prepareOS.sh script

<p align="center">
  <img src="http://www.limitlessv.com/wp-content/uploads/2017/07/xcode.jpg">
  <br/>
</p>

Run the `osx/prepareOS.sh ` script:

    $ source osx/osxprep.sh

`osxprep.sh` will first install all updates.  If a restart is required, simply run the script again.  Once all updates are installed, `osxprep.sh` will then [Install Xcode Command Line Tools](#install-xcode-command-line-tools).

If you want to go the manual route, you can also install all updates by running "App Store", selecting the "Updates" icon, then updating both the OS and installed apps.



### Tools, IDEs, and Other Software Installed at the ned of this process.
* git
* git-lfs
* git-flow
* git-extras
* github-desktop
* python
* wget, grep, openssh, screen, lynx, p7zip, ssh-copy-id, tree, bash-completion2, rsync
* dropbox
* firefox
* google-chrome
* Sublime 3
* vagrant
* vagrant-manager
* VMware Fusion (will require a key upon launch or use 30-day free trial)
* virtualbox
* webstorm
* intellij-idea / pycharm-ce
* atom
* iterm2
* alfred
* java
* xquartz
* vagrant
* macdown
* rstudio
* rstudio-server
* skype
* slack
* dropbox
* google-backup-and-sync (formaly named google-drive)
* evernote
* 1password
* gimp
* paintbrush
* vlc
* whatsapp
* google-hangouts
* docker, boot2docker
* gcc --without-multilib
* cmake
* imagemagick --with-webp



Read more on conda vs. pip vs. virtualenv:
* https://conda.io/docs/_downloads/conda-pip-virtualenv-translator.html


## Todo:
<ul class="contains-task-list">
<li class="task-list-item"><input class="task-list-item-checkbox" checked="" disabled="" type="checkbox"> Add homebrew setup</li>
<li class="task-list-item"><input class="task-list-item-checkbox" checked="" disabled="" type="checkbox"> Add setup for python development</li>
<li class="task-list-item"><input class="task-list-item-checkbox" checked="" disabled="" type="checkbox"> Add setup for python development using anaconda</li>
<li class="task-list-item"><input class="task-list-item-checkbox" checked="" disabled="" type="checkbox"> Fix setup for databases</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Add support for more development env:</li>
<ul class="contains-sub-task-list1">
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Add support for Java development</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Add support for PHP development</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Add support for Ruby development</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Add support for Java development</li>
</ul>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox">  Add support for cloud services:</li>
<ul class="contains-sub-task-list2">
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox">  Google</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox">  AWS</li>
</ul>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox">  Add better documents and instructions for:</li>
<ul class="contains-sub-task-list3">
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Python packages</li>
<ul class="contains-sub-sub-task-list4">
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Libraries</li>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> OpenCV & Face recognition.</li>
</ul>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> macOS</li>
<ul class="contains-sub-sub-task-list4">
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> Cheat Sheet - function and aliases</li>
</ul>
</ul>
<li class="task-list-item"><input class="task-list-item-checkbox" disabled="" type="checkbox"> TBD</li>
</ul>

## Insperation:


Heavily inspired by the works from:

* https://github.com/necolas/dotfiles
* https://github.com/donnemartin/dev-setup
* https://gist.github.com/cowboy/3118588

and many others projects such as:
* https://gist.github.com/t-io/8255711
* https://github.com/svett/mac-osx-dev-setup
* https://github.com/StriveForBest/osx-dev-environment-setup


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Release History
see the [CHANGES](CHANGES.md).



