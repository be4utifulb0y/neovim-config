require('plugins')
-- 基础设置
require('basic')
require('plugin-config.blankline')
-- 插件管理
require('colorscheme')
require('keybindings')
require('plugin-config.lualine')
require('plugin-config.bufferline')
require('plugin-config.nvim-tree')
require('plugin-config.nvim-treesitter')
require('plugin-config.telescope')
require('plugin-config.cmake-tools')
require('plugin-config.cmp')
require('plugin-config.lsp')
--require('plugin-config.null-ls')
require('plugin-config.neogit')
require("plugin-config.toggleterm")
require("plugin-config.yankhighlight")
require("plugin-config.project")
require("plugin-config.dressing")
require('plugin-config.trouble')
require('nvim-autopairs').setup({})
--require('plugin-config/venv-selector')
--require("cinnamon").setup {
--    -- Enable all provided keymaps
--    keymaps = {
--        basic = true,
--        --extra = true,
--    },
--    -- Only scroll the window
--    options = { mode = "cursor" },
--}
local cinnamon = require("cinnamon")

cinnamon.setup({

    step_size = {
        -- Number of cursor/window lines moved per step
        vertical = 1,
        -- Number of cursor/window columns moved per step
        horizontal = 1,
    },
})

-- Centered scrolling:
vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)
--vim.keymap.set("n", "j", function() cinnamon.scroll("j") end)
--vim.keymap.set("n", "k", function() cinnamon.scroll("k") end)
--vim.keymap.set("n", "l", function() cinnamon.scroll("l") end)
--vim.keymap.set("n", "h", function() cinnamon.scroll("h") end)
--vim.keymap.set("n", "w", function() cinnamon.scroll("w") end)
--vim.keymap.set("n", "e", function() cinnamon.scroll("e") end)
--vim.keymap.set("n", "b", function() cinnamon.scroll("b") end)
require 'colorizer'.setup()
-- 插件配置
