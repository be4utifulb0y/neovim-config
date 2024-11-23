local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('v','p','"_dP',opt)
map('n','gg','gg0',opt)
map('n','<A-m>',":NvimTreeToggle<CR>",opt)
-- bufferline
-- Tab左右切换
map("n","<C-h>",":BufferLineCyclePrev<CR>",opt)
map("n","<C-l>",":BufferLineCycleNext<CR>",opt)
map('n', '<C-c>', '<C-q>', opt)
map('n','<C-w>q',':Bdelete<CR>',opt)
--Alt+ctrl+b编译
--map("n","<A-C-b>",":CMakeBuild<CR>",opt)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
map('n', '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
map('n','<leader>q',':bd<CR>',opt)
map('i','jk','<ESC>',opt)
map('n','<leader>nh',':nohl<CR>',opt)
map('n','<C-Left>',":vertical resize -2<CR>",opt)
map('n','<C-Right>',":vertical resize +2<CR>",opt)
map("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opt)
map('t', '<jk>', [[<C-\><C-n>]], opt)
map('n','<C-t>',':ToggleTerm<CR>',opt)
map('n','<leader>xx',':Trouble diagnostics toggle<cr>',opt)
function rename_clear_input()
    local curr_name = vim.fn.expand("<cword>") -- 获取光标下的变量名
    vim.ui.input({ prompt = "Rename to: ", default = "" }, function(new_name)
        if new_name and #new_name > 0 then
            vim.lsp.buf.rename(new_name)
        end
    end)
end
map('n','<leader>rn',"<cmd>lua rename_clear_input()<CR>",opt)
--map('n','<leader>rn',':lua vim.lsp.buf.rename()<CR>',opt)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
