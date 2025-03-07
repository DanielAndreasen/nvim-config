return {
    "numToStr/Comment.nvim" ,
    opts = {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        toggler = {
            line = '<C-b>'
        },
        opleader = {
            ---Line-comment keymap
            line = '<C-b>',
        },
        ---Enable keybindings
        mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
    },
}
