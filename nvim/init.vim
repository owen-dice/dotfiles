set nocompatible

if has('nvim')
    let g:editor_root=expand("~/.nvim")
else
    echo "Using Vim"
    let g:editor_root=expand("~/.vim")
endif

if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/local/bin/python3'
    endif
endif

source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/tabulation.vim
