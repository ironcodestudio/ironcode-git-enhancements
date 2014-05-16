Ironcode Git Enhancements
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
* Git shortcut names

Installation
------------
* Copy `/ironcode-git-enhancements` directory to home directory (or clone this repo in your home directory)
* From the command line enter `echo 'source  ~/ironcode-git-enhancements/bash_profile-mods.bash' >> ~/.bash_profile`

Installation Notes
------------------
* Installation adds `source  ~/ironcode-git-enhancements/bash_profile-mods.bash` to your .bash_profile
* The scripts will be loaded in all future terminal sessions.
If you want to apply them in your current terminal session can apply them now with
the following from the command line `source ~/ironcode-git-enhancements/bash_profile-mods.bash`

Uninstall
---------
Edit your .bash_profile file in your home directory and remove the line
`source  ~/ironcode-git-enhancements/bash_profile-mods.bash`

Git Shortcuts
-------------
```
alias gs='git status'
alias ga='git add'
alias gb='git branch -a -v' # shows both local and remote branches AND verbose
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias go='git checkout'
alias gl='git log --pretty=oneline'
```

Reference for Other Git Commands
--------------------------------
### Set an upstream remote
`git remote add upstream https://github.com/ironcodestudio/ironcode-git-enhancements.git`

### Fetch and merge upstream changes
`git fetch upstream`
`git merge upstream/master`

### Push Local Branch to Remote
`git push origin example-branch-name`

### Add Submodule
`git submodule add https://github.com/salcode/example.git`

### Update Submodules on a Cloned Project
`git submodule update --init --recursive`


Included Components
-------------------
* bash/zsh completion support for core Git by Shawn O. Pearce <spearce@spearce.org>
* bash/zsh git prompt support Shawn O. Pearce <spearce@spearce.org>

Changelog
------------
* 20140404 - move to ironcode-git-enhancements, updated paths and documentation
* 20140404 - added `gl` comand line shortcut for `git log --pretty=oneline`
* 20140402 - updated incorrect comments and clarified installation  
* 20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
