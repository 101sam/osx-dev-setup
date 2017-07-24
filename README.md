# osX development setup
<p align="center">
<img src="http://www.limitlessv.com/wp-content/uploads/2015/06/logo-alt-300x200.png" />
</p>
## A automated setup scripts when you setup new computer.

### Geting started:


Run osX system updates:

    $ source prepareOS.sh

Run Configuration:

    $ source bootstrap/bootstrap.sh

Run Homebrew:

    $ source homebrew/brew.sh
    $ source homebrew/brew-CTF.sh

Run osx to configure your desktop for development:

    $ source osx/osx.sh

## Python:
There are many ways to seup python on the computer.
Our focus on 3 methods:

* Anaconda distribution - local instellations
* Anaconda distribution - 
* Setup Python without relying on anconda

A personal prefered method **Ananconda - local instellations**:

    $ source python/pyA.sh

Anaconda using brew will install:

    $anaconda installs files under "/usr/local"



## Insperation:


Heavily inspired by the works from:

* https://github.com/necolas/dotfiles
* https://github.com/donnemartin/dev-setup
