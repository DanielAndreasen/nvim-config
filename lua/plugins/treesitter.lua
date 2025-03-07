return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "diff",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "vim",
                "vimdoc",
                "yaml"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["it"] = "@comment.inner",
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v',
                        ['@function.outer'] = 'V',
                        ['@class.outer'] = 'V',
                    }
                },
                lsp_interop = {
                    enable = true,
                    border = 'single',
                    peek_definition_code = {
                        ['<leader>df'] = "@function.outer",
                        ['<leader>dc'] = "@class.outer"
                    }
                }
            }
        })

    end
}
