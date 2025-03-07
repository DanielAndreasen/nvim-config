function ColorMyPencils(color)
	color = color or "rose-pine-main"
	vim.cmd.colorscheme(color)
end

-- ColorMyPencils('terafox')
-- ColorMyPencils('nightfox')
-- ColorMyPencils('carbonfox')
-- ColorMyPencils('kanagawa-wave')
ColorMyPencils('kanagawa-dragon')
-- ColorMyPencils('deus')
-- ColorMyPencils('dark_flat')
-- ColorMyPencils('rose-pine-moon')
-- ColorMyPencils('rose-pine-main')
-- ColorMyPencils('melange')
-- ColorMyPencils('falcon')
-- ColorMyPencils('everforest')
-- ColorMyPencils('oldworld')

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#361c1c' })
