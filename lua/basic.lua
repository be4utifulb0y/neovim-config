-- 基本设置
vim.o.termguicolors = true  -- 启用真彩色支持
vim.o.relativenumber = true
vim.o.mouse = ""
vim.o.number = true  -- 显示行号
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.hlsearch = true  -- 高亮搜索结果
vim.o.ignorecase = true  -- 搜索时忽略大小写
vim.o.smartcase = true  -- 智能大小写搜索
vim.wo.signcolumn="yes"
vim.o.showmode = false
vim.o.wildmenu = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- ==rainbow==
vim.g.rainbow_active=1

vim.opt.pumheight = 7 -- 每页显示六条补全
vim.opt.wrap = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "
-- 设置折叠方式为 Treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.cursorline = true
vim.opt.autoread = true
vim.o.scrolloff = 7
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold", "CursorHoldI"}, {
  command = "checktime"
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
})
vim.g.cinnamon_cursor_enable = 1  -- 启用光标平滑移动

