Ironcode Git Enhancements
=========================
https://github.com/ironcodestudio/ironcode-git-enhancements

License
-------
GNU General Public License, version 2.0

Requirements
------------
* Command line git installed
* Bash terminal environment
* Optional: [Exuberant Ctags](http://ctags.sourceforge.net/)* for ctag generation

Features
--------
* Git tab completion
* Git status in command prompt
* Git shortcut names
* Git project template
* Prepopulate Git hooks for [Exuberant Ctags](http://ctags.sourceforge.net/)

Installation
------------
* Clone this repo to your home directory `git clone https://github.com/ironcodestudio/ironcode-git-enhancements ~/ironcode-git-enhancements`
* From the command line enter `echo 'source  ~/ironcode-git-enhancements/bash_profile-mods.bash' >> ~/.bash_profile;git config --global init.templatedir '~/ironcode-git-enhancements/git_template'`

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
* bash/zsh git prompt support by Shawn O. Pearce <spearce@spearce.org>
* Effortless Ctags git hooks by Tim Pope

Git project template
--------------------
The sub-directory `git_template` acts as a template when creating or cloning a repo.

Exuberant Ctags*
--------------------------------------------------------------
This is an optional feature for advanced users who want to use
[Exuberant Ctags](http://ctags.sourceforge.net/).  If your editor/IDE uses ctags for
integration across files in a project, this will regenerate ctags after commits, merges, and checkouts.
Users who are not interested in these features can ignore this section.
The scripting in these hooks fails silently if
Exuberant Ctags is not installed.
This is based on Tim Pope's work [Effortless Ctags with Git](http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html)

Installation Notes
------------------
* Installation adds `source  ~/ironcode-git-enhancements/bash_profile-mods.bash` to your .bash_profile
* The scripts will be loaded in all future terminal sessions.
If you want to apply them in your current terminal session can apply them now with
the following from the command line `source ~/ironcode-git-enhancements/bash_profile-mods.bash`
* Installation modifies your `~/.gitconfig` to use the included template directory  
when initializing or cloniong a repository

Uninstall
---------
* Edit `~/.bash_profile` in your home directory and remove the line  
`source  ~/ironcode-git-enhancements/bash_profile-mods.bash`
* Edit `~/gitconfig` in your home directory and remove the line  
`templatedir = ~/ironcode-git-enhancements/git_template`
* At this point, the modifications are uninstalled and optionally  
you can delete the directory and contents `~/ironcode-git-enhancements`

Changelog
------------
* 20140516 - add `git_template` directory and hooks for Effortless Ctags
* 20140404 - move to ironcode-git-enhancements, updated paths and documentation
* 20140404 - added `gl` comand line shortcut for `git log --pretty=oneline`
* 20140402 - updated incorrect comments and clarified installation  
* 20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
