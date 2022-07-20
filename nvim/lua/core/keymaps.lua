-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<right>', '<nop>')
map('', '<left>', '<nop>')

map('i', 'jk', '<Esc>') -- map esc to jk

map('n', 'H', '_') -- H to go the start of line(n)
map('v', 'H', '_') -- H to go the start of line(v)
map('n', 'L', '$') -- L to go to the end of line(n)
map('v', 'L', '$') -- L to go to the end of line(v)
map('n', 'J', '}') -- J to jump previous blocks(n)
map('v', 'J', '}') -- J to jump previous blocks(v)
map('n', 'K', '{') -- L to jump next blocks(n)
map('v', 'K', '{') -- L to jump next blocks(v)

map("n", '<A-j>', ":m .+1<CR>==") -- move line up(n)
map("n", '<A-k>', ":m .-2<CR>==") -- move line down(n)
map("v", '<A-j>', ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", '<A-k>', ":m '<-2<CR>gv=gv") -- move line down(v)
map("i", '<A-j>', "<Esc>:m .+1<CR>==gi") -- move line up(i)
map("i", '<A-k>', "<Esc>:m .-2<CR>==gi") -- move line down(i)

map('n', '<C-k>', '<C-w>k') -- window up
map('n', '<C-h>', '<C-w>h') -- window left
map('n', '<C-j>', '<C-w>j') -- window down
map('n', '<C-l>', '<C-w>l') -- window right

map('n', '<leader>bn', ':bn<CR>') -- next buffer(n)
map('n', '<leader>bp', ':bp<CR>') -- previous buffer(n)
map('n', '<leader>bk', ':Bdelete<CR>') -- kill current buffer(n)

map('n', '<leader>tt', ':tabedit<CR>') -- open buffer in new tab
map('n', '<leader>tn', ':tabnext<CR>') -- go to next tab
map('n', '<leader>tp', ':tabprev<CR>') -- go to prev tab
map('n', '<leader>tk', ':tabclose<CR>') -- kill current tab

map('n', '<leader>j', 'gJ') -- leader j to join lines(n)
map('v', '<leader>j', 'gJ') -- leader j to join lines(v)

map('n', '<leader>c', ':nohl<CR>') -- clear search highlights
map('n', '<leader>r', ':so %<CR>') -- Reload configuration without restart nvim
map('n', '<leader>q', ':qa!<CR>') -- force exit

-- gx to open link under cursor
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close
map('n', '<leader>n', ':NvimTreeFindFile<CR>') -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>') -- open/close

-- Telescope
map("n", "<C-p>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = false }) -- search files(n)
map("n", "<C-p>g", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = false }) -- search within files(n)
map("n", "<C-p>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = false }) -- search current buffer(n)
map("n", "<C-p>h", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = false }) -- search docs of current lang(n)

-- Hop
map("", "mw", "<cmd>HopWord<CR>", { noremap = true })
map("", "ml", "<cmd>HopLineStart<CR>", { noremap = true })
map("", "ms", "<cmd>HopPattern<CR>", { noremap = true })
map("", "ma", "<cmd>HopAnywhere<CR>", { noremap = true })
map("", "f", "<cmd>HopChar1<CR>", { noremap = false })
map("", "s", "<cmd>HopChar2<CR>", { noremap = false })
