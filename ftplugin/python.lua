local hush = { silent = true }

vim.keymap.set("i", "<leader>br", '__import__("ipdb").set_trace()', hush)
