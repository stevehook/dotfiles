
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
source ~/git-completion.bash
# export PS1='\w$(__git_ps1 "(%s)") > '
export PS1='\[\033[01;32m\]\h\[\033[00;37m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[00;37m\]\n$\[\033[00m\] '
export GIT_PS1_SHOWDIRTYSTATE=true

# MacPorts Installer addition on 2011-02-15_at_19:49:49: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# export NODE_PATH="/usr/local/lib/node"

# Put git back into the path
export PATH=/usr/local/git/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
