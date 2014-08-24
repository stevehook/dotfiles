# MacPorts Installer addition on 2011-02-15_at_19:49:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:$HOME/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# Finished adapting your PATH environment variable for use with MacPorts.

#export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'

. ~/.zsh/aliases
source ~/.zsh/git-prompt/zshrc.sh

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
source ~/bin/tmuxinator.zsh

# Colors
autoload -U colors
colors
setopt prompt_subst

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt inc_append_history
setopt share_history

# Prompt
local smiley="%(?,%{$fg[green]%}➜%{$reset_color%},%{$fg[red]%}➜%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(git_super_status)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Add the following to your ~/.bashrc or ~/.zshrc
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# hitch

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add the z script directory finder
. $HOME/.zsh/z.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Shortcuts to open tmux sessions managed by tmuxinator
mx() {
  mux $(ls ~/.tmuxinator/ | sed 's/.yml//' | selecta)
}

mxo() {
  mux open $(ls ~/.tmuxinator/ | sed 's/.yml//' | selecta)
}

# Some Ruby memory tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000

# enables Ctrl-S so that we can use it with Ctrl-R reverse search
stty -ixon

