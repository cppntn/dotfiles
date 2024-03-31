local map = vim.keymap.set

-- Insert mode mappings
map('i', '<C-a>', '<ESC>^i', { desc = "Beginning of line" })
map('i', '<C-e>', '<End>', { desc = 'End of line' })
map('i', '<C-d>', '<Del>', { desc = "Forward delete" })
map('i', '<C-k>', "getline('.') == '' ? '<C-o>\"_dd' : '<C-o>\"_D'",
  { expr = true, desc = "Delete to end or delete line" })
map('i', '<C-s>', '<C-o><cmd>w<CR>', { desc = 'Save file when in insert mode' })

-- Normal mode mappings
map('n', 'd', '"_d', { noremap = true, silent = true })
map('n', 'D', '"_D', { noremap = true, silent = true })
map('n', 'dd', '"_dd', { noremap = true, silent = true })
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", noremap = true, silent = true })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", noremap = true, silent = true })
map('n', ';', ':', { nowait = true })
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights', silent = true })
map('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer", nowait = true, silent = true })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = "Previous buffer", nowait = true, silent = true })
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'Copy whole file' })
map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Toggle line number' })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative number' })
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = 'Move down', silent = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = 'Move up', silent = true })
map('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = 'Move up', silent = true })
map('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = 'Move down', silent = true })
map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'New buffer' })
map('n', '<leader>h', ':sp | terminal<CR>', { desc = "Horizontal terminal split", nowait = true, silent = true })
map('n', '<leader>v', ':vsp | terminal<CR>', { desc = "Vertical terminal split", nowait = true, silent = true })
map('n', '<leader>x', function()
  if vim.bo.buftype == 'terminal' then
    -- Do nothing if it's a terminal
    return
  end
  local buf_count = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)'))
  if buf_count > 1 then
    vim.cmd('bp | bd #')
  else
    vim.cmd('enew | bd #')
  end
end, { desc = "Close buffer", noremap = true, silent = true })

-- Visual mode mappings
map('v', 'd', '"_d', { noremap = true, silent = true })
map('v', 'D', '"_D', { noremap = true, silent = true })
map('v', '<', '<gv', { desc = "Indent line left" })
map('v', '>', '>gv', { desc = "Indent line right" })

-- Terminal mode mappings
map('t', '<S-Space>', '<Space>', { nowait = true })
map('t', '<S-CR>', '<CR>', { nowait = true })
map('t', '<C-x>', '<C-\\><C-n>', { desc = "Switch to Normal mode in Terminal", nowait = true })
