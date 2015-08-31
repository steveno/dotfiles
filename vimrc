call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'steveno/peaksea' 	
Plug 'nanotech/jellybeans.vim' 	
Plug 'ciaranm/inkpot'
Plug 'ciaranm/securemodelines' 	
Plug 'tkztmk/vim-vala'
Plug 'klen/python-mode'
call plug#end()

filetype plugin indent on

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

" Enable a large viminfo file
set viminfo='500,f1,:500,/500

" Create backups
set backup
if has('gui_gtk')
    set backupdir=$HOME/.backup/
    set directory=$HOME/.backup/
endif

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

" Tab complete menu
set wildignore+=*.o,*~,.lo
set suffixes+=.in,.a
set completeopt=longest,menuone

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

" Use secure modelines
set nomodeline
let g:secure_modelines_verbose=0
let g:secure_modelines_modelines=15

" Vala 
let vala_comment_strings=1
let vala_space_errors=1

" Python
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Set a dark background
set number
set background=dark
colorscheme peaksea
setlocal numberwidth=3
