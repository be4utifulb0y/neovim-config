treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = {"cpp","cmake","markdown"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		clear_on_cursor_move = true,
	},
	fold = {
		enable = true,
	},
    refactor = {
      highlight_current_scope = {
        enable = false,  -- 启用高亮当前作用域
      },
    },

})
require'treesitter-context'.setup{
    enable = true, -- 启用插件
    throttle = true, -- 优化性能
    max_lines = 1, -- 显示上下文的最大行数（0表示不限制）
}


