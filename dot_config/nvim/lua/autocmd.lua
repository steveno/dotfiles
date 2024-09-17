-- Any copyright is dedicated to the Public Domain.
-- https://creativecommons.org/publicdomain/zero/1.0/

-- Don't expand tabs for make files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'make',
    command = 'setlocal noexpandtab',
})

-- Setup skeleton file shell scripts
vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.sh',
    command = '0r ~/.config/nvim/templates/skeleton.sh',
})

-- Setup skeleton for python
vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.py',
    command = '0r ~/.config/nvim/templates/skeleton.py',
})

-- Setup skeleton for go
vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.go',
    command = '0r ~/.config/nvim/templates/skeleton.go',
})

-- For markdown files do the following
--  * Use par for formatting
--  * Set the textwidth at 80
--  * Set the colorcolumn at 81
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'markdown',
    command = 'set colorcolumn=81 formatprg=par tw=80',
})
