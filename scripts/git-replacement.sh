#!/bin/bash -i

RED='\033[0;31m'
NC='\033[0m'    # No Color

function is_push_force {
	# $1 command (e.g. push, commit, etc.)
	# $@ all args (e.g. "push --force", "stats .gitignore", "reset --hard HEAD~3")

	# Regex to find instances of "--force" but not "--force-with-lease"
	my_regex='[[:space:]]--force($|[[:space:]])';

	# The command is "push" and "--force" is being used.
	if [[ $1 = "push" && $@ =~ $my_regex ]]; then
		return 0; # True
	fi;
	return 1; # False
}

if is_push_force $@; then
	printf "Using \"push --force\" is a ${RED}bad${NC} idea\n";
	printf "Instead, use \"push --force-with-lease\"\n";
	printf "See https://salcode.com/never-git-push-force for more information\n";
	exit;
fi;

# Replay the same command ignoring any aliases.
\git $@;
