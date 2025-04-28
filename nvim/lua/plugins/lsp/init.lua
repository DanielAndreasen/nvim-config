return {

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')

            cmp.setup({
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                sources = {
                    {name = 'nvim_lsp', keyword_length = 1, priority = 9},
                    {name = "codeium", priority = 8},
                    {name = 'buffer', keyword_length = 1, priority = 6},
                    {name = 'path', keyword_length = 1, priority = 5},
                    {name = 'nvim_lua', keyword_length = 1, priority = 4},
                    {name = 'luasnip', keyword_length = 1, priority = 7},
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping(function (fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ['<S-Tab>'] = cmp.mapping(function (fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                }
            })
        end
    },

    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            -- Autocompletion
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_flaot() end, opts)
                vim.keymap.set("n", "gn", function() vim.diagnostic.jump({count=1, float=true}) end, opts)
                vim.keymap.set("n", "gp", function() vim.diagnostic.jump({count=-1, float=true}) end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "gri", function() vim.lsp.buf.implementation() end, opts)
                vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>vh", function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'biome',
                    'html',
                    'htmx',
                    'lua_ls',
                    'basedpyright',
                    'texlab',
                    'ruff',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    html = function ()
                        -- Add htmldjango as detected language
                        local opts = {
                            filetypes = { "html", "htmldjango" }
                        }
                        require('lspconfig').html.setup(opts)
                    end,
                    htmx = function ()
                        local opts = {
                            filetypes = { "html", "htmldjango" }
                        }
                        require("lspconfig").htmx.setup(opts)
                    end,
                    basedpyright = require("lspconfig").basedpyright.setup {
                        settings = {
                            basedpyright = {
                                analysis = {
                                    diagnosticMode = "openFilesOnly",
                                    inlayHints = {
                                        callArgumentNames = true
                                    },
                                    diagnosticSeverityOverrides = {
                                        reportAny = false,
                                        reportUnknownArgumentType = false,
                                        reportUnknownLambdaType = false,
                                        reportUnknownMemberType = false,
                                        reportUnknownParameterType = false,
                                        reportUnknownVariableType = false,
                                        reportMissingTypeStubs = false,
                                        reportInvalidCast = false,
                                        reportUntypedFunctionDecorator = false,
                                    }
                                }
                            }
                        }
                    }
                }
            })
        end
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require('lint')

            -- local mypy = lint.linters.mypy
            -- mypy.args = {
            --     '--show-column-numbers',
            --     '--hide-error-codes',
            --     '--hide-error-context',
            --     '--no-color-output',
            --     '--no-error-summary',
            --     '--no-pretty',
            --     '--ignore-missing-imports',
            --     '--disallow-untyped-defs'
            -- }
            --
            -- lint.linters_by_ft = {
            --     python = { 'mypy', }
            -- }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    -- Formatting
    {
        "mhartington/formatter.nvim",
        lazy = false,
        config = function ()
            require("formatter").setup {
                filetype = {

                    python = {
                        -- Use Ruff for linting and autofix
                        function()
                            return {
                                exe = "ruff",
                                args = {
                                    "check",
                                    "--select",
                                    "I",
                                    "--fix",
                                    "--quiet",
                                    "--stdin-filename",
                                    vim.api.nvim_buf_get_name(0),
                                },
                                stdin = true,
                            }
                        end,
                        function()
                            return {
                                exe = "ruff",
                                args = {
                                    "format",
                                    "--quiet",
                                    "--stdin-filename",
                                    vim.api.nvim_buf_get_name(0),
                                },
                                stdin = true,
                            }
                        end,

                    },

                    sql = {
                        function()
                            return {
                                exe = "sql-formatter",
                                args = {
                                    "--fix",
                                    "--l postgresql",
                                    "--",
                                },
                                stdin = false,
                            }
                        end,
                    },

                    sh = {
                        require("formatter.filetypes.sh").shfmt,
                    },

                    -- Use the special "*" filetype for defining formatter configurations on any filetype
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                }
            }
        end,
        opts = {
            logging = true,
            log_level = vim.log.levels.WARN,
        }
    },

    -- Extra
    {
        "folke/trouble.nvim",
        lazy = true,
        keys = {
            { '<F5>', "<cmd>Trouble diagnostics toggle<CR>", { desc = 'TroubleToggle' } },
        },
        opts = {
            {
                position = "bottom", -- position of the list can be: bottom, top, left, right
                height = 10, -- height of the trouble list when position is top or bottom
                width = 50, -- width of the list when position is left or right
                icons = true, -- use devicons for filenames
                mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
                fold_open = "", -- icon used for open folds
                fold_closed = "", -- icon used for closed folds
                group = true, -- group results by file
                padding = true, -- add an extra new line on top of the list
                cycle_results = false, -- cycle item list when reaching beginning or end of list
                action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example:
                    -- close = {},
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
                    open_split = { "<c-x>" }, -- open buffer in new split
                    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                    open_tab = { "<c-t>" }, -- open buffer in new tab
                    jump_close = {"o"}, -- jump to the diagnostic and close the list
                    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                    switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
                    toggle_preview = "P", -- toggle auto_preview
                    hover = "K", -- opens a small popup with the full multiline message
                    preview = "p", -- preview the diagnostic location
                    open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
                    close_folds = {"zM", "zm"}, -- close all folds
                    open_folds = {"zR", "zr"}, -- open all folds
                    toggle_fold = {"zA", "za", "<space>"}, -- toggle fold of current file
                    previous = "k", -- previous item
                    next = "j", -- next item
                    help = "?"  -- help menu
                },
                multiline = true, -- render multi-line messages
                indent_lines = true, -- add an indent guide below the fold icons
                win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = false, -- automatically close the list when you have no diagnostics
                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                auto_fold = false, -- automatically fold a file trouble list at creation
                auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
                include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions"  }, -- for the given modes, include the declaration of the current symbol in the results
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "",
                },
                use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
            }
        }

    },
}
