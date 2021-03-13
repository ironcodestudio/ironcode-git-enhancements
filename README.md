Ironcode Git Enhancements
=========================
https://github.com/ironcodestudio/ironcode-git-enhancements

Version
-------
2.1.0

License
-------
GNU General Public License, version 2.0

Requirements
------------
* Command line git installed
* Optional: [Exuberant Ctags](http://ctags.sourceforge.net/)* for ctag generation

Features
--------
* Git aliases
* Git project template
* Prepopulate Git hooks for [Exuberant Ctags](http://ctags.sourceforge.net/)
* Global .gitignore file / core.excludesfile (`global-gitignore`)

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

2. Add line to ~/.gitconfig to load our Git configuration

```
git config --global include.path '~/ironcode-git-enhancements/gitconfig'
```

Git Shortcuts
-------------
```
git lg     = Display pretty color one-line log with branches, commits, and tags.

git d-     = Delete Previous branch

git drb <branchname> = Delete branch from remote origin
	- branchname defaults to currently active local branch name

git pf     = Push --force-with-lease
git please = Push --force-with-lease

git branch-delete-merged = Delete local branches already
	merged into current branch

git branch-clean = Remove both:
	- any branches already merged into current branch
	- any branch with a remote that has been removed from origin

git current-branch = Get the name of the current branch.

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

# Check if a fast-forward merge is possible
# like a dry run for git merge --ff-only <branchName>
git can-ff-merge <branchName>

# Populate a new git commit message with the contents of .git/COMMIT_EDITMSG
# This is helpful when the git commit-msg hook fails.
git recover-rejected-commit
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
* Installation modifies your `~/.gitconfig` to use the included template directory
when initializing or cloning a repository

Uninstall
---------
* Edit `~/gitconfig` in your home directory and remove the line  
`templatedir = ~/ironcode-git-enhancements/git_template`
* At this point, the modifications are uninstalled and optionally
you can delete the directory and contents `~/ironcode-git-enhancements`
