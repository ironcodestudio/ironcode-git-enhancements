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

## Add tab completion for git move <branch>.
function _git_move() {
  _git_branch
}

###
# git aliases
###
__git_shortcut  gs    status "--short"

__git_shortcut  gsi   status "--ignored --short"

__git_shortcut  ga    add

__git_shortcut  agd   add

__git_shortcut  apgd  add -p

__git_shortcut  gb    branch

__git_shortcut  gbdm  branch-delete-merged

__git_shortcut  gbv   branch "-a -v"

__git_shortcut  gc    commit --verbose

__git_shortcut  gca   commit "--amend --verbose"

__git_shortcut  gd    diff

__git_shortcut  gds   diff --staged

__git_shortcut  gdno  diff --name-only

__git_shortcut  gdsno diff "--staged --name-only"

__git_shortcut  go    checkout

# Add tab completion for git lg, which behaves the same as tab completion for
# git log. Tab completion for git lg works without this function, however
# tab completion for `gl` needs this function.
function _git_lg() {
  _git_log
}
__git_shortcut  gl    lg # Mapped to custom alias, pretty one-line log.

__git_shortcut  gd-   d- # Mapped to custom alias, delete previous branch.

# gpr 96, will fetch PR 96 create branch pull-request-96
gpr () {
	git fetch origin pull/$1/head:pull-request-$1;
	git checkout pull-request-$1;
}
