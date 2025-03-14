require("ibl").setup()
local highlight = {
    "RainbowRed",
    "RainbowViolet",
    "RainbowGreen",
    "RainbowBlue",
    "RainbowYellow",
    "RainbowOrange",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#B1F0F7" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#F6D6D6" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A1EEBD" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#F5F0CD" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#81BFDA" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FADA7A" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
