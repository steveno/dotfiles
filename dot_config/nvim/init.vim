" Any copyright is dedicated to the Public Domain.
" https://creativecommons.org/publicdomain/zero/1.0/

call plug#begin('~/.config/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'bhurlow/vim-parinfer'
Plug 'yorickpeterse/vim-paper'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sbdchd/neoformat'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}
call plug#end()

filetype plugin indent on

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

" Create backups
try
    set backup
    set backupdir=$HOME/.local/share/nvim/backups/
    set directory=$HOME/.local/share/nvim/backups/
catch
endtry

" Show full tags when doing search completion
set showfulltag
set expandtab

" Speed up macros
set lazyredraw

" No error noises
set noerrorbells
set novisualbell

" Try to show at least three lines and two columns of
" context when scrolling
set scrolloff=3
set sidescrolloff=2

" Wrap and match
set whichwrap+=<,>,[,]
set matchpairs+=<:>

" Print with syntax highlighting and line numbers
set shiftwidth=4
set smartindent

" Turn off highlighting
set nohls!

" Disable line wrapping
set nowrap

" Show us the command we're typing
set showcmd

" Highlight matching parens
set showmatch

" Set a dark background
set number
setlocal numberwidth=3

" Allow hidden buffers
set hidden

" color scheme
if exists('+termguicolors')
   let &t_8f =  "\<Esc>[38:2;%lu;%lu;%lum"
   let &t_8b =  "\<Esc>[48:2;%lu;%lu;%lum"
   set t_Co=256
   set termguicolors
    colorscheme paper
endif

autocmd FileType make setlocal noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
\ 'ocmal':      ['ocamllsp'],
\ 'go':         ['gopls'],
\}

" D lang Error format
autocmd FileType d set efm=%*[^@]@%f\(%l\):\ %m,%f\(%l\\,%c\):\ %m,%f\(%l\):\ %m

" Run D unit tests on current file
function! DTest()
  let l:fn = substitute(expand('%:r'), '/', '-', 'g') . '.lst'
  call delete(l:fn)
  cexpr system('dmd -cov -unittest -main -run ' . expand('%'))
  if filereadable(l:fn)
     normal gg
     execute '13vsplit' l:fn
     normal gg
     set scrollbind
     normal ^Wl
     set scrollbind
  endif
endfunction

autocmd FileType d nnoremap <f8> :call DTest()<cr>

" go
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Python
let g:python3_host_prog = '/usr/bin/python3'

" OCaml
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
let g:opambin = substitute(system('opam var bin'),'\n$','','''')


let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': g:opambin . '/ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

" Tab selects the first item in the list.
" Then use C-P,C-N (prev/next) to cycle.
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

