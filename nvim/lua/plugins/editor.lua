return {
    -- {
    --     "folke/twilight.nvim"
    -- },

    {
        "nvim-lualine/lualine.nvim",
        opts = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diagnostics'},
                lualine_c = { { 'filename', path = 1, } },
                lualine_x = {'encoding', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'searchcount'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {'trouble'}
        },
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    },

    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        lazy = true,
        keys = {
            { '<F6>', "<cmd>NoNeckPain<CR>", { desc = 'NoNeckPain' } },
        },
        opts = {
            width = 150,
            buffers = {
                -- backgroundColor = "onedark",
                -- blend = -0.1,
                scratchPad = {
                    enabled = true,
                    fileName = "notes",
                    location = "~/",
                },
                bo = {
                    filetype = "md",
                },
            },
        }
    }
}
