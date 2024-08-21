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

-- Use par to format markdown at 80 chars
vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.md',
    command = 'set formatprg=par tw=80',
})
