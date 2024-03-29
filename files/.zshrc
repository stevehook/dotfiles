
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# MacPorts Installer addition on 2011-02-15_at_19:49:49: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$HOME/bin:$PATH
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export PATH="$(yarn global bin):$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

#export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='/opt/homebrew/bin/nvim'

. ~/.zsh/aliases
# source ~/.zsh/git-prompt/zshrc.sh

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

# RPROMPT='%{$fg[white]%} $(git_super_status)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

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
export DEFERRED_GARBAGE_COLLECTION=true

# Project specific settings
export FEATURE_SERVER='http://localhost:3004/feature_request'
# export REDIS_URL='http://localhost:6379'
export SIGNER_KEY='HZXJBnvBdXaW7ghLVWwpxmapQaJai2Lr'

# enables Ctrl-S so that we can use it with Ctrl-R reverse search
stty -ixon

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

function devdocs {
  /usr/bin/open "http://devdocs.io/#q=$*"
}

export ADDONS_COUNTRY=na

mkcd () {
  case "$1" in /*) :;; *) set -- "./$1";; esac
  mkdir -p "$1" && cd "$1"
}

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function rbenvsudo(){
  executable=$1
  shift 1
  sudo $(rbenv which $executable) $*
}
fpath+=${ZDOTDIR:-~}/.zsh_functions

# source ~/.zsh-nvm/zsh-nvm.plugin.zsh
# if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

ulimit -S -n 2048

# workaround Ctrl-r not working in TMUX
bindkey '^R' history-incremental-search-backward

. /opt/homebrew/opt/asdf/libexec/asdf.sh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
