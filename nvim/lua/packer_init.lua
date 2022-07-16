-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup(function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Tag viewer
    use 'preservim/tagbar'

    -- Treesitter interface
    use 'nvim-treesitter/nvim-treesitter'

    -- Color schemes
    use 'navarasu/onedark.nvim'
    use 'tanvirtin/monokai.nvim'
    use {
        'rose-pine/neovim',
        as = 'rose-pine'
    }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer',
                    'saadparwaiz1/cmp_luasnip'}
    }

    -- Statusline
    use {
        'feline-nvim/feline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- git labels
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Dashboard (start screen)
    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- My plugins

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Sneak
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop').setup()
        end
    }

    -- Buffer Delete
    use {
        'famiu/bufdelete.nvim',
        config = function()
            require('bufdelete').bufdelete(0, true)
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- wakatime
    use 'wakatime/vim-wakatime'

    -- surround
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- cursorline
    use {
        'yamatsum/nvim-cursorline',
        config = function()
          require('nvim-cursorline').setup {
            cursorline = {
              enable = true,
              timeout = 0,
              number = false,
            },
            cursorword = {
              enable = false
            }
          }
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
