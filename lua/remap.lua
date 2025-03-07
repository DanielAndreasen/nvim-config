local hush = { silent = true }
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

vim.keymap.set("n", "t", "o<ESC>k")
vim.keymap.set("n", "T", "O<ESC>j")

vim.keymap.set("n", "<leader>j", ":bnext<CR>", hush)
vim.keymap.set("n", "<leader>k", ":bprevious<CR>", hush)
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", hush)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move marked down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move marked up' })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader><space>", ":nohl<CR>", hush)

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = 'Replace under cursor' })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "<space>", ":fold<CR>", hush)
vim.keymap.set("n", "<space>", "zA", hush)
