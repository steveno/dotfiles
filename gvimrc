scriptencoding utf-8

"---------------------------------------------
" G/Vim settings file for Steven Oliver
"---------------------------------------------

" Set the default size
if has('gui_win32')
    set lines=35
    set columns=130
elseif has('gui_macvim')
    set lines=45
    set columns=145
elseif has('gui_gtk')
    set lines=42
    set columns=150
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
if has("eval")
    fun! SetFont(fonts)
        let l:fonts = a:fonts . ","
        while l:fonts != ""
            let l:font = strpart(l:fonts, 0, stridx(l:fonts, ","))
            let l:fonts = strpart(l:fonts, stridx(l:fonts, ",") + 1)
            try
                execute "set guifont=" . l:font
                break
            catch
            endtry
        endwhile
    endfun

    if has('gui_win32')
        call SetFont("Consolas:h9:cANSI,Courier_New:h9:cANSI")
    elseif has('gui_gtk')
        call SetFont("Monospace\ 9")
    elseif has('gui_macvim')
        "use default
    else
        " use default
    endif
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

    " full width full screen
    set fuopt+=maxhorz
endif

" Vim Shell settings 
if has('gui_win32')
    let g:shell_fullscreen_items="mT"
endif

" vim: set sw=4 sts=4 et tw=80 :

