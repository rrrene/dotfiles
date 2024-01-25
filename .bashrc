#!/bin/bash

if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Linux
  alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
fi

# common
export EDITOR=vim

source ~/.bash/asdf
source ~/.bash/git
source ~/.bash/prompt
source ~/.bash/projects

source ~/.bash/elixir
source ~/.bash/json
# source ~/.bash/rvm
# source ~/.bash/ruby

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# save more shell history
export HISTFILESIZE=2000
export HISTSIZE=2000
