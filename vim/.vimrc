set nocompatible

execute pathogen#infect()

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ocaml_checkers = ['merlin']

"====[ Basic Config ]====
filetype plugin indent on

set nofoldenable    " disable folding
set noerrorbells         " don't beep
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

set synmaxcol=200
set guioptions=gtrLm
if has("gui_running")
    if has("gui_macvim")
        set guifont=Menlo\ Regular:h13
    endif
endif

" search first in current directory then file directory for tag file
set tags=tags,./tags

"===[ In test ]================================
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

set omnifunc=syntaxcomplete#Complete
nmap <Leader>nn :so %<CR>

set completeopt=menuone,menu,longest
set runtimepath^=~/.vim/bundle/ag
set completefunc=emoji#complete

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"====[ Indent Guides ]===============
:let g:indent_guides_guide_size=1
:let g:indent_guides_auto_colors=1

"====[ Easy moves between tabs ]===============
nmap <silent> <c-Right> :tabn<CR>
nmap <silent> <c-Left> :tabp<CR>

"================= Remaps ============================
nnoremap <Space> <PageDown>

" Indent/outdent current block...
nmap %% $>i}``
nmap $$ $<i}``

nmap :Wq :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :WQ :wq
nmap :Q  :q
nmap :W  :w

nmap :te :tabe
nmap :Te :tabe
nmap :TE :tabe
nmap :E :e
nmap :Vsp :vsp
nmap :Sp :sp
nmap :yanks :Yanks

nmap :amke :make
nmap :amek :make
nnoremap j gj
nnoremap k gk


nnoremap R "_d

nmap :mcf :MultipleCursorsFind
nmap :gf :GoFmt<CR>
nmap :mto :MerlinTypeOf<CR>
let g:colorizer_startup = 0

"====[ Spelling ]============
autocmd BufRead,BufNewFile *.md setlocal spell

"====[ CtrlP ]===============
:nmap ; :CtrlPBuffer<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_switch_buffer = 0
:let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"====[ Multi Cursor ]===============
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"=====[ Go ]==================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

"=====[ R ]==================
let vimrplugin_assign = 2

"====[ Window splits ]========
nmap <silent> <c-w> :wincmd k<CR>
nmap <silent> <c-s> :wincmd j<CR>
nmap <silent> <c-a> :wincmd h<CR>
nmap <silent> <c-d> :wincmd l<CR>

"====[ Misc ]=================
let g:syntastic_check_on_open=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
runtime plugin/autodoc.vim
runtime plugin/documap.vim
let g:rainbow_active = 1

"====[ Pymode ]============
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 120
let g:pymode_lint_checkers = ['pyflakes_']
"let g:pymode_lint_checkers = ['pylint']
let g:pymode_lint_config = '~/.pylintrc'
let g:pymode_breakpoint = 0
let g:pymode_doc = 0
let g:pymode_rope=0
"let g:pymode_lint_unmodified = 0
"let g:pymode_rope_autoimport = 0

"====[ NERD Tree ]============
map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

"====[ Set background hint ]=============
if $VIMBACKGROUND != ""
    exec 'set background=' . $VIMBACKGROUND
else
    set background=dark
endif

" ================[ Theme ]=======================
set background=light
"colorscheme kib_darktango
colorscheme solarized
"colorscheme badwolf
"colorscheme leya
"colorscheme base16-atelierforest
"colorscheme fokus
"colorscheme desertEx
"colorscheme summerfruit256
"colorscheme summerfruit
"colorscheme candycode
"colorscheme bocau
"colorscheme deveiate
"colorscheme ekinivim
"colorscheme dante
"colorscheme molokai
"colorscheme coffee
"colorscheme detailed
"colorscheme darkrobot

" ================[ Mouse ]=======================
if has('mouse')
  set mouse=a
endif

" ================ Syntax Highlighting =======================
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
"  set hlsearch
endif

if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  augroup END
else
  set autoindent always set autoindenting on
endif " has("autocmd")

"====[ Use persistent undo ]=================
if has('persistent_undo')
    set undodir=$HOME/tmp/.VIM_UNDO_FILES
    set undolevels=5000
    set undofile
endif

"====[ Goto last location in non-empty files ]=======
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif

"====[ Toggle visibility of naughty characters ]============
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END

"====[ Set up smarter search behaviour ]=======================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used
set hlsearch        "Highlight all matches

"Delete in normal mode to switch off highlighting till next search and clear messages...
Nmap <silent> <BS> [Cancel highlighting]  :nohlsearch <BAR> call Toggle_CursorColumn('off')<CR>

