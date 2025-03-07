return {
    {
        "kdheepak/lazygit.nvim",
        keys = {
            { "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" } },
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- {
    --     "pwntester/octo.nvim",
    --     keys = {
    --         { "<leader>gl", "<cmd>Octo issue list<CR>", { desc = "GH list issues" } },
    --         { "<leader>gc", "<cmd>Octo comment add<CR>", { desc = "GH add comment to issue" } },
    --         { "<leader>ga", "<cmd>Octo actions<CR>", { desc = "GH list all available actions" } },
    --     },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function ()
    --         require("octo").setup()
    --     end
    -- }
}
