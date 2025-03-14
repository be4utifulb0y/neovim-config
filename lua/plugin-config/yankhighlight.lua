vim.cmd([[highlight HoverSearch guifg=#000000 guibg=#FFFF00]])
vim.cmd([[highlight HoverSearch guifg=NONE guibg=#3B3E48]])
-- 设置在停止移动光标后自动高亮当前单词
vim.o.updatetime = 500  -- 设置触发 CursorHold 的等待时间 (毫秒)
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        local word = vim.fn.expand("<cword>")
		word = word:gsub("[\194-\244][\128-\191]*", "")  -- 过滤中文字符
        if word ~= "" then
            vim.fn.matchadd("HoverSearch", "\\V\\<" .. vim.fn.escape(word, "\\") .. "\\>")
        end
    end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    callback = function()
        vim.fn.clearmatches()
    end,
})



-- 创建一个自动命令组
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

-- 设置 yank 高亮
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'HoverSearch', timeout = 200 })
  end,
})
