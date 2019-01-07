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

# Search
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function hg() { history | grep $@ }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias ll="ls -lha"

# Use vs code for editing config files
alias ezsh="code -n ~/.zshrc"
alias eenv="code -n ~/env.sh"
alias esec="code -n ~/secrets.sh"
alias cn="code -n ."

# git aliases
alias gs="git status"


# get stuff up
alias dcbu="docker-compose pull && docker-compose build && docker-compose up"

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

pwdgen () {
    if [ -z "$1" ]
    then
        gpg --gen-random --armor 1 20
    else
        gpg --gen-random --armor 1 $1
    fi
}

serve () {
    if [ -z "$1" ]
    then
        port=8000
    else
        port=$1
    fi    
    python3 -m http.server ${port}&> /dev/null &
    pid=$!
    open http://127.0.0.1:${port}/
    vared -p "Serving folder on port ${port} in process ${pid} (enter to stop)" -c tmp
    kill "${pid}"
}

portlisten () {
    lsof -n -i4TCP:$1 | grep LISTEN
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
test -f ~/secrets.sh && source ~/secrets.sh