ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git osxi git-flow
         colored-man-pages
         jump docker pip k terraform)

setopt CORRECT
setopt RM_STAR_SILENT


function source_if_exists {
    if [ -f $1 ]; then
        source $1
    fi
}

source_if_exists $ZSH/oh-my-zsh.sh
source_if_exists $HOME/.bashrc
source_if_exists $HOME/.init_dice.sh
source_if_exists $HOME/.env
source_if_exists $HOME/.aliases

export ZPLUG_HOME=/usr/local/opt/zplug

source_if_exists $ZPLUG_HOME/init.zsh

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

zplug "lib/compfix", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi
