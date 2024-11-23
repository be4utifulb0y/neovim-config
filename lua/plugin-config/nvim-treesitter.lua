treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = {"cpp","cmake","markdown"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	fold = {
		enable = true,
	}
})
