local nvim_tree = require("nvim-tree")
-- 列表操作快捷键
nvim_tree.setup({
   -- 不显示 git 状态图标
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
--   update_cwd = true,
    update_focused_file = {
        enable = true,
--       update_cwd = true,
		update_root = true
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = false,
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        --hide_root_folder = false,
        -- 自定义列表中快捷键
        --mappings = {
        --    custom_only = false,
        --    list = list_keys,
        --},
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
 })
