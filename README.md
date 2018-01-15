Ironcode Git Enhancements
=========================
https://github.com/ironcodestudio/ironcode-git-enhancements

Version
-------
1.2.1

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

Lazy Installation
-----------------

From the command line run

```
bash <(curl "https://raw.githubusercontent.com/ironcodestudio/ironcode-git-enhancements/develop/install-ironcode-git-enhancements.sh")
```

Detailed Installation
---------------------

1. Clone this repo to your home directory

```
git clone https://github.com/ironcodestudio/ironcode-git-enhancements ~/ironcode-git-enhancements
```

2. Add line to ~/.bash_profile to load our Git modifications

```
printf 'source  ~/ironcode-git-enhancements/bash_profile-mods.bash' >> ~/.bash_profile;
```

3. Add line to ~/.gitconfig to load our Git template

```
git config --global init.templatedir '~/ironcode-git-enhancements/git_template'
```

Git Shortcuts
-------------
```
alias gs   = 'git status'
alias gsi  = 'git status --ignored'
alias ga   = 'git add'
alias gb   = 'git branch'
alias gbv  = 'git branch -a -v' # shows both local and remote branches AND verbose
alias gc   = 'git commit --verbose'
alias gd   = 'git diff'
alias gds  = 'git diff --staged'
alias gdno = 'git diff --name-only'
alias go   = 'git checkout'
alias gl   = 'git lg' # Mapped to custom alias
alias gd-  = 'git d-' # Mapped to custom alias

git lg     = Display pretty color one-line log with branches, commits, and tags.

git d-     = Delete Previous branch

git pf     = Push --force-with-lease

git branch-clean = Remove both:
	- any branches already merged into current branch
	- any branch with a remote that has been removed from origin

git move <branchname> [<number of commits>]
	= Move the most recent commit(s) to the branch "branchname"
		- if "branchname" does not exist create it
		- "number of commits" we are moving is optional and defaults to 1

git cfixup <commit> = commit --fixup <commit>

git csquash <commit> = commit --squash <commit>


git track-origin-same-branch-name = !git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`
	- sets current branch tracking to origin/<name-of-current-branch>

git delete-merged-on-origin = !git branch --all --merged remotes/origin/master | grep --invert-match master | grep --invert-match HEAD | grep "remotes/origin/" | cut -d "/" -f 3- | xargs -n 1 git push --delete origin
	- delete all branches on remote "origin" that have been merged into "origin/master"

git delete-remote-tracking-branch <local branch> = !git push $trackingRemote --delete $trackingBranch;
	- delete the remote tracking branch that corresponds to the given local branch
	- <local branch> defaults to the current branch

# gpr 96, will fetch PR 96 create branch pull-request-96
gpr () { git fetch origin pull/$1/head:pull-request-$1; }
```

Reference for Other Git Commands
--------------------------------
### Set an upstream remote
`git remote add upstream https://github.com/ironcodestudio/ironcode-git-enhancements.git`

### Fetch and merge upstream changes
```
git fetch upstream
git merge upstream/master
```

### Push Local Branch to Remote
`git push origin example-branch-name`

### Add Submodule
`git submodule add https://github.com/salcode/example.git`

### Update Submodules on a Cloned Project
`git submodule update --init --recursive`

### Undo Last Commit
`git reset HEAD~1`  
More details at http://salferrarello.com/undo-git-commit/

### Remove Untracked Files from Branch
`git clean -f`  
use `git clean --dry-run -f` to preview  
More details in this [Stack Overflow Answer](http://stackoverflow.com/questions/61212/remove-local-untracked-files-from-my-current-git-branch#answer-64966)

### Reset master to origin/master
`git reset --hard origin/master`  
__Warning__ This is a destructive change, you will lose any local changes on this branch.

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
the following from the command line  
`source ~/ironcode-git-enhancements/bash_profile-mods.bash`
* Installation modifies your `~/.gitconfig` to use the included template directory
when initializing or cloning a repository

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
* 20180115 - Add `git delete-remote-tracking-branch <local branch>` to delete the remote tracking branch corresponding to the local branch (local branch defaults to current branch) ([#65](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/65))
* 20180115 - Add helper aliases to make more complex aliases easier to write: FeCurrentBranchName, FePreviousBranchName, FeTrackingRemoteByLocalBranchName, FeTrackingBranchNameByLocalBranchName ([#66](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/66))
* 20171124 - Remove --dry-run parameter that was accidentally included with git delete-merged-on-origin
* 20171124 - Add `git delete-merged-on-origin` to delete all branches on remote `origin` that have been merged into `origin/master` ([#62](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/62))
* 20171102 - Add `git track-origin-same-branch-name` to set the current branch to track `origin/<name-of-current-branch>`. This is useful when faced with the "no tracking information for the current branch" message ([#49](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/49))
* 20170929 - Add `git d-` and `gd-` to delete previous branch ([#56](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/56))
* 20170929 - Add git move to move the most recent commit(s) to another branch ([#52](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/52))
* 20170313 - Add git pf to push using `--force-with-lease` ([#10](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/10))
* 20170313 - Set git rebase to autosquash = true ([#40](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/40))
* 20170313 - Add `git cfixup` and `git csquash` shortcuts for `git commit --fixup` and `git commit --squash` respectively ([#41](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/41))
* 20170313 - Update documentation for `gl` and add documentation for `git lg` ([#42](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/42))
* 20161226 - Set git push default to `current` ([#36](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/36))
* 20161225 - Set git push to always push tags ([#24](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/24))
* 20161225 - Add --verbose to `gc` command ([#22](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/22))
* 20161225 - Add git branch-clean custom command ([#27](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/27))
* 20161225 - Add gitconfig to repo ([#30](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/30))
* 20161225 - Add install script ([#31](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/31))
* 20161225 - Modify command line prompt to use light instead of dark blue for f.lux readability ([#29](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/29))
* 20161005 - Modify `gpr` to checkout the Pull Request branch after it is pulled locally ([#26](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/26))
* 20161005 - add shortcut `gdno` for `git diff --name-only` ([#23](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/23))
* 20150320 - improve readability of output for `gl` alias ([#4](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/4))
* 20150320 - correct behavior of `gbv` (previously -v paramter was ignored) ([#5](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/5))
* 20150320 - add new entries in "Reference for Other Git Commands":
_Undo Last Commit_, _Remove Untracked Files from Branch_, and _Reset master to origin/master_
* 20140808 - add alias `gsi`, add tab completion on aliases, remove `gbo`,
change `gb` to map to `git branch` with no parameters, add `gbv`, update
git-completion.bash to latest version
* 20140516 - add `git_template` directory and hooks for Effortless Ctags
* 20140404 - move to ironcode-git-enhancements, updated paths and documentation
* 20140404 - added `gl` comand line shortcut for `git log --pretty=oneline`
* 20140402 - updated incorrect comments and clarified installation
* 20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
