"=================[ GUI ]
set t_vb=
autocmd! GUIEnter * set vb t_vb=

set synmaxcol=200

set guioptions=gtrLm
if has("gui_running")
    if has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    endif
endif

highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=bin/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=.git,.gitkeep
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**

set colorcolumn=80

"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

if $VIMBACKGROUND != ""
    exec 'set background=' . $VIMBACKGROUND
else
    set background=dark
endif

set background=light
let g:solarized_termtrans = 1
let g:solarized_contrast = "high"
colorscheme solarized
let g:rainbow_active = 1
let g:rainbow_conf = {}
let g:rainbow_conf.ctermfgs = ['darkyellow', 'darkred', 'darkblue']
