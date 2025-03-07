return {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    keys = {
        { "<leader>re", "<cmd>Refactor extract ", { desc = "Extract" } },
        { "<leader>rf", "<cmd>Refactor extract_to_file ", { desc = "Extract to file" } },
    },
    config = function()
        require("refactoring").setup({
            prompt_func_return_type = {
                python = true,
            },
            prompt_func_param_type = {
                python = true,
            },
        })
    end,
}
