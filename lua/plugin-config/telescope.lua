local builtin = require('telescope.builtin')
local startup_cwd = vim.fn.getcwd()
local pyright_analysis = {
    indexing = true,
    typeCheckingMode = "basic",
    diagnosticMode = "workspace",
    autoImportCompletions = true,
    autoSearchPaths = true,
    inlayHints = {
      variableTypes = true,
      functionReturnTypes = true,
    },
    useLibraryCodeForTypes = true,
    diagnosticSeverityOverrides = {
      reportArgumentType = "none",
      reportAttributeAccessIssue = "none",
      reportCallIssue = "none",
      reportFunctionMemberAccess = "none",
      reportGeneralTypeIssues = "none",
      reportIncompatibleMethodOverride = "none",
      reportIncompatibleVariableOverride = "none",
      reportIndexIssue = "none",
      reportOptionalMemberAccess = "none",
      reportOptionalSubscript = "none",
      reportPrivateImportUsage = "none",
    }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {
    project = {
      base_dirs = 
	  {
		{'D:/Documents/projects/',max_depth = 2},
		{'D:/Application/UNIXV6/oos-dev/src/',max_depth = 3},
      },

	detection_methods = { 'lsp', 'pattern' },  -- 使用 LSP 或文件模式检测
	patterns = { '.git', 'Makefile', 'package.json','.project' },  -- 根目录标志


      on_project_selected = function(prompt_bufnr)
        -- 这里是你自定义的函数逻辑
		local project_actions = require('telescope._extensions.project.actions') 
		project_actions.change_working_directory(prompt_bufnr,false)
        local project_name = require('telescope.actions.state').get_selected_entry().value
        print("Switched to project: " .. project_name)
        -- 你可以在这里添加更多的自定义操作
      end
    }
  },
}

require("telescope").load_extension("project")

local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- 定义虚拟环境路径
local venvs_path = "D:/Application/miniconda/envs" -- 修改为你的虚拟环境路径

-- 修正路径为统一格式的函数
local function normalize_path(path)
    return path:gsub("\\", "/") -- 替换 Windows 的反斜杠为正斜杠
end

-- 自定义函数：仅显示文件夹
local function select_python_env()
    require('telescope.pickers').new({}, {
        prompt_title = "Select Python Virtual Environment",
        finder = require('telescope.finders').new_table({
            results = vim.fn.glob(venvs_path .. "/*", 0, 1), -- 列出路径下所有文件和文件夹
            entry_maker = function(entry)
                if vim.fn.isdirectory(entry) == 1 then -- 过滤仅文件夹
                    return {
                        value = normalize_path(entry), -- 规范路径
                        display = vim.fn.fnamemodify(entry, ":t"), -- 只显示文件夹名
                        ordinal = entry,
                    }
                end
            end,
        }),
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            map("n", "<CR>", function()
                local selection = action_state.get_selected_entry()
                if not selection then
                    print("No selection made!")
                    return
                end

                -- 获取选中的虚拟环境路径
                local venv_path = selection.value .. "/python.exe"
                require("plugin-config.pyright-config").python.pythonPath = venv_path
                -- 动态设置 pyright 的 Python 环境
                -- 使用 LSP 更新 Pyright 配置
                local pyright_config = {
                    settings = {
                        python = require("plugin-config.pyright-config").python
                    }
                }
                
                -- 更新 Pyright 的设置
                vim.lsp.stop_client(vim.lsp.get_active_clients())
                print("Switched to Python environment: " .. venv_path)
                --vim.cmd("LspStop")

                -- 重新启动 Pyright LSP 客户端
                require('lspconfig').pyright.setup(pyright_config)

                actions.close(prompt_bufnr)
            end)
            return true
        end,
    }):find()
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>oc", function()
  builtin.lsp_outgoing_calls()
end, { desc = "Outgoing Calls" })

vim.keymap.set("n", "<leader>ic", function()
  builtin.lsp_incoming_calls()
end, { desc = "Incoming Calls" })
-- 配置快捷键
--
vim.keymap.set("n", "<leader>sv", select_python_env, { desc = "Select Python Virtual Environment" })
