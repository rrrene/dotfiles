# Path to your oh-my-zsh installation.
export ZSH=/Users/rene/.oh-my-zsh

export GIT_USER="rrrene"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler osx rake virtualenv ssh-agent git-flow battery brew gitignore mix vim-interaction)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/usr/local/include/nr3:/usr/local/include/nr3:/opt/local/bin:/opt/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias themeconfig="vim ~/.oh-my-zsh/themes/like-a-rainbow.zsh-theme"

###########################################################
# 5Minds add ons
###########################################################

alias cdable="cd ~/Google\ Drive/AE-Unterstützung\ 5Minds/able/int/documents/"
export KONZEPTE_DIR=~/Google\ Drive/AE-Unterstützung\ 5Minds/able/int/documents/konzepte
export HCM_DIR=~/Google\ Drive/AE-Unterstützung\ 5Minds/able/int/documents/hcm

#
# Finder aliases to display or hide all files
#
if [[ $(uname) == 'Darwin' ]] then
	alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
	alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
else
fi

alias ts='tmux ls'
alias tk='tmux kill-server'

f() {
	grep -rl "$1" .
}

#
# Build a docx from given file using pandoc
# This will use the reference document specified in MINDS_PANDOC_TEMPLATE_CONCEPT
#
pandocxify() {
	pandoc -S --reference-docx $MINDS_PANDOC_TEMPLATE_CONCEPT -o $2 $1
}

SerachAndReplace() {
	#LANG=C
	echo '$1'
	echo "$2"
	#grep -rl "$1" . | xargs sed -i '' "s/$1/$2/g"
	grep -rl 'pdf' . | xargs sed -i '' 's/pdf/dddasd/g'
}

alias snr=SerachAndReplace

#
#Pandoc reference documents
#
MINDS_DOTFILES_PANDOC_PATH=~/.5minds.dotfiles/pandoc
MINDS_PANDOC_TEMPLATE_TELKO=$MINDS_DOTFILES_PANDOC_PATH/templates/5Minds.Telko.Ref.docx
MINDS_PANDOC_TEMPLATE_CONCEPT=~/.5minds.dotfiles/pandoc/templates/5Minds.Ref.docx

alias ls3rdpartydriver="kextstat | grep -v com.apple"
alias lstty='ls /dev/tty*'
alias reload!='source ~/.zshrc'

function git_clone_from_github() {
  USER=""
  REPO=""
  TARGET=""
  if [[ "$#" -lt 1 ]]; then
    echo "usage: $0 [user] [repo] [target]
                Specifyind the 'user' is optional. Then I will assume to use the \$GIT_USER.
                The 'target' is optional and can contain the folder to clone into"
    return 1
  fi
  if [[ "$#" -eq 1 ]]; then
    echo "Assuming default git-user"
    if [[ -z $GIT_USER ]]; then
      echo "Plase consider setting \$GIT_USER."
      echo "No git-user found -> aborting"
      return 1
    fi
    USER=$GIT_USER
    REPO=$1
  fi
  if [[ "$#" -ge 2 ]]; then
    USER=$1
    REPO=$2
  fi
  if [[ "$#" -eq 3 ]]; then
    TARGET=$3
  fi
  echo "Performing: 'git clone git@github.com:${USER}/${REPO} ${TARGET}'"
  git clone git@github.com:${USER}/${REPO} $TARGET
  return 0
}
alias ghclone!=git_clone_from_github

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/

PATH=/usr/local/bin:${PATH/:\/usr\/local\/bin}

# common
export EDITOR=vim
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.rvm/bin"      # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/elixir/bin"
export PATH="$PATH:./node_modules/.bin"

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
