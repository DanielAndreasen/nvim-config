return {
    -- "olimorris/codecompanion.nvim",
    -- dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     "stevearc/dressing.nvim",
    --     "MunifTanjim/nui.nvim",
    --     "nvim-tree/nvim-web-devicons",
    --     -- The following are optional:
    --     { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    -- },
    -- config = function()
    --     require("codecompanion").setup({
    --         strategies = {
    --             chat = {
    --                 adapter = "openai",
    --             },
    --             inline = {
    --                 adapter = "openai",
    --             },
    --         },
    --         opts = {
    --             stream = true,
    --         },
    --         adapters = {
    --             openai = function()
    --                 return require("codecompanion.adapters").extend("openai_compatible", {
    --                     name = "codestral",
    --                     env = {
    --                         url = "https://api.mistral.ai",
    --                         api_key = "CODESTRAL_API_KEY",
    --                         chat_url = "/v1/chat/completions"
    --                     },
    --                     handlers = {
    --                         form_parameters = function(self, params, messages)
    --                             -- codestral doesn't support these in the body
    --                             params.stream_options = nil
    --                             params.options = nil
    --                             return params
    --                         end,
    --                     },
    --                     schema = {
    --                         model = {
    --                             default = "codestral-latest",
    --                         },
    --                         temperature = {
    --                             default = 0.2,
    --                             mapping = "parameters", -- not supported in default parameters.options
    --                         },
    --                     },
    --                 })
    --             end,
    --         },
    --     })
    -- end
}
