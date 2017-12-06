filetype off

" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=g:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""

    silent call mkdir(g:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . g:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . g:editor_root . '/bundle/vundle/'
call vundle#rc(g:editor_root . '/bundle')
call vundle#begin()


Plugin 'gmarik/vundle'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-repeat'

"=================[ Filetypes ]
Plugin 'chrisbra/csv.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'dougireton/vim-chef'
Plugin 'google/vim-jsonnet'
Plugin 'markcornick/vim-vagrant'
Plugin 'hashivim/vim-terraform'

"=================[ Languages ]
Plugin 'sheerun/vim-polyglot'
Plugin 'jalvesaq/Nvim-R'
Plugin 'adimit/prolog.vim'
Plugin 'let-def/ocp-indent-vim'
Plugin 'willpragnell/vim-reprocessed'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plugin 'slashmili/alchemist.vim'


"=================[ Navigation ]
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|ipynb)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Plugin 'vim-scripts/ZoomWin'

Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plugin 'zchee/deoplete-jedi'
Plugin 'zchee/deoplete-go', { 'do': 'make'}

Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" inoremap <expr><tab> pumvisible() ? "\<c-x><c-o>" : "\<tab>"

Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

Plugin 'scrooloose/nerdtree'
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.pyc$', '\.git$']

Plugin 'terryma/vim-expand-region' " _/+
Plugin 'tpope/vim-commentary' " gcc

"=================[ Colors ]
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'lilydjwg/colorizer'

Plugin 'luochen1990/rainbow'

Plugin 'atelierbram/vim-colors_atelier-schemes'
Plugin 'nathanaelkane/vim-indent-guides' " <Leader>ig
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=1

"=================[ Syntax ]
Plugin 'w0rp/ale'
let g:ale_linters = {
            \ 'jsx': ['stylelint', 'eslint'],
            \ 'python': ['pylint'],
            \ 'go': ['golint', 'gotype']
            \}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed=0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '≈'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

Plugin 'Chiel92/vim-autoformat'

"=================[ Python ]
" Plugin 'davidhalter/jedi-vim'
Plugin 'vim-python/python-syntax'
Plugin 'mindriot101/vim-yapf'
" Plugin 'python-mode/python-mode'

let g:python_highlight_all = 1
let g:python_highlight_class_vars=1
let g:python_highlight_builtins=1
let g:python_highlight_builtin_objs=1
let g:python_highlight_builtin_funcs=1
let g:python_highlight_class_vars=1
let g:pymode_rope=0

"=================[ Go ]
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_excludes = ['golint', 'gotype']
let g:go_gometalinter_options='--vendor --tests --exclude=mock --exclude=gotype --exclude=golint --disable-all --enable=vet --enable=vetshadow --enable=ineffassign --enable=goconst  --enable=deadcode --enable=errcheck --enable=goimports'

"=================[ Others ]
Plugin 'kyuhi/vim-emoji-complete'
Plugin 'myusuf3/numbers.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

call vundle#end()


" set completeopt=menuone,menu,longest
set runtimepath^=~/.nvim/bundle/ag
filetype on
