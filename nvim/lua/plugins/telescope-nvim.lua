vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap=false})
