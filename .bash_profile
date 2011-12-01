source ~/git-completion.bash
# export PS1='\w$(__git_ps1 "(%s)") > '
export PS1='\[\033[01;32m\]\h\[\033[00;37m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[00;37m\]\n$\[\033[00m\] '
export GIT_PS1_SHOWDIRTYSTATE=true
##
# Your previous /Users/stevehook/.bash_profile file was backed up as /Users/stevehook/.bash_profile.macports-saved_2011-02-15_at_19:49:49
##

# MacPorts Installer addition on 2011-02-15_at_19:49:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export NODE_PATH="/usr/local/lib/node"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.