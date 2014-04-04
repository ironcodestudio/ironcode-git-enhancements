ironcode-git-enhancements
=========================

License
-------
GNU General Public License, version 2.0

Requirements
------------
* Command line git installed
* Bash terminal environment

Features
--------
* Git tab completion
* Git status in command prompt

Installation
------------
* Copy `/salcode-git-settings` directory to home directory (or clone this repo in your home directory)
* From the command line enter `echo 'source  ~/salcode-git-settings/bash_profile-mods.bash' >> ~/.bash_profile`
* These changes will be applied in all future terminal sessions.
If you want to apply them in your current terminal session can apply them now with
the following from the command line `source ~/salcode-git-settings/bash_profile-mods.bash`

Included Components
-------------------
* bash/zsh completion support for core Git by Shawn O. Pearce <spearce@spearce.org>
* bash/zsh git prompt support Shawn O. Pearce <spearce@spearce.org>

Changelog
------------
20140404 - added `gl` comand line shortcut for `git log --pretty=oneline`
20140402 - updated incorrect comments and clarified installation  
20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
