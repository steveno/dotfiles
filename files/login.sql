--Set the editor to gVim
define _editor = "C:\Program Files\Vim\vim73\gvim.exe"

--Reformat the prompt
set sqlprompt "_user'@'&_connect_identifier> "

--Format the output
set linesize 80
set trimspool on
set trimout on

--Inform me it worked
prompt **************
prompt Profile loaded
prompt **************

