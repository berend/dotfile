#!/bin/zsh

# PATH
export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
# source /usr/local/bin/virtualenvwrapper.sh
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

ZSH_THEME="avit"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize github jira virtualenv pip python brew osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export VIRTUAL_ENV_DISABLE_PROMPT=



# Username
export USER_NAME="Berend Kapelle"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias ll="ls -lha"

# Use sublimetext for editing config files
alias ezsh="subl ~/.zshrc"
alias eenv="subl ~/workspace/dotfile/env.sh"
