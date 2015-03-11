# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git osxi git-flow)
source $ZSH/oh-my-zsh.sh
source ~/.init_dice.sh
source `jump-bin --zsh-integration`

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
source '/Users/gregoirelejay/dev/dice/bigD/tools/google-cloud-sdk/path.zsh.inc'
# The next line enables bash completion for gcloud.
source '/Users/gregoirelejay/dev/dice/bigD/tools/google-cloud-sdk/completion.zsh.inc'

# Maven
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"

# Exports
export GOPATH=$HOME/dev/golang
export JAVA_HOME=$(/usr/libexec/java_home)
export HADOOP_HOME=$HOME/dev/dice/bigD/hadoop-2.5.1
export SPARK_HOME=$HOME/dev/dice/bigD/spark-1.2.0
export SCALA_HOME=$HOME/dev/scala/scala-2.11.5
export HOMEBREW_GITHUB_API_TOKEN=a51472e2101bc84ceb4e9aacc8bf7500b9e3f7da
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# Path
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/witold/programs/toolchain/gcc-arm-none-eabi-4_7-2013q2/bin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/usr/local/share/npm/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin:/Users/witold/programs/tools/compound/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$HOME/programs/personal/others/swift-0.95-RC6/cog/modules/swift/bin
export PATH=$PATH:$HOME/dev/dice/elk/logstash/bin/
export PATH=$PATH:$HOME/dev/scala/activator-1.2.12-minimal

# Aliases

# Lists
alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -a'
alias lx='ls -lXB'
alias lt='ls -ltr'
alias lm='ll | more'
alias tree="tree -C"


# Find
alias fr='find . -name'
alias fh='find $HOME -name'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias root='sudo -i'

# Disk Usage
alias df='df -H'
alias du='du -ch'

# Others
alias pingoo="ping -c 3 www.google.com"
alias clear="clear;ls"
alias qwe="mvim"
alias sqwe='sudo mvim'
alias subl='open -a Sublime\ Text\ 2'
alias j="jump"
alias less="less -s -M +Gg"

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
alias gg='git grep --ignore-case'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# Misc
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

function testGoLoc() {
    go test -p 1 `find ./app -mindepth 1 -type d -exec sh -c 'ls -1 "{}"|egrep -i -q "_test\.go$"' ';' -print`
}

function frall() {
    if [[ -z $(git status -s) ]] then
        echo "You Fool! Please commit your changes first"
        return 1
    fi
    if [ "$#" -ne 2 ]; then
        echo "Illegal number of parameters"
        return 1
    fi
    find * -type f | xargs perl -pi -e 's/$1/$2/g'
}

# OPAM configuration
. /Users/gregoirelejay/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
