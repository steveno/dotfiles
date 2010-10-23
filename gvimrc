scriptencoding utf-8

"---------------------------------------------
" Vim settings file for Steven Oliver
"---------------------------------------------

" Set the default size
if has('gui_win32')
    set lines=35
    set columns=130
elseif has('gui_macvim')
    set lines=45
    set columns=145
endif 

" No menu or toolbar
set guioptions-=m
set guioptions-=T

" No scrollbars (left, bottom, right)
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=b

" Nice copy'n'paste
set guioptions+=a

" Set the font
if has('gui_win32')
    set guifont=Dina:h8:cDEFAULT
elseif has('gui_gtk')
    set guifont=Dina\ 8
elseif has('gui_macvim')
    " use default 
endif

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f " file name
    set titlestring+=%h%m%r%w " flags
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
endif

" MacVim GUI only options
if has('gui_macvim')
    " transparency
    set transp=1

    "full width full screen
    set fuopt+=maxhorz
endif

" 
if has('gui_win32')
    let g:shell_fullscreen_items="mT"
endif

" vim: set sw=4 sts=4 et tw=80 :

