vim.g.mapleader = ","

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = ""

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.laststatus = 3

vim.opt.clipboard = "unnamedplus"

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.g.vimwiki_list = {{path = '~/Nextcloud/vimwiki'}}

vim.diagnostic.config {
    -- Diable inline diagnostic, which can be quite intrusive
    virtual_text = false,
    underline = false
}

-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldmethod = "expr"
