nnoremap <Space> <PageDown>

nmap %% $>i}``    " Indent/outdent current block...
nmap $$ $<i}``
nnoremap R "_d
nnoremap gV `[v`] " Highlight last inserted block of text
nmap <Leader>nn :so %<CR>

"=================[ Plugins ]
nnoremap <leader>y :Ack<space>
nmap <leader>; :CtrlPBuffer<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <leader>h :ALELint<CR>
nmap <F3> :Autoformat<CR>
nnoremap <leader>p :Yapf<CR>
nnoremap <leader>gg :GitGutterToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>


nmap :mcf :MultipleCursorsFind
nmap :gf :GoFmt<CR>
nmap :mto :MerlinTypeOf<CR>

"=================[ Windows ]
nmap <silent> <Leader>w :wincmd k<CR>
nmap <silent> <Leader>s :wincmd j<CR>
nmap <silent> <Leader>a :wincmd h<CR>
nmap <silent> <Leader>d :wincmd l<CR>

"=================[ Tabs ]
nmap <silent> <Leader>e :tabn<CR>
nmap <silent> <Leader>q :tabp<CR>

"=================[ Typos ]
nmap :Wq :wq
nmap :wQ :wq
nmap :Wq :wq
nmap :WQ :wq
nmap :Q  :q
nmap :W  :w

nmap :E  :e

nmap :te :tabe
nmap :Te :tabe

nmap :Vsp :vsp
nmap :Sp :sp

nmap :yanks :Yanks

nmap :amke :make
nmap :amek :make

nmap :ack :Ack

"=================[ Movements ]
inoremap jj <esc>
inoremap jk <esc>

nnoremap j gj
nnoremap k gk

" Invert Paragraph moves to match J/K
nnoremap { }
nnoremap } {

nnoremap Q J
nnoremap J }
nnoremap K {

"=================[ Visual Mode ]
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
