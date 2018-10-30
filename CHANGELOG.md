# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Add alias 'agd' for git add
- Add alias 'apgd' for git add -p
- Add alias 'gdsno' for git diff --staged --name-only
- Add alias 'git please' for git push --force-with-lease
- Add global .gitignore (core.excludesfile) to project

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
