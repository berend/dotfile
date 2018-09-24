#!/bin/zsh

export EDITOR='subl -w'

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source /usr/local/bin/virtualenvwrapper.sh

ZSH_THEME="avit"

# shell plugins
plugins=(git colorize github virtualenv pip python brew zsh-syntax-highlighting)

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
alias eenv="subl ~/env.sh"

# get stuff up
alias dcbu="docker-compose pull && docker-compose build && docker-compose up"

function p4diff() {/Applications/p4merge.app/Contents/Resources/launchp4merge $}

tunnel-anything () {
    ssh -M -S /tmp/tunnel-anything-1337 -fnNT -L "1337:localhost:$1" "$2"
    vared -p "Tunnel is to '$2' open, on 1337->$1 (enter to stop)" -c tmp
    ssh -S /tmp/tunnel-anything-1337 -O exit "$2"
}

fingerprint () {
    echo | openssl s_client -connect $1:443 |& openssl x509 -fingerprint -sha256 -noout
    echo | openssl s_client -connect $1:443 |& openssl x509 -fingerprint -sha1 -noout
}


# delete locally merged branches
dlmb () {
    git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

# delete remote merged branches (into master) (gxargs because of mac)
drmb () {
    # delete branches that are local and on origin
    git branch -r --merged origin/master \
    | awk -F/ '/^\s*origin/ {if (!match($0, /origin\/master/)) {sub("^\\s*origin/", ""); print}}' \
    | gxargs -rpn1 git push origin --delete

    # delete branches, that are only on origin and not locally:
    for branch in $(git for-each-ref --format='%(refname:lstrip=3)' refs/remotes/origin | grep -v HEAD | grep -v master); do
    if ! git show-ref --quiet refs/heads/${branch}; then
        echo "delete remote branch '${branch}'"
        git push origin --delete ${branch}
    fi
done
}


notebook () {
    workon notebook
    if [ -z "$1" ]
        then
            echo "starting notebook in default folder"
            jupyter notebook --notebook-dir=~/workspace/own/notebooks
        else
            echo "Starting notebook in given folder"
            jupyter notebook --notebook-dir=$1
    fi
}

mkv3 () {
    mkvirtualenv -p $(which python3) "$@"
}

mkv2 () {
    mkvirtualenv -p $(which python2) "$@"
}

clearpyc () {
    find . -name \*.pyc -delete
}