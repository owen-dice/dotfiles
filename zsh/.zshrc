ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git osxi git-flow colored-man-pages docker pip)

setopt CORRECT
setopt RM_STAR_SILENT

if [ -f $HOME/bin/jump-bin ]; then
    source `$HOME/bin/jump-bin --zsh-integration`
fi

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

eval $(docker-machine env cctv)

# OPAM configuration
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

