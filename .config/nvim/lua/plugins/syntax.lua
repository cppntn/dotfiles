return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim",
          "vimdoc",
          "dockerfile",
          "terraform",
          "query",
          "lua",
          "c",
          "markdown",
          "python",
          "yaml"
        },
        indent = {
          enable = true
        },
        highlight = {
          enable = true
        }
      })
    end
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true
            }
          }
        }
      })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end
  },
  -- comments
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      vim.keymap.set('n', '<leader>/', require("Comment.api").toggle.linewise.current, { desc = "Toggle comment" })
      vim.keymap.set('v', '<leader>/', ":<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        { desc = "Toggle comment" })
    end,
    config = function()
      require("Comment").setup()
    end,
  },
  -- completions through LSP
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  -- luasnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    }
  },
  -- completions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup({
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          })
          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        }, {
          { name = 'buffer' }
        })
      })
    end,
  },
  -- conform formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          terraform = { "terraform_fmt" },
          json = { "jq" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      })
    end
  }
}
