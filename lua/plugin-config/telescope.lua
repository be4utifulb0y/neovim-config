local builtin = require('telescope.builtin')
local startup_cwd = vim.fn.getcwd()
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
      base_dirs = {
		{'D:/Documents/projects/',max_depth = 2},
      },

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
