# osX development setup
<p align="center">
<img src="http://www.limitlessv.com/wp-content/uploads/2015/06/logo-alt-300x200.png" />
</p>
## A automated setup scripts when you setup new computer.

### Geting started:

Clone the repository using git:
 
	$ cd ~; mkdir projects; cd projects
	$ git clone https://github.com/limitlessv/osx-dev-setup.git

### Step 1.0 - Run osX system updates:

    $ source prepareOS.sh

### Step 1.1 - Run Configuration:

    $ source bootstrap/bootstrap.sh

### Step 1.2 - Run Homebrew:

    $ source homebrew/brew.sh
    $ source homebrew/brew-CTF.sh

### Step 1.3 - Run osx to configure your desktop for development:

    $ source osx/osx.sh

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


## Python: - Warning still under works
There are many ways to seup python on the computer.
Our focus on 3 methods:

* Anaconda distribution - local instellations
* Anaconda distribution - 
* Setup Python without relying on anconda

A personal prefered method **Ananconda - local instellations**:

    $ source python/pyA.sh

Anaconda using brew will install:

    $ anaconda installs files under "/usr/local"

Read more on conda vs. pip vs. virtualenv:
* https://conda.io/docs/_downloads/conda-pip-virtualenv-translator.html



## Run ALL:
    $ cd ~; mkdir projects; cd projects; git clone https://github.com/limitlessv/osx-dev-setup.git
    $ cd ~/projects/osx-dev-setup/; source prepareOS.sh; source bootstrap/bootstrap.sh; source homebrew/brew.sh;  source homebrew/brew-CTF.sh; source osx/osx.sh; source python/pydata.sh; source databases/dbTools.sh;


## Insperation:


Heavily inspired by the works from:

* https://github.com/necolas/dotfiles
* https://github.com/donnemartin/dev-setup

and many others projects such as:
* https://gist.github.com/t-io/8255711
* https://github.com/svett/mac-osx-dev-setup
* https://github.com/StriveForBest/osx-dev-environment-setup