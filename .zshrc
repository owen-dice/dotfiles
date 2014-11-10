# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osxi git-flow)

source $ZSH/oh-my-zsh.sh
source ~/.init_dice.sh
source `jump-bin --zsh-integration`

# Customize to your needs...
export GOPATH=$HOME/dev/golang
export JAVA_HOME=$(/usr/libexec/java_home)
export HADOOP_HOME=$HOME/dev/bigD/hadoop-2.5.1

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/witold/programs/toolchain/gcc-arm-none-eabi-4_7-2013q2/bin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HADOOP_HOME/bin

# Customize to your needs...
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/witold/programs/toolchain/gcc-arm-none-eabi-4_7-2013q2/bin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/bin
export HOMEBREW_GITHUB_API_TOKEN=a51472e2101bc84ceb4e9aacc8bf7500b9e3f7da
export PATH=$PATH:$HOME/programs/personal/others/swift-0.95-RC6/cog/modules/swift/bin
export PATH=$PATH:$HOME/dev/dice/elk/logstash/bin/

#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -a'
alias lx='ls -lXB'
alias lt='ls -ltr'
alias lm='ll | more'
alias tree="tree -C"
#
alias subl='open -a Sublime\ Text\ 2'
alias fr='find . -name'
alias fh='find $HOME -name'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias root='sudo -i'
alias df='df -H'
alias du='du -ch'
alias pingoo="ping -c 3 www.google.com"
alias clear="clear;ls"
alias qwe="mvim"
alias sqwe='sudo mvim'
alias ggrep=""
alias j="jump"
alias cdls="echo Greg, wake up..."
alias less="less -s -M +Gg"

function psgkill {
    kill `ps -ef | grep $1 | grep -v grep | awk '{print $2}'`
}

# Pretty print JSON
function ppjson {
    cat $1 | python -mjson.tool
}

# Recursive grep
function grec {
    grep -irn $1 .
}

function sserver {
    python -m SimpleHTTPServer $1
}

# Writes the JSON output of $1 in $2
function saveAPIRequests {
 $1 | python -mjson.tool > $2
}

# Search in bash_history
function hsearch {
	history | grep -i $1
}

# Writes the output of hsearch in ~/.h_hisotry
function hsc {
	history | grep -i $1 2>&1 | tee $HOME/.h_history
}

# Executes the command <NUM>$1 from the h_history file
function hse {
	history | sed -n $1'p'
	history | sed -n $1'p' | cut -d ' ' -f2 | source /dev/stdin
}

# $1: line Number $2: file Name
function line {
	sed -n $1'p' $2
}

function psg {
	ps -e | grep -in $1
}

# Git Shortcuts
alias gpom="git push origin master"
alias gpo="git push origin "
alias gpall="git push --all"
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log -p --graph --abbrev-commit'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# Profile Shortcuts
function sourceprofile {
	source $HOME/.zshrc
}

function showprofile {
	mvim $HOME/.zshrc
}

# wget Shortcut
function getsrc {
    wget $1 -O `echo "$1" | sed 's/\/$//' | awk -F/ '{print $NF }'`
}

# Find and access a directory via grep 
function lsg {
	ls -a | grep -in $1
	export LINE_N=`ls -a | grep -in $1 |  cut -d ':' -f2`
}

function cdl {
	cd $LINE_N
}

function mcm {
	make clean && make $1
}

function vimPlugins {
    cat $HOME/.vim/bundle/*/.git/config | grep url | cut -d "=" -f2 | sed 's/ /git clone /g'
}

function rsketch {
    mkdir -p /tmp/processing
    processing-java --output=/tmp/processing/ --force --run --sketch=$PWD
}

function editconflicts() { 
  mvim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}
