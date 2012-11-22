# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# "force" bash-completion, even if it's not enabled in /etc/bash.bashrc
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

source ~/.bash/common
source ~/.bash/prompt
source ~/.bash/git
source ~/.bash/rvm
source ~/.bash/ruby
source ~/.bash/projects

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
