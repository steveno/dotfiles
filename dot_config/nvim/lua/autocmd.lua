-- Any copyright is dedicated to the Public Domain.
-- https://creativecommons.org/publicdomain/zero/1.0/

-- Don't expand tabs for make files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'make',
    command = 'setlocal noexpandtab',
})

