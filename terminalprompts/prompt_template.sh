# TO APPLY THIS PROMPT
# Add the line below in your .bashrc file (found under the home folder)
# source <name_of_script>.sh

STOP_COLOR="\033[0m";
BOLD_COLOR="\033[1m";
SUCCESS_COLOR="\033[1;33m";
FAILED_COLOR="\033[1;31m";

# Shell function to determine current working git branch and echo it out
# Branch name is highlighted with the color \033[1;34m and is ended properly
#  so that it doesn't extend
function branch()
{
    if [[ -d .git ]] || [[ $(git rev-parse --git-dir 2> /dev/null) ]]; then
        echo -en "\033[1;34m[$(git branch | head -1 | awk '{print $2}')]\033[0m";
    fi
}

# Function to determine whether the last command executed successfully or not
function exitcolor()
{
    # The special variable $? holds the exit status of last command
    # If it's 0, then it's successful
    # Else it failed
    # Set the color for the upcoming text accordingly
    if [[ "$?" == "0" ]]; then
        echo -en "$SUCCESS_COLOR";
    else
        echo -en "$FAILED_COLOR";
    fi
}

# Root user has an ID of 0. Give different prompts for Root and Normal Users respectively
# Apply your modifications here and Submit a PR, that's the primary task!
# PS1 is the variable to hold the primary prompt's text

# Here's an example prompt, modify it according to your liking!
if [[ $(id -u) == 0 ]]; then
        export PS1='$(exitcolor)[i.am.groot.]\033[0m\n\033[1m[\h]\033[1m[\w]$(branch) \[\033[1;35m\]#>\[\033[0m\] ';
else
        export PS1='$(exitcolor)[\u@\h]\[\033[0m\033[1m\][\w]$(branch)\n\[\033[1m\] ⤷\[\033[0m\] ';
fi

# Secondary Prompt variable PS2 which shows up
# when a command is continued on the next line
export PS2='\[\033[1;36m\]>\[\033[0m\] ';
