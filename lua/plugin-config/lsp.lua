require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
require'lspconfig'.clangd.setup{
	cmd = {
		"clangd", 
		"--background-index",
        "-j=12",
        "--all-scopes-completion",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--cross-file-rename",
        "--fallback-style=WebKit",
        "--pretty",
		"--completion-style=detailed",
        "--clang-tidy",
		"--query-driver=D:\\Application\\Clion\\CLion 2023.3.4\\bin\\mingw\\bin\\g++.exe",
        "--compile-commands-dir=" .. vim.loop.cwd() .. "/build"
	},
	--"--completion-style=detailed",
	capabilities = require('cmp_nvim_lsp').default_capabilities()
}
require('lspconfig').vuels.setup({
  filetypes = { 'vue' },
  init_options = {
    config = {
      vetur = {
        useWorkspaceDependencies = true,
        validation = {
          template = true,
          style = true,
          script = true
        },
        format = {
          enable = true,
          options = {
            tabSize = 2,
            useTabs = false
          }
        }
      }
    },
  }
})
require'lspconfig'.pyright.setup {
    settings = {
        python = {
            pythonPath = vim.fn.system("conda info --base"):gsub("\n", "") .. "/envs/flask/python.exe"
        }
    },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
}
--require'lspconfig'.volar.setup{
--	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
--	capabilities = require('cmp_nvim_lsp').default_capabilities(),
--    init_options = {
--        typescript = {
--            serverPath = vim.fn.exepath("typescript-language-server")
--        },
--    },
--}
-- 配置 tsserver，用于处理 JavaScript 和 TypeScript 文件
require'lspconfig'.ts_ls.setup{
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
}

--require("prettier").setup({
--  bin = 'prettier', -- 或 'prettierd'
--  filetypes = { "css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss", "typescript", "typescriptreact", "yaml" },
--  extra_args = { "--tab-width", "4", "--use-tabs", "false" }  -- 设置缩进为4个空格
--})
---- 自动保存时格式化
--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
require'lspconfig'.glsl_analyzer.setup{
}
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.glsl", "*.vert", "*.frag" },
    callback = function()
        vim.bo.filetype = "glsl"
    end,
})

