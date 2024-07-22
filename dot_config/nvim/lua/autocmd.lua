-- Any copyright is dedicated to the Public Domain.
-- https://creativecommons.org/publicdomain/zero/1.0/

-- Don't expand tabs for make files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'make',
    command = 'setlocal noexpandtab',
})

vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.sh',
    command = '0r ~/.config/nvim/templates/skeleton.sh',
})

vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
    pattern = '*.py',
    command = '0r ~/.config/nvim/templates/skeleton.py',
})
