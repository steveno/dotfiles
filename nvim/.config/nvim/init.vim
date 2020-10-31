call plug#begin('~/.config/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'steveno/mavi'
Plug 'bhurlow/vim-parinfer'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'YorickPeterse/vim-paper'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin indent on

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

" Create backups
set backup

try
    set backupdir=$HOME/.config/nvim/backups/
    set directory=$HOME/.config/nvim/backups/
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
set popt+=syntax:y,number:y
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

if exists('+termguicolors')
   let &t_8f =  "\<Esc>[38:2;%lu;%lu;%lum"
   let &t_8b =  "\<Esc>[48:2;%lu;%lu;%lum"
   set t_Co=256
   set termguicolors
    colorscheme paper
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Python
let g:python3_host_prog = '/usr/bin/python3'

" vlime
let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}
