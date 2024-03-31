return {
  -- diffview
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>gd', ':DiffviewOpen <CR>', { silent = true })
      vim.keymap.set('n', '<leader>gc', ':DiffviewClose <CR>', { silent = true })
      -- vim.api.nvim_set_hl(0, 'DiffviewDiffAdd', { fg = 'black', bg = 'green' })
      -- vim.api.nvim_set_hl(0, 'DiffviewDiffChange', { fg = 'black', bg = '#d3d3d3' })
      -- vim.api.nvim_set_hl(0, 'DiffviewDiffModified', { fg = 'black', bg = 'orange' })
      -- vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { fg = 'black', bg = 'red' })
      -- vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { fg = 'black', bg = 'red' })
    end
  },
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        }
      })
      vim.keymap.set('n', '<leader>ph', require("gitsigns").preview_hunk, { noremap = true, nowait = true })
    end
  }
}
