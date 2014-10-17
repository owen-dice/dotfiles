set nocompatible

execute pathogen#infect()

au VimEnter * RainbowParenthesesToggle
"====[ Basic Config ]====
filetype plugin indent on

set noerrorbells         " don't beep
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
"====[ Easy moves between tabs]===============
nmap <silent> <c-Right> :tabn<CR>
nmap <silent> <c-Left> :tabp<CR>
nmap :te :tabe
nmap :Te :tabe
nmap :E :e
nmap :Vsp :vsp
nmap :amke :make
nmap :amek :make

"====[ Easy moves between window splits ]===============

nmap <silent> <c-w> :wincmd k<CR>
nmap <silent> <c-s> :wincmd j<CR>
nmap <silent> <c-a> :wincmd h<CR>
nmap <silent> <c-d> :wincmd l<CR>

"====[ Plugin Configuration ]====
let g:syntastic_check_on_open=0

"=================[ NERD Tree ]========================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0

"====[ Ensure autodoc'd plugins are supported ]===========
runtime plugin/autodoc.vim

"=====[ Enable Nmap command for documented mappings ]================
runtime plugin/documap.vim

"====[ Edit and auto-update this config file and plugins ]==========
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

Nmap <silent>  ;v   [Edit .vimrc]          :next $MYVIMRC<CR>
Nmap           ;vv  [Edit .vim/plugin/...] :next ~/.vim/plugin/

"====[ Set background hint (if possible) ]=============

if $VIMBACKGROUND != ""
    exec 'set background=' . $VIMBACKGROUND
else
    set background=dark
endif

" ================[ Theme ]=======================
colorscheme molokai

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
             \ | wincmd p | diffthis
endif

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


"=====[ Indentation and warping ]==================================
set smartindent
set autoindent
set nowrap

"====[ I hate modelines ]===================
set modelines=0

set title
set titleold=
set nomore

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 50 files
"           | |   +--Remember up to 10000 lines in each register
"           | |   |      +--Remember up to 1MB in each register
"           | |   |      |     +--Remember last 1000 search patterns
"           | |   |      |     |     +---Remember last 1000 commands
"           | |   |      |     |     |
"           v v   v      v     v     v
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
set smartindent

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

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

" ================ Case =======================
set ignorecase
set smartcase

"================= Remaps ============================
" Use space to jump down a page (like browsers do)...
nnoremap <Space> <PageDown>

" Take off and nuke the entire buffer contents from space
" (It's the only way to be sure)...
nmap XX 1GdG

" Indent/outdent current block...
nmap %% $>i}``
nmap $$ $<i}``

"====[ Recurrent typos when saving and quitting ]====
nmap :Wq :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :WQ :wq
nmap :Q  :q
nmap :W  :w

"=====[ Cut and paste from MacOSX clipboard ]====================
"set paste
"set clipboard=unnamed
" Paste carefully in Normal mode...
nmap <silent> <C-P> :set paste<CR>
                   \:let b:prevlen = len(getline(0,'$'))<CR>
                   \!!pbtranspaste<CR>
                   \:set nopaste<CR>
                   \:set fileformat=unix<CR>
                   \mv
                   \:exec 'normal ' . (len(getline(0,'$')) - b:prevlen) . 'j'<CR>
                   \V`v

" When in Visual mode, paste over the selected region...
vmap <silent> <C-P> x:call TransPaste(visualmode())<CR>

function! TransPaste(type)
    " Remember the last yanked text...
    let reg_save = @@

    " Grab the MacOSX clipboard contents via a shell command...
    let clipboard = system("pbtranspaste")

    " Put them in the yank buffer...
    call setreg('@', clipboard, a:type)

    " Paste them...
    silent exe "normal! P"

    " Restore the previous yanked text...
    let @@ = reg_save
endfunction


" In Normal mode, yank the entire buffer...
nmap <silent> <C-C> :w !pbtranscopy<CR><CR>

" In Visual mode, yank the selection...
vmap <silent> <C-C> :<C-U>call TransCopy(visualmode(), 1)<CR>

function! TransCopy(type, ...)
    " Yank inclusively (but remember the previous setup)...
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    " Invoked from Visual mode, use '< and '> marks.
    if a:0
        silent exe "normal! `<" . a:type . "`>y"

    " Or yank a line, if requested...
    elseif a:type == 'line'
        silent exe "normal! '[V']y"

    " Or yank a block, if requested...
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"

    " Or else, just yank the range...
    else
        silent exe "normal! `[v`]y"
    endif

    " Send it to the MacOSX clipboard...
    call system("pbtranscopy", @@)

    " Restore the previous setup...
    let &selection = sel_save
    let @@ = reg_save
endfunction


"=====[ Tab handling ]======================================

set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

"=====[ Project specific Tab handling ]===================================
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

function! ProjectSettings ()
    let l:path = expand('%:p')
    if l:path =~ '/Users/witold/dev/dice/pam'
        setlocal expandtab tabstop=2 shiftwidth=2
    endif
endfunction
autocmd! BufReadPost,BufNewFile * call ProjectSettings()

"=====[ Go ]===================================
let g:go_fmt_autosave = 0
let g:go_fmt_fail_silently = 1
let g:go_play_open_browser = 0

"=====[ Completion Scheme ]===================================
" Make the completion popup look menu-ish on a Mac...
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
highlight CursorLine   term=bold ctermfg=black ctermbg=cyan  cterm=bold
Nmap <silent> ;r [Toggle cursor line highlighting] :set cursorline!<CR>

" Toggle cursor column highlighting on request...
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

" Make vaa select the entire file...
vmap aa VGo1G

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

" Temporarily add a column indicator when inserting or appending in visual mode...
" (Should use <C-O> instead, but it doesn't seem to work)
vnoremap <silent>  I  I<C-R>=TemporaryColumnMarkerOn()<CR>
vnoremap <silent>  A  A<C-R>=TemporaryColumnMarkerOn()<CR>

function! TemporaryColumnMarkerOn ()
    let g:prev_cursorcolumn_state = g:cursorcolumn_visible ? 'on' : 'off'
    call Toggle_CursorColumn('on')
    inoremap <silent>  <ESC>  <ESC>:call TemporaryColumnMarkerOff(g:prev_cursorcolumn_state)<CR>
    return ""
endfunction

function! TemporaryColumnMarkerOff (newstate)
    call Toggle_CursorColumn(a:newstate)
    iunmap <ESC>
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


