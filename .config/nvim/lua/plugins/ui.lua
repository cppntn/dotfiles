return {
  -- indent-blankline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- bufferline
  -- {
  --   "willothy/nvim-cokeline",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
  --     "nvim-tree/nvim-web-devicons", -- If you want devicons
  --   },
  --   config = true
  -- }
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = false,
        button = '',
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = { left = '▎', right = '' },

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = true,

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = '●' },
        pinned = { button = '', filename = true },

        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'powerline',

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = true,
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true
      }

    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- catppuccin theme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
      vim.keymap.set('n', '<leader>td', ':colorscheme catppuccin-mocha<CR>', { silent = true })
      vim.keymap.set('n', '<leader>tl', ':colorscheme catppuccin-latte<CR>', { silent = true })
    end
  },
  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'dracula',
        },
        sections = {
          lualine_c = {
            { 'filename', path = 1 } -- Display the full path of the file
          },
        }
      })
    end
  },
  -- nvimtree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          adaptive_size = false,
          side = "left",
          width = 30,
          preserve_window_proportions = true,
        },
        git = {
          enable = true,
          ignore = false,
        },
        filesystem_watchers = {
          enable = true,
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          highlight_opened_files = "none",

          indent_markers = {
            enable = false,
          },

          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },

            glyphs = {
              default = "󰈚",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
      })
      vim.keymap.set('n', '<C-n>', ":NvimTreeToggle <CR>", {})
      vim.keymap.set('n', '<leader>e', ":NvimTreeFocus <CR>", {})
    end
  }
}
