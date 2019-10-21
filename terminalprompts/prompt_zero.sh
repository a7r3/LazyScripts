
function branch()
{
    if [[ -d .git ]] || [[ $(git rev-parse --git-dir 2> /dev/null) ]]; then
        echo -en "\033[1;34m[$(git branch | head -1 | awk '{print $2}')]\033[0m";
    fi
}

function exitcolor()
{
    if [[ "$?" == "0" ]]; then
        echo -en "\033[1;33m";
    else
        echo -en "\033[1;31m";
    fi
}

if [[ $(id -u) == 0 ]]; then
        export PS1='$(exitcolor)[i.am.groot.]\[\033[0m\]\n\[\033[1m\][\h]\[\033[1m\][\w]$(branch) \[\033[1;35m\]#>\[\033[0m\] ';
else
        export PS1='$(exitcolor)[\u@\h]\[\033[0m\033[1m\][\w]$(branch) \[\033[1m\]$\[\033[0m\] ';
fi

export PS2='\[\033[1;36m\]>\[\033[0m\] ';