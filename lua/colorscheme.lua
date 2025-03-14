-- vim.cmd('colorscheme xcodedark')  -- 设置颜色方案
--vim.cmd('colorscheme Sonokai')  -- 设置颜色方案
vim.cmd('colorscheme catppuccin-mocha')  -- 设置颜色方案
vim.cmd('set background=dark')
--
vim.cmd([[
    colorscheme catppuccin-mocha

    " For nvim tree
    highlight NvimTreeIndentMarker guifg=#A6E3A1
    highlight NvimTreeFolderArrowClosed guifg=#A6E3A1
    highlight NvimTreeFolderArrowOpen guifg=#A6E3A1
    highlight NvimTreeNormal guibg=NONE

    " For vertical split window border
    highlight WinSeparator guifg=#A6E3A1

    " For Diagnostic mesgs
    highlight DiagnosticVirtualTextError guibg=NONE
    highlight DiagnosticVirtualTextWarn guibg=NONE
    highlight DiagnosticVirtualTextInfo guibg=NONE
    highlight DiagnosticVirtualTextHint guibg=NONE
    highlight DiagnosticVirtualTextOk guibg=NONE

    " For float terms like hoverdoc
    highlight NormalFloat guibg=NONE

]])
