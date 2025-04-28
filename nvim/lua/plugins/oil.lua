return {
    "stevearc/oil.nvim",
    keys = {
        { "-", "<cmd>Oil<CR>", { desc = "Open parent directory" } },
        { "<leader>-", "<cmd>Oil oil-ssh://genomedk/<CR>", { desc = "Open GDK home" } },
    },
    config = function()
        local configs = require("oil")

        configs.setup({})
    end,
}
