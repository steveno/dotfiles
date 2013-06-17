scriptencoding utf-8

" Vim settings file for Steven Oliver
"---------------------------------------------

" General Settings {{{1
"---------------------------------------------

" Don't be compatible with vi
set nocompatible

" Load vundle to manage my plugins
if has("eval")
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Bundle 'gmarik/vundle'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'steveno/peaksea'
    Bundle 'ciaranm/securemodelines'

    " (Re)Enable filetype settings
    filetype on
    filetype plugin on
    filetype indent on
endif

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

" 1 height windows
set winminheight=1

" By default indent 8 spaces and makes tabs spaces
set shiftwidth=8
set expandtab

" Do clever indent things.
set autoindent
set smartindent

" Enable folds
if has("folding")
    set foldenable
    set foldmethod=marker
endif

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
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1

" falcon rainbow highlighting
let g:falcon_rainbow=0


" Setup plugins {{{1
"----------------------------------------------

" Use secure modelines
set nomodeline
let g:secure_modelines_verbose=0
let g:secure_modelines_modelines=15

" Snippets plugin
let snips_author = 'Steven Oliver'


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

" Enable syntax
if has("syntax")
    syntax on
endif

" Enable line numbers
set number

" If possible, try to use a narrow number column.
if v:version >= 700
    try
        setlocal numberwidth=3
    catch
    endtry
endif

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*                    " buffer number
set statusline+=%f                              " file name
set statusline+=%h%1*%m%r%w%0*                  " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},     " filetype
set statusline+=%{&encoding},                   " encoding
set statusline+=%{&fileformat}]                 " file format
set statusline+=%=                              " right align
set statusline+=%2*0x%-8B                       " current char
set statusline+=%-14.(%l,%c%V%)                 " offset


" Autocmds {{{1
"-----------------------------------------------------------------------

" This if..endif updates copyright headers on :q
if has("eval")
    fun! <SID>UpdateCopyrightHeaders()
        let l:a = 0
        for l:x in getline(1, 10)
            let l:a = l:a + 1
            if -1 != match(l:x, 'Copyright (c) [- 0-9,]*20\(0[456789]\|10\|11\|12\) Steven Oliver\|Copyright [- 0-9,]*20\(0[456789]\|10\|11\|12\) Steven Oliver')
                if input("Update copyright header? (y/N) ") == "y"
                    call setline(l:a, substitute(l:x, '\(20[01][456789]\|10\|11\|12\) Steven Ol',
                        \ '\1, 2013 Steven Ol', ""))
                endif
            endif
        endfor
    endfun
endif

if has("autocmd") && has("eval")
    " Always do a full syntax refresh
    autocmd BufEnter * syntax sync fromstart

    " Update the copyright header
    autocmd BufWritePre * call <SID>UpdateCopyrightHeaders()
    
    autocmd BufNewFile *.fal 0put ='# vim: set sw=4 sts=4 et tw=80 :' |
        \ 0put ='#!/usr/bin/falcon' | set sw=4 sts=4 et tw=80 |
        \ norm G
endif

" This will display each type of spelling highlight and explain which 
" is which. Only really useful for development of vim syntax scripts.
" Slightly modified version originally by Ingo Karkat <swdev@ingo-karkat.de>
function! SpellLegend()
   for [l:group, l:explanation] in [
   \   ['SpellBad', 'word not recognized'],
   \   ['SpellCap', 'word not capitalized'],
   \   ['SpellRare', 'rare word'],
   \   ['SpellLocal', 'wrong spelling for selected region']
   \]
       echo ''
       execute 'echohl' l:group
       echon l:group
       echohl None
       echon "\t" . l:explanation
   endfor
endfunction
command! -bar SpellLegend call SpellLegend()

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


" Mappings {{{1
"---------------------------------------------

" Make Space go down half a page
noremap <space> <C-d>

" Make Control+Space go up half a page
noremap <C-space> <C-u>

" Make Control+Left Arrow goto previous tab
noremap <C-Left> <Esc>:tabp<CR>

" Make Control+Right Arrow goto next tab
noremap<C-Right> <Esc>:tabn<CR>

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

