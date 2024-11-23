local cmp = require'cmp'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
--require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require'luasnip'
cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
  mapping = {
	['<C-k>'] = cmp.mapping.select_prev_item(),  -- 上箭头选择前一个选项
	['<C-j>'] = cmp.mapping.select_next_item(),  -- 下箭头选择下一个选项
	['<C-e>'] = cmp.mapping.abort(),  -- Ctrl + e 取消补全
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s", "c" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  },
  sources = cmp.config.sources({
	{ name = 'lua_snip'},
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- 为 `/` 和 `:` 命令行模式配置补全
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'path' },
        { name = 'cmdline' }
    },
    mapping = cmp.mapping.preset.cmdline({
		['<C-k>'] = {c = cmp.mapping.select_prev_item()},  -- 上箭头选择前一个选项
		['<C-j>'] = {c = cmp.mapping.select_next_item()},  -- 上箭头选择前一个选项
		['<Tab>'] = { c = cmp.mapping.confirm({ select = true })}
    }),
})
