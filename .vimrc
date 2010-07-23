scriptencoding utf-8

"---------------------------------------------
" Vim settings file for Steven Oliver
"---------------------------------------------

"---------------------------------------------
" General Settings
"---------------------------------------------

" Don't be compatible with vi
set nocompatible

" Set spelling language
setlocal spell spelllang=en_us

" Enable a large viminfo file
set viminfo='500,f1,:500,/500
set history=200

" Make backspace delete lots of things
set backspace=indent,eol,start

" Create backups
set backup
if has('gui_win32')
    set backupdir=$HOME\backup\
    set directory=$HOME\backup\
elseif has('gui_macvim') 
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

" By default, go for an indent of 4
" and makes tabs spaces
set shiftwidth=4
set expandtab

" Do clever indent things. Don't make a #
" force column zero.
set autoindent
set smartindent

" Enable filetype settings
if has("eval")
    filetype on
    filetype plugin on
    filetype indent on
endif

" Use secure modelines
set nomodeline
let g:secure_modelines_verbose=0
let g:secure_modelines_modelines=15

" Turn off highlighting
set nohls!

" Enable folds
if has("folding")
    set foldenable
    set foldmethod=indent
endif

" Show us the command we're typing
set showcmd

" Highlight matching parens
set showmatch


"----------------------------------------------
" Visual Settings
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

    if has('gui_gtk') || has('gui_win32') || has('gui_macvim')
        call LoadColorScheme("peaksea:moria:ir_black:inkpot:darkblue")
    else
        call LoadColorScheme("blue:pablo:darkblue")
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

" Change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine    gui=reverse
  au InsertLeave * hi StatusLine    gui=NONE
endif

"-----------------------------------------------------------------------
" autocmds
"-----------------------------------------------------------------------

" Always do a full syntax refresh
autocmd BufEnter * syntax sync fromstart

" This if..endif updates copyright headers on :q
if has("eval")
    fun! <SID>UpdateCopyrightHeaders()
        let l:a = 0
        for l:x in getline(1, 10)
            let l:a = l:a + 1
            if -1 != match(l:x, 'Copyright (c) [- 0-9,]*200[567] Steven Oliver')
                if input("Update copyright header? (y/N) ") == "y"
                    call setline(l:a, substitute(l:x, '\(200[567]\) Steven',
                                \ '\1, 2008 Steven', ""))
                endif
            endif
        endfor
    endfun

    " GNU format changelog entry
    fun! MakeChangeLogEntry()
        norm gg
        /^\d
        norm 2O
        norm k
        call setline(line("."), strftime("%Y-%m-%d") .
                    \ " Steven Oliver <oliver.steven@gmail.com>")
        norm 2o
        call setline(line("."), "\t* ")
        norm $
        r! svn status | grep -v '^?' | sed -e 's,^D, -,' | cut -d\ -f2- |
                    \ sort | sed -e 's,^\s*\(\([+-]\)\s*\)\?\(\S*\)\s*$,\2\3\,,' -e 's, \+, ,g'
                    \ -e '$s~,$~:~' | fmt -w2000
        norm kJ
        star!
    endfun
    noremap <Leader>cl :call MakeChangeLogEntry()<CR>

    autocmd BufWritePre * call <SID>UpdateCopyrightHeaders()
endif


"---------------------------------------------
" mappings
"---------------------------------------------

" Make Space go down half a page
noremap <space> <C-d>

" Make Control+Space go up half a page
noremap <C-space> <C-u>

" Make Control+Left Arrow goto previous tab
noremap <C-Left> <Esc>:tabp<CR>

" Make Control+Right Arrow goto next tab
noremap<C-Right> <Esc>:tabn<CR>

" q: sucks
nmap q: :q

" In normal mode, jj escapes
inoremap jj <Esc>

" Reformat everything
noremap <Leader>gq gggqG

" Make F3 compile
map <F3> : call CompileGcc()<CR>
func! CompileGcc()
    exec "w"
    exec "!gcc % -o %<"
endfunc

" Make F4 compile and run
map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    if has('gui_win32')
        exec "! %<.exe"
    else
        exec "! ./%<"
    endif
endfunc


"---------------------------------------------
" abbreviations
"---------------------------------------------

if has("eval") && has("autocmd")
    fun! <SID>abbrev_cpp()
        iabbrev <buffer> jci const_iterator
        iabbrev <buffer> jcl class
        iabbrev <buffer> jco constant
        iabbrev <buffer> jit iterator
        iabbrev <buffer> jns namespace
        iabbrev <buffer> jpr protected
        iabbrev <buffer> jpu public
        iabbrev <buffer> jpv private
        iabbrev <buffer> jss std::string
        iabbrev <buffer> jsv std::vector
        iabbrev <buffer> jty typedef
        iabbrev <buffer> jun using namespace
    endfun

    augroup abbreviations
        autocmd!
        autocmd FileType cpp :call <SID>abbrev_cpp()
    augroup END

    " Work out include guard text
    fun! IncludeGuardText()
        let l:p = substitute(substitute(getcwd(), "/trunk", "", ""), '^.*/', "", "")
        let l:t = substitute(expand("%"), "[./]", "_", "g")
        return toupper(l:p . "_GUARD_" . l:t)
    endfun
endif


"---------------------------------------------
" final commands
"---------------------------------------------

" turn off any existing search
if has("autocmd")
    au VimEnter * nohls
endif

"---------------------------------------------
" vim: set sw=4 sts=4 et tw=80 :
"
