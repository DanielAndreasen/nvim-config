return {
    -- "Davidyz/coredumpy.nvim",
    -- cmd = { "Coredumpy" },
    -- opts = {
    --     python = "python",
    -- },
    -- dependencies = {
    --     "mfussenegger/nvim-dap",
    --     "rcarriga/nvim-dap-ui",
    --     "mfussenegger/nvim-dap-python",
    --     "nvim-neotest/nvim-nio"
    -- },
    -- config = function ()
    --     local dap = require("dap")
    --     local dapui = require("dapui")
    --
    --     dapui.setup()
    --     require('dap-python').setup('python')
    --     dap.listeners.before.attach.dapui_config = function()
    --         dapui.open()
    --     end
    --     dap.listeners.before.launch.dapui_config = function()
    --         dapui.open()
    --     end
    --     dap.listeners.before.event_terminated.dapui_config = function()
    --         dapui.close()
    --     end
    --     dap.listeners.before.event_exited.dapui_config = function()
    --         dapui.close()
    --     end
    --
    --     vim.keymap.set("n", "<leader>br", dap.toggle_breakpoint, {})
    --     vim.keymap.set("n", "<leader>bc", dap.continue, {})
    --     vim.keymap.set("n", "<leader>bs", dap.step_into, {})
    -- end
}
