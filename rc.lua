-- {{{ License
--
-- Steven Oliver's awesome configuration file
--
-- }}}

-- {{{ Libraries
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- }}}

-- Beautiful theme
beautiful.init("/home/users/steveno/.config/awesome/zenburn.lua")

-- This is used later as the default terminal and editor to run.
terminal = "xterm"
editor = "gvim"
editor_cmd = editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"