lualine = require("lualine")
lualine.setup({
  options = {
    theme = "tokyonight",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    -- section_separators = { left = " ", right = "" },
	disabled_filetypes = {
      statusline = {'NvimTree'},
    },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_a = {
		'mode',	
	},
	lualine_b = {
		'branch','diff',
	},
	--lualine_c = {
	--{
	--	"filename",
	--	shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
	--	path = 2,
    --}	
	--},
	lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      "encoding",
      "filetype",
    }
  },
})
