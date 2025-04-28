return {
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { '<leader>p', "<cmd>Telescope find_files<CR>", { desc = 'Find files' } },
            { '<leader>s', "<cmd>Telescope live_grep<CR>", { desc = 'Live grep' } },
            { '<leader>d', "<cmd>Telescope grep_string<CR>", { desc = 'Grep under cursor' } },
        },
        opts = {
            defaults = {
                layout_strategy = "vertical",
                layout_config = { prompt_position = "bottom" },

                prompt_prefix = "  ",
                selection_caret = " ",
                path_display = { "smart" },

                mappings = {
                    i = {
                        ["<C-n>"] = function (...) return require("telescope.actions").cycle_history_next(...) end,
                        ["<C-p>"] = function (...) return require("telescope.actions").cycle_history_prev(...) end,

                        ["<C-j>"] = function (...) return require("telescope.actions").move_selection_next(...) end,
                        ["<C-k>"] = function (...) return require("telescope.actions").move_selection_previous(...) end,

                        ["<C-c>"] = function (...) return require("telescope.actions").close(...) end,

                        ["<Down>"] = function (...) return require("telescope.actions").move_selection_next(...) end,
                        ["<Up>"] = function (...) return require("telescope.actions").move_selection_previous(...) end,

                        ["<CR>"] = function (...) return require("telescope.actions").select_default(...) end,
                        ["<C-x>"] = function (...) return require("telescope.actions").select_horizontal(...) end,
                        ["<C-v>"] = function (...) return require("telescope.actions").select_vertical(...) end,
                        ["<C-t>"] = function (...) return require("telescope.actions").select_tab(...) end,

                        ["<C-u>"] = function (...) return require("telescope.actions").preview_scrolling_up(...) end,
                        ["<C-d>"] = function (...) return require("telescope.actions").preview_scrolling_down(...) end,

                        ["<PageUp>"] = function (...) return require("telescope.actions").results_scrolling_up(...) end,
                        ["<PageDown>"] = function (...) return require("telescope.actions").results_scrolling_down(...) end,

                        ["<Tab>"] = function (...) return require("telescope.actions").toggle_selection(...) + require("telescope.actions").move_selection_worse(...) end,
                        ["<S-Tab>"] = function (...) return require("telescope.actions").toggle_selection(...) + require("telescope.actions").move_selection_better(...) end,
                        ["<C-q>"] = function (...) return require("telescope.actions").send_to_qflist(...) + require("telescope.actions").open_qflist(...) end,
                        ["<M-q>"] = function (...) return require("telescope.actions").send_selected_to_qflist(...) + require("telescope.actions").open_qflist(...) end,
                        ["<C-l>"] = function (...) return require("telescope.actions").complete_tag(...) end,
                        ["<C-h>"] = function (...) return require("telescope.actions").which_key(...) end,
                    },

                    n = {
                        ["<esc>"] = function (...) return require("telescope.actions").close(...) end,
                        ["<CR>"] = function (...) return require("telescope.actions").select_default(...) end,
                        ["<C-x>"] = function (...) return require("telescope.actions").select_horizontal(...) end,
                        ["<C-v>"] = function (...) return require("telescope.actions").select_vertical(...) end,
                        ["<C-t>"] = function (...) return require("telescope.actions").select_tab(...) end,

                        ["<Tab>"] = function (...) return require("telescope.actions").toggle_selection(...) + require("telescope.actions").move_selection_worse(...) end,
                        ["<S-Tab>"] = function (...) return require("telescope.actions").toggle_selection(...) + require("telescope.actions").move_selection_better(...) end,
                        ["<C-q>"] = function (...) return require("telescope.actions").send_to_qflist(...) + require("telescope.actions").open_qflist(...) end,
                        ["<M-q>"] = function (...) return require("telescope.actions").send_selected_to_qflist(...) + require("telescope.actions").open_qflist(...) end,

                        ["j"] = function (...) return require("telescope.actions").move_selection_next(...) end,
                        ["k"] = function (...) return require("telescope.actions").move_selection_previous(...) end,
                        ["H"] = function (...) return require("telescope.actions").move_to_top(...) end,
                        ["M"] = function (...) return require("telescope.actions").move_to_middle(...) end,
                        ["L"] = function (...) return require("telescope.actions").move_to_bottom(...) end,

                        ["<Down>"] = function (...) return require("telescope.actions").move_selection_next(...) end,
                        ["<Up>"] = function (...) return require("telescope.actions").move_selection_previous(...) end,
                        ["gg"] = function (...) return require("telescope.actions").move_to_top(...) end,
                        ["G"] = function (...) return require("telescope.actions").move_to_bottom(...) end,

                        ["<C-u>"] = function (...) return require("telescope.actions").preview_scrolling_up(...) end,
                        ["<C-d>"] = function (...) return require("telescope.actions").preview_scrolling_down(...) end,

                        ["<PageUp>"] = function (...) return require("telescope.actions").results_scrolling_up(...) end,
                        ["<PageDown>"] = function (...) return require("telescope.actions").results_scrolling_down(...) end,

                        ["?"] = function (...) return require("telescope.actions").which_key(...) end,
                    },
                },

            },
        }
    },
}
