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
beautiful.init(home .. "/.config/awesome/zenburn.lua")

