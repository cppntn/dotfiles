-------------------------------------- globals -----------------------------------------
vim.g.transparency = false
vim.g.mapleader = " "
vim.g.python3_host_prog = 'python'

-------------------------------------- options ------------------------------------------
vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.fillchars = { eob = " ", diff = "╱" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

vim.opt.linebreak = true

------------------------------------ vim scripts ----------------------------------------
vim.cmd [[autocmd VimLeave * set guicursor=a:ver25]]
vim.cmd [[set autoread]]


--------------------------------------- api ---------------------------------------------
-- auto-refresh file on idle.
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})
-- disable line numbers in terminal
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew', 'TermOpen' }, {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      -- Set window-local options for the current window
      vim.wo.scrolloff = 0
      vim.wo.number = false
      vim.wo.relativenumber = false
      -- Start in insert mode
      vim.cmd 'startinsert'
    end
  end,
})

-- remove terminal from buflisted
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal nobuflisted")
  end,
})

-- Close the buffer that was hosting the terminal
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  callback = function(args)
    vim.cmd(string.format("bd! %d", args.buf))
  end,
})
