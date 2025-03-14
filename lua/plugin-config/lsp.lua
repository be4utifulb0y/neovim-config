require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
require 'lspconfig'.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "-j=12",
        "--all-scopes-completion",
        "--pch-storage=memory",
        "--cross-file-rename",
        "--fallback-style=WebKit",
        "--pretty",
        "--completion-style=detailed",
        "--clang-tidy",
        "--query-driver=D:\\Application\\Clion\\CLion 2023.3.4\\bin\\mingw\\bin\\g++.exe",
        "--compile-commands-dir=" .. vim.loop.cwd() .. "/build",
        "--header-insertion=never"
    },
    --"--header-insertion=iwyu",
    --"--completion-style=detailed",
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}
--require('lspconfig').vuels.setup({
--  filetypes = { 'vue' },
--  init_options = {
--    config = {
--      vetur = {
--        useWorkspaceDependencies = true,
--        validation = {
--          template = true,
--          style = true,
--          script = true
--        },
--        format = {
--          enable = true,
--          options = {
--            tabSize = 2,
--            useTabs = false
--          }
--        }
--      }
--    },
--  }
--})
require 'lspconfig'.pyright.setup {
    settings = {
        python = require("plugin-config.pyright-config").python
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
--require'lspconfig'.ts_ls.setup{
--    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--	capabilities = require('cmp_nvim_lsp').default_capabilities(),
--    on_attach = function(client)
--        client.server_capabilities.documentFormattingProvider = false
--    end,
--}

--require("prettier").setup({
--  bin = 'prettier', -- 或 'prettierd'
--  filetypes = { "css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss", "typescript", "typescriptreact", "yaml" },
--  extra_args = { "--tab-width", "4", "--use-tabs", "false" }  -- 设置缩进为4个空格
--})
---- 自动保存时格式化
--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
require 'lspconfig'.glsl_analyzer.setup {
}
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.glsl", "*.vert", "*.frag" },
    callback = function()
        vim.bo.filetype = "glsl"
    end,
})

local on_attach = function(client, bufnr)
    -- 确保补全功能已启用
    require 'completion'.on_attach(client, bufnr)
end

require 'lspconfig'.verible.setup {
    cmd = { 'verible-verilog-ls', '--rules_config_search' },
    root_dir = "./",
}
local nvim_lsp = require('lspconfig')

nvim_lsp.svlangserver.setup {
    on_init = function(client)
        --local path = client.workspace_folders[1].name

        client.config.settings.systemverilog = {
            includeIndexing     = { "**/*.{sv,svh}" },
            excludeIndexing     = { "test/**/*.sv*" },
            defines             = {},
            launchConfiguration = "/tools/verilator -sv -Wall --lint-only",
            formatCommand       = "/tools/verible-verilog-format"
        }
        return true
    end
}


require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- 设置 Lua 的运行时版本
            },
            diagnostics = {
                globals = { 'vim' }, -- 允许 vim 全局变量
            },
            workspace = {
                -- 指定工作区目录，可以包含整个工作区的代码
                library = vim.api.nvim_get_runtime_file("", true), -- 加载 Neovim 的库文件
                checkThirdParty = false,                           -- 禁用第三方库的检查
            },
            telemetry = {
                enable = false, -- 禁用遥测
            },
        },
    },
    cmd = { "lua-language-server", "--background-index" } -- 启用背景索引
}
