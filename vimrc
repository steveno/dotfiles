scriptencoding utf-8

" Vim settings file for Steven Oliver
"---------------------------------------------

" General Settings {{{1
"---------------------------------------------

set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'steveno/peaksea' 	
Plugin 'nanotech/jellybeans.vim' 	
Plugin 'ciaranm/securemodelines' 	
Plugin 'tkztmk/vim-vala'

call vundle#end()
filetype plugin indent on

set laststatus=2
let g:bufferline_echo = 0
set noshowmode

" Enable a large viminfo file
set viminfo='500,f1,:500,/500
set history=200

" Make backspace delete lots of things
set backspace=indent,eol,start

" Create backups
set backup
if has('gui_win32') || has('gui_win64')
    set backupdir=$HOME\backup\
    set directory=$HOME\backup\
elseif has('gui_macvim') || has('gui_gtk')
    set backupdir=$HOME/.backup/
    set directory=$HOME/.backup/
endif

" Search options: incremental search, highlight search
set hlsearch
set incsearch

" Show full tags when doing search completion
set showfulltag

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
set wildmenu
set wildignore+=*.o,*~,.lo
set suffixes+=.in,.a
set completeopt=longest,menuone

" Print with syntax highlighting and line numbers
set popt+=syntax:y,number:y

" Allow edit buffers to be hidden
set hidden

" By default indent 8 spaces and makes tabs spaces
set shiftwidth=8
set expandtab

" Do clever indent things.
set autoindent
set smartindent

" Turn off highlighting
set nohls!

" Disable line wrapping
set nowrap

" Show us the command we're typing
set showcmd

" Highlight matching parens
set showmatch


" Individual language options {{{1
"----------------------------------------------

" Enable comment strings
let vala_comment_strings=1

" Highlight space errors
let vala_space_errors=1

" falcon rainbow highlighting
let g:falcon_rainbow=0


" Setup plugins {{{1
"----------------------------------------------

" Use secure modelines
set nomodeline
let g:secure_modelines_verbose=0
let g:secure_modelines_modelines=15


" Visual Settings {{{1
"----------------------------------------------

" Set a dark background
set background=dark

" Load colorscheme
if has("eval")
    fun! LoadColorScheme(schemes)
        let l:schemes = a:schemes . ":"
        while l:schemes != ""
            let l:scheme = strpart(l:schemes, 0, stridx(l:schemes, ":"))
            let l:schemes = strpart(l:schemes, stridx(l:schemes, ":") + 1)
            try
                exec "colorscheme" l:scheme
                break
            catch
            endtry
        endwhile
    endfun

    let s:prefered_scheme = "peaksea"
    let s:other = ":inkpot:moria:ir_black"
    let s:default = ":desert:pablo:slate"

    if has('gui_running')
        call LoadColorScheme(s:prefered_scheme . s:other . s:default)
    elseif &t_Co >= 88
        call LoadColorScheme(s:prefered_scheme . s:other . s:default)
    else
        call LoadColorScheme(s:default)
    endif
endif  

" Enable line numbers
set number

" If possible, try to use a narrow number column.
setlocal numberwidth=3

" Autocmds {{{1
"-----------------------------------------------------------------------

if has("autocmd") && has("eval")
    " Always do a full syntax refresh
    autocmd BufEnter * syntax sync fromstart
endif

" Mappings {{{1
"---------------------------------------------

" Make Space go down half a page
noremap <space> <C-d>

" Make Control+Space go up half a page
noremap <C-space> <C-u>

" In normal mode, jj escapes
inoremap jj <Esc>


" Abbreviations {{{1
"---------------------------------------------

if has("eval") && has("autocmd")
    fun! <SID>abbrev_cpp()
        iabbrev <buffer> jcl class
        iabbrev <buffer> jco constant
        iabbrev <buffer> jns namespace
        iabbrev <buffer> jpr protected
        iabbrev <buffer> jpu public
        iabbrev <buffer> jpv private
        iabbrev <buffer> jss std::string
        iabbrev <buffer> jsv std::vector
        iabbrev <buffer> jty typedef
        iabbrev <buffer> jun using namespace
    endfun
endif


" Final commands {{{1
"---------------------------------------------

" turn off any existing search
if has("autocmd")
    au VimEnter * nohls
endif

" }}}1

" vim: set sw=4 sts=4 et tw=80 :
