return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
        },
      })

      -- Custom function to open git_commits under DiffviewOpen
      local function git_commits_with_diffview()
        require('telescope.builtin').git_commits({
          attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', function()
              local selection = action_state.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)
              vim.cmd("DiffviewOpen " .. selection.value .. "^.." .. selection.value)
            end)
            return true
          end,
        })
      end

      -- Assign the custom function to a command for easy access
      vim.api.nvim_create_user_command('GitCommitsDiffview', git_commits_with_diffview, {})
      vim.keymap.set('n', '<leader>cm', ':GitCommitsDiffview <CR>', {})
      -- Keymaps
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files follow=true no_ignore=true hidden=true <CR>', {})
      vim.keymap.set('n', '<leader>fw', ':Telescope live_grep <CR>', {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
  -- todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
      vim.keymap.set('n', '<leader>ft', ':TodoTelescope <CR>', {})
    end
  }
}
