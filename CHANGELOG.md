# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Add alias `git current-branch` / `gcb` to return the current branch name
- Add tab completion for `gl`
- Add alias `git branch-delete-merged` / `gbdm` to delete local branches already merged into current branch

## [1.5.0] - 2018-10-30
### Added
- Add alias 'agd' for git add
- Add alias 'apgd' for git add -p
- Add alias 'gdsno' for git diff --staged --name-only
- Add alias 'git please' for git push --force-with-lease
- Add global .gitignore (core.excludesfile) to project

### Changed
- Move legacy CHANGELOG entries out of `README.md` and into `CHANGELOG.md`

## [1.4.1] - 2018-02-24
### Changed
- Correct version number in README.md

## [1.4.0] - 2018-02-24
### Added
- Add CHANGELOG.md file
- Add alias git drb to delete a remote branch

## [1.3.0] - 2018-01-15
### Added
- Add alias git delete-merged-on-origin
- Add alias git delete-remote-tracking-branch
- Add helper aliases
	- FeCurrentBranchName
	- FePreviousBranchName
	- FeTrackingRemoteByLocalBranchName
	- FeTrackingBranchNameByLocalBranchName

### Changed
- Remove erronous `--dry-run` parameter on git delete-merged-on-origin

## Pre 1.3.0 Changes
- 20180115 - Add `git delete-remote-tracking-branch <local branch>` to delete the remote tracking branch corresponding to the local branch (local branch defaults to current branch) ([#65](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/65))
- 20180115 - Add helper aliases to make more complex aliases easier to write: FeCurrentBranchName, FePreviousBranchName, FeTrackingRemoteByLocalBranchName, FeTrackingBranchNameByLocalBranchName ([#66](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/66))
- 20171124 - Remove --dry-run parameter that was accidentally included with git delete-merged-on-origin
- 20171124 - Add `git delete-merged-on-origin` to delete all branches on remote `origin` that have been merged into `origin/master` ([#62](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/62))
- 20171102 - Add `git track-origin-same-branch-name` to set the current branch to track `origin/<name-of-current-branch>`. This is useful when faced with the "no tracking information for the current branch" message ([#49](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/49))
- 20170929 - Add `git d-` and `gd-` to delete previous branch ([#56](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/56))
- 20170929 - Add git move to move the most recent commit(s) to another branch ([#52](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/52))
- 20170313 - Add git pf to push using `--force-with-lease` ([#10](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/10))
- 20170313 - Set git rebase to autosquash = true ([#40](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/40))
- 20170313 - Add `git cfixup` and `git csquash` shortcuts for `git commit --fixup` and `git commit --squash` respectively ([#41](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/41))
- 20170313 - Update documentation for `gl` and add documentation for `git lg` ([#42](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/42))
- 20161226 - Set git push default to `current` ([#36](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/36))
- 20161225 - Set git push to always push tags ([#24](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/24))
- 20161225 - Add --verbose to `gc` command ([#22](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/22))
- 20161225 - Add git branch-clean custom command ([#27](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/27))
- 20161225 - Add gitconfig to repo ([#30](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/30))
- 20161225 - Add install script ([#31](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/31))
- 20161225 - Modify command line prompt to use light instead of dark blue for f.lux readability ([#29](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/29))
- 20161005 - Modify `gpr` to checkout the Pull Request branch after it is pulled locally ([#26](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/26))
- 20161005 - add shortcut `gdno` for `git diff --name-only` ([#23](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/23))
- 20150320 - improve readability of output for `gl` alias ([#4](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/4))
- 20150320 - correct behavior of `gbv` (previously -v paramter was ignored) ([#5](https://github.com/ironcodestudio/ironcode-git-enhancements/issues/5))
- 20150320 - add new entries in "Reference for Other Git Commands":
_Undo Last Commit_, _Remove Untracked Files from Branch_, and _Reset master to origin/master_
- 20140808 - add alias `gsi`, add tab completion on aliases, remove `gbo`,
change `gb` to map to `git branch` with no parameters, add `gbv`, update
git-completion.bash to latest version
- 20140516 - add `git_template` directory and hooks for Effortless Ctags
- 20140404 - move to ironcode-git-enhancements, updated paths and documentation
- 20140404 - added `gl` comand line shortcut for `git log --pretty=oneline`
- 20140402 - updated incorrect comments and clarified installation
- 20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
