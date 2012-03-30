# MacPorts Installer addition on 2011-02-15_at_19:49:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export NODE_PATH="/usr/local/lib/node"
export PATH=$HOME/bin:/usr/local/git/bin:$PATH
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'

. ~/.zsh/aliases

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}➜%{$reset_color%},%{$fg[red]%}➜%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/dotfiles/files/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
