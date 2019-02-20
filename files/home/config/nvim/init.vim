" Managed by salt

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'steveno/peaksea' 	
Plug 'ciaranm/securemodelines'
Plug 'steveno/vim-vala'
Plug 'steveno/meson-vim'
Plug 'zig-lang/zig.vim'
Plug 'saltstack/salt-vim'
call plug#end()

filetype plugin indent on

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

" Create backups
set backup
set backupdir=$HOME/.config/nvim/backups/
set directory=$HOME/.config/nvim/backups/

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

" Set a dark background
set number
set background=dark
colorscheme peaksea
setlocal numberwidth=3

if has("eval")
    fun! <SID>UpdateCopyrightHeaders()
        let l:a = 0
        for l:x in getline(1, 10)
            let l:a = l:a + 1
            if -1 != match(l:x, 'Copyright [- 0-9,]*20\(0[456789]\|1[34567]\) Steven Oliver')
                if input("Update copyright header? (y/n) ") == "y"
                    call setline(l:a, substitute(l:x, '\(20[01][34567]\) Steven',
                                \ '2018 Steven', ""))
                endif
            endif
        endfor
    endfun
endif

" update copyright headers
autocmd BufWritePre * call <SID>UpdateCopyrightHeaders()

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" D
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Error format
autocmd FileType d set efm=%*[^@]@%f\(%l\):\ %m,%f\(%l\\,%c\):\ %m,%f\(%l\):\ %m

" Run unit tests on current file
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python3
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vala 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vala_comment_strings=1
let vala_space_errors=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.scm setl ft=lisp ts=2 et sw=2
