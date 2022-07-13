-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("", "mbw", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mfw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mfl", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mbl", "<cmd>HopLineBC<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("", "mfw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mbw", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mfl", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("", "mbl", "<cmd>HopLineBC<CR>", {noremap=true})


-- normal mode (sneak-like)
vim.api.nvim_set_keymap("", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

-- visual mode (sneak-like)
vim.api.nvim_set_keymap("", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("", "S", "<cmd>HopChar2BC<CR>", {noremap=false})
