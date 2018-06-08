# Path to your oh-my-zsh installation.
export ZSH=/home/ericles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awesomepanda"
# awesomepanda
# crunch
# wedisagree
# terminalparty
# norm
# arrow

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(web-search git autojump)

# User configuration

export PATH="$PATH":"usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ericles/.gem/ruby/2.2.0/bin:/home/ericles/.gem/ruby/2.2.0/bin"
export PATH="$PATH":"/usr/local/Wolfram/Mathematica/11.2/Executables"                             # Mathematica directory
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$PATH":"/home/ericles/Projetos/third-party-programs/eclipse/clp-2nd-try/bin/x86_64_linux"    # EclipseCLP directory

#export LD_LIBRARY_PATH="/home/ericles/Projetos/eclipse/eclipseclp.org/Distribution/Current/6.1_228_x86_64_linux/tcltk/x86_64_linux/lib"
# export MANPATH="/usr/local/man:$MANPATH"
#export PYTHONPATH=$PYTHONPATH:`openrave-config --python-dir`

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 #if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
 #else
   #export EDITOR='vim'
 #fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emacs='emacs -nw'
alias clisp='clisp -q'
alias ra='ranger'
alias a='acpi'
alias his='history|grep '
alias hs='history'
alias grep='grep -B 1 -A 1'
alias lgrep='ls|grep'

alias gcom='git commit -m'
alias ga='git add'
alias ga.='git add .'
alias go='git checkout'
alias gch='git checkout'
alias s='git status'
alias gt='git'

alias rke='bundle exec rake db:migrate'
alias shut='systemctl poweroff'
alias update='sudo pacman -Syu'
alias vol='alsamixer'
alias lgr='ls |grep'
alias bright='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'
alias sdo='sudo'
alias bc='bc -q'

alias octo='octave --no-gui -q'

alias cls='clear'
alias mk='make'
alias pdf='okular'

alias sleep='systemctl suspend'

#alias gams /home/ericles/Documents/IC/LP/testing/gams/gams24.8_linux_x64_64_sfx/gams
#alias gamslib /home/ericles/Documents/IC/LP/testing/gams/gams24.3_linux_x64_64_sfx/gamslib

set splitbelow
set splitright
#set -o vi # set vi as terminal editor
bindkey '^R' history-incremental-search-backward

# Trying to fix telegram's accentuation
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

fortune
. /usr/share/autojump/autojump.sh

#source /opt/ros/indigo/setup.bash
source /opt/ros/kinetic/setup.zsh

