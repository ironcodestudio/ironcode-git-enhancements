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
# git aliases
# http://githowto.com/aliases
# modified
###
alias gs='git status'
alias ga='git add'
alias gb='git branch -a -v' # shows both local and remote branches AND verbose
alias gc='git commit'
alias gd='git diff'
alias gds='git diff --staged'
alias go='git checkout'
alias gl='git log --pretty=oneline'
