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
	export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

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
# http://githowto.com/aliases modified
###
alias gs='git status'
alias gsi='git status --ignored'

alias ga='git add'
__git_shortcut  ga    add

alias gb='git branch'
__git_shortcut  gb    branch

alias gbv='git branch -a -v' # shows both local and remote branches AND verbose
__git_shortcut  gbv   branch "-a -v"

alias gc='git commit'
__git_shortcut  gc    commit

alias gd='git diff'
__git_shortcut  gd    diff

alias gds='git diff --staged'
__git_shortcut  gds   diff --staged

alias go='git checkout'
__git_shortcut  go    checkout

alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
__git_shortcut gl     log "--color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
