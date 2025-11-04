#export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export EDITOR='NVIM_APPNAME=nvim-lazyvim /opt/homebrew/bin/nvim'

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

# export PATH=/usr/local/bin:$PATH
# export PATH=/usr/local/sbin:$PATH

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

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Yvm
export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Set default AWS profile
export AWS_PROFILE=Engineer-878877078763

# pyenv
eval "$(pyenv init -)"

# pip install executables here
export PATH="$HOME/.local/bin:$PATH"

# hoot up direnv
eval "$(direnv hook zsh)"

PATH="/Users/steve/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/steve/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/steve/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/steve/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/steve/perl5"; export PERL_MM_OPT;
