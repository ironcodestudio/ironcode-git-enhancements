IRONCODE_GIT_SCRIPTS_PATH=~/ironcode-git-enhancements/scripts

# add this directory to your path
# assumes location and directory name
export PATH=$IRONCODE_GIT_SCRIPTS_PATH:$PATH

###
# ENABLE git tab completion
###

if [ -f $IRONCODE_GIT_SCRIPTS_PATH/git-completion.bash ]; then
	. $IRONCODE_GIT_SCRIPTS_PATH/git-completion.bash
fi

###
# ENABLE git status in prompt
###

# if the git-prompt.sh script exists,
if [ -f $IRONCODE_GIT_SCRIPTS_PATH/git-prompt.sh ]; then

	# load prompt script
	. $IRONCODE_GIT_SCRIPTS_PATH/git-prompt.sh

	# Add an * to the branch name if the branch
	# is dirty (i.e. there are changes since last commit)
	GIT_PS1_SHOWDIRTYSTATE=true

	# update prompt to include git status __git_ps1
	export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[0;31m\]$(__git_ps1)\[\033[00m\]\$ '

fi
###
# Helper functions for git completion of aliases
# http://git.661346.n2.nabble.com/Bash-tab-completion-for-git-fetch-alias-is-broken-on-Git-1-7-7-1-td6980366.html#message6988430
###
__define_git_completion () {
	eval "
		_git_$2_shortcut () {
			COMP_LINE=\"git $2\${COMP_LINE#$1}\"
			let COMP_POINT+=$((4+${#2}-${#1}))
			COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
			let COMP_CWORD+=1

			local cur words cword prev
			_get_comp_words_by_ref -n =: cur words cword prev
			_git_$2
		}
	"
}

__git_shortcut () {
	type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
	alias $1="git $2 $3"
	complete -o default -o nospace -F _git_$2_shortcut $1
}

###
# git aliases
###
__git_shortcut  gs    status

__git_shortcut  gsi   status "--ignored"

__git_shortcut  ga    add

__git_shortcut  gb    branch

__git_shortcut  gbv   branch "-a -v"

__git_shortcut  gc    commit

__git_shortcut  gca   commit --amend

__git_shortcut  gd    diff

__git_shortcut  gds   diff --staged

__git_shortcut  gdno  diff --name-only

__git_shortcut  go    checkout

__git_shortcut  gl    log "--color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# gpr 96, will fetch PR 96 create branch pull-request-96
gpr () {
	git fetch origin pull/$1/head:pull-request-$1;
	git checkout pull-request-$1;
}