"Double-delete to remove search highlighting *and* trailing whitespace...
Nmap <silent> <BS><BS>  [Cancel highlighting and remove trailing whitespace]
\             mz:%s/\s\+$//g<CR>`z:nohlsearch<CR>

"====[ Handle encoding issues ]============
set encoding=latin1

Nmap <silent> U [Toggle UTF8]  :call ToggleUTF8()<CR>

function! ToggleUTF8 ()
    if &fileencoding =~ 'utf-\?8'
        set fileencoding=latin1
    else
        set fileencoding=utf8
    endif
    echo '[' . &fileencoding . ']'
endfunction

"=====[ There can be only one (one Vim session per file) ]=====================
" I keep that option but for now on, I don't need swap files
set nobackup
set noswapfile

augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists *  let v:swapchoice = 'o'
    autocmd SwapExists *  echohl ErrorMsg
    autocmd SwapExists *  echo 'Duplicate edit session (readonly)'
    autocmd SwapExists *  echohl None
    autocmd SwapExists *  call Make_session_finder( expand('<afile>') )
    autocmd SwapExists *  sleep 1
augroup END

function! Make_session_finder (filename)
    exec 'nnoremap ss :!terminal_promote_vim_session ' . a:filename . '<CR>:q!<CR>'
endfunction


"=====[ Misc]==================================
set smartindent
set autoindent
set nowrap
set modelines=0

set title
set titleold=
set nomore

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected

set viminfo=h,'50,<10000,s1000,/1000,:1000

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings

set updatecount=10                  "Save buffer every 10 chars typed

set scrolloff=4                     "Scroll when 2 lines from top/bottom

set ruler "show the cursor position all the time

set showcmd "display incomplete commands
set cursorline
set number

set incsearch   " do incremental searching

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" ================ Completion =======================
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

"=====[ Cut and paste from MacOSX clipboard ]====================
"set clipboard=unnamed
"if has("gui_macvim")
  "set clipboard=unnamed
"else
  "set clipboard=unnamedplus
"endif

"=====[ Tab handling ]======================================
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

"=====[ Project specific Tab handling ]===================================
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4 sts=4
au BufNewFile,BufRead *.sh setlocal noet ts=2 sw=2
au BufNewFile,BufRead *.R  setlocal et ts=2 sw=2
au BufNewFile,BufRead *.jade setlocal et ts=2 sw=2
au BufNewFile,BufRead *.ml setlocal et ts=2 sw=2

"=====[ Completion Scheme ]===================================
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue

"=====[ Highlight cursor (plus row and column on request) ]===================

" Inverse highlighting for cursor...
highlight CursorInverse   term=inverse ctermfg=black ctermbg=white
call matchadd('CursorInverse', '\%#', 100)

" Need an invisible cursor column to make it update on every cursor move...
highlight clear CursorColumn
highlight CursorColumn term=none cterm=none
set cursorcolumn

" Toggle cursor row highlighting on request...
"highlight CursorLine   term=bold ctermfg=black ctermbg=cyan  cterm=bold
Nmap <silent> ;r [Toggle cursor line highlighting] :set cursorline!<CR>

 "Toggle cursor column highlighting on request...
Nmap <silent> ;c [Toggle cursor row highlighting] :silent call Toggle_CursorColumn('flip')<CR>

" Implement cursor toggle...
let g:cursorcolumn_visible = 0
function! Toggle_CursorColumn (requested_state)
    if a:requested_state == 'off' || g:cursorcolumn_visible && a:requested_state == 'flip'
        let g:cursorcolumn_visible = 0
        highlight clear CursorColumn
        highlight CursorColumn term=none cterm=none
    else
        let g:cursorcolumn_visible = 1
        highlight CursorColumn term=bold ctermfg=black ctermbg=cyan cterm=bold
    endif
endfunction


"====[ Make the 81st column stand out ]====================
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"=====[ Make Visual modes work better ]==================
"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x

" When shifting, retain selection over multiple shifts...
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
    set nosmartindent
    if mode() ==# "V"
        return a:cmd . ":set smartindent\<CR>gv"
    else
        return a:cmd . ":set smartindent\<CR>"
    endif
endfunction

"====[ Open any file with a pre-existing swapfile in readonly mode "]=========
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 1
augroup END


"===[ OCAML ]====


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 7475d5ee1472d910edbc2c7476ec7d8d ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/gregoirelejay/.opam/4.02.3/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
"
au filetype ocaml   :nmap <leader>d :MerlinDestruct<CR>
au filetype ocaml   :nmap <leader>r :MerlinRename


