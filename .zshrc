# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias vi='/usr/local/bin/vim'
alias v='/usr/local/bin/vim'
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

alias locate='mdfind'
alias bundle='echo "---------- THIS IS LOCAL YOOOOOOO ----------" && bundle'

# save and share history between terms
setopt inc_append_history
setopt share_history
HISTSIZE=100000
SAVEHIST=100000

# git aliases
alias glog='git log --topo-order --pretty=format:${_git_log_oneline_format} --graph --decorate'
alias glogme='clear && git log --pretty=format:"%ad: %s %Cblue%d" --date=short --all --since=24.hours.ago --author="Kevin Wu" --date=iso --graph'

# go stuff
export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

function dos2unix {
  perl -pi -e 's/\r\n|\n|\r/\n/g' $1
}

## iTerm2 functions ##
function tab_color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

function reset_tab_color() {
  echo -ne "\033]6;1;bg;*;default\a"
}

function set_tab_color_for_cmd() {
  case "$1" in
    nvim|vim*|vi\ *)
      tab_color 0 127 0
      ;;
    ssh*)
      tab_color 245 190 25
      ;;
    rails\ *)
      tab_color 152 26 33
      ;;
    foreman\ *)
      tab_color 153 153 153
      ;;
    bundle*)
      tab_color 198 231 236
      ;;
  esac
}

add-zsh-hook precmd reset_tab_color
add-zsh-hook preexec set_tab_color_for_cmd

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

source ~/.academia-secrets
