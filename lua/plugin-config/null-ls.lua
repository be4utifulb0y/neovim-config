local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "vue" }, -- 只格式化这几种文件类型
      extra_args = { "--tab-width", "4", "--use-tabs", "false" }  -- 设置缩进为4个空格
    }),
  },
})

require("prettier").setup({
  bin = 'prettier', -- 或 'prettierd'
  filetypes = { "css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss", "typescript", "typescriptreact", "yaml" },
  extra_args = { "--tab-width", "4", "--use-tabs", "false" }  -- 设置缩进为4个空格
})
-- 自动保存时格式化
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

