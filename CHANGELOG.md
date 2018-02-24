# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
