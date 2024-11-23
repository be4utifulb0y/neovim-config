local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "vue" }, -- 只格式化这几种文件类型
      extra_args = { "--tab-width", "4", "--use-tabs", "false" }  -- 设置缩进为4个空格
    }),
  },
})

