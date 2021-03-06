# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

setopt all_export
setopt auto_cd
setopt auto_list
setopt cdablevars
setopt correct_all
setopt no_beep
setopt list_packed
setopt numericglobsort
setopt noflowcontrol
setopt extendedglob
setopt no_clobber
setopt magicequalsubst
setopt complete_in_word

setopt histignorealldups sharehistory

# Command history environment variables
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# use the built in directory navigation via the directory stack
# depth of the directory history
DIRSTACKSIZE=30
# automatic pushd
setopt AUTO_PUSHD
# exchange meaning of + and -
setopt PUSHD_MINUS
# don't tell me about automatic pushd
setopt PUSHD_SILENT
# use $HOME when no arguments specified
setopt PUSHD_TO_HOME
# ignore duplicates
setopt PUSHD_IGNOREDUPS

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="daveverwer"
#ZSH_THEME="cypher-nostatus"
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git debian command-not-found)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR=vim

# enable X ACL for localhost to connect to for GUI applications to work
# xhost +local: >/dev/null

alias l='ls -ltr --color=auto'
alias see='xdg-open'
alias rsyncrepo="rsync --filter=':- .gitignore' -aP"
# alias t='$HOME/progs/todo.txt_cli-2.9-bin/todo.sh'
IFS='
'
alias svn-cdiff='svn diff -x -p "$*" | colordiff | less'
alias svn-head-diff='svn diff -r`(svn info | grep Revision | cut -d" " -f2)`:HEAD | colordiff'
alias svn-head-summary='svn diff -r`(svn info | grep Revision | cut -d" " -f2)`:HEAD --summarize'

# export GDFONTPATH=/usr/lib64/python2.6/site-packages/matplotlib/mpl-data/fonts/ttf:$GDFONTPATH
export PATH=$HOME/.local/bin:$HOME/bin:/opt/git21/bin:$PATH
export PATH=$HOME/projects/flashcard-scripts:$PATH


# added by Miniconda 3.6.0 installer
# export PATH="/home/sat/miniconda/bin:$PATH"
# Node.js
# export PATH=/opt/node.js/bin:$PATH

# export PATH=/opt/gnuplot/bin:$PATH
# export PATH=/opt/llvm/bin:$PATH
export PATH=/opt/gcc-4.9.2/bin:$PATH
export PATH=/opt/gdb-7.8/bin:$PATH
# export PATH=/opt/inkscape/bin:$PATH

# Linaro
# export PATH=/opt/gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux/bin:$PATH

source $HOME/.profile

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

# pass ctrl+s to the apps
stty -ixon

# Disable globing, ie expansion of wildcards
# setopt noglob

# Move to (freedesktop) trash instead of directly removing
alias rm=trash-put

alias tree='tree -C'

function vim {
    # vim_path="$HOME/progs/vim7/bin/vim"
    # vim_path="/usr/local/bin/nvim"
    vim_path="/usr/bin/vim"
    if ! test -z "$DISPLAY" && $($vim_path --version | grep "+dialog_con_gui" -q >/dev/null)
    then
       vim_args=("-g" "-geometry" "1024x768")
    fi
    if test $ARGC -le 3; then
       # vsplit files
       vim_args=($vim_args "-O")
    else
       vim_args=($vim_args "-p")
    fi
    ${vim_path} ${vim_args} "$@"
}

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
export FZF_DEFAULT_OPTS="--sort $HISTSIZE"
source ~/.fzf.zsh
