
require("venv-selector").setup({
    search = true, -- 开启搜索功能
    parents = { "D:\\Application\\miniconda\\envs"}, -- 添加自定义搜索路径
    auto_refresh = true, -- 启动时自动刷新虚拟环境列表
    search_workspace = true, -- 在工作区目录中搜索虚拟环境
    search_venv_managers = true, -- 搜索常见虚拟环境管理器（如 pipenv、poetry、conda）
    enable_debug_output = false, -- 是否启用调试日志
})
