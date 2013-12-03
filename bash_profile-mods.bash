# moved /usr/local/git/bin to front of path to use custom git (not Xcode version)
export PATH=/usr/local/git/bin:$PATH

###
# ENABLE git tab completion
###

# if the git-completion.bash script exists, load it
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash
fi

###
# ENABLE git status in prompt
###

# if the git-prompt.sh script exists,
if [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then

    # load prompt script
    . /usr/local/git/contrib/completion/git-prompt.sh

    # Add an * to the branch name if the branch
    # is dirty (i.e. there are changes since last commit)
    GIT_PS1_SHOWDIRTYSTATE=true

    # update prompt to include git status __git_ps1
    export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

fi

###
# git aliases
# http://githowto.com/aliases
###
alias gs='git status '
alias ga='git add '
alias gb='git branch -a -v' # shows both local and remote branches AND verbose
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
