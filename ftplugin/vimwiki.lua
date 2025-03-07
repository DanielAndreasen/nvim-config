vim.opt_local.wrap = true
vim.api.nvim_command("autocmd FileType vimwiki lua require('cmp').setup { enabled = false }")
