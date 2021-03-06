-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------
-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua
-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/kyazdani42/nvim-tree.lua#keybindings
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

-- Call setup:
-- Each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`)
nvim_tree.setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    -- disable_netrw = false, -> already disabled on `/core/options.lua`
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = true,
    open_on_setup_file = false,
    open_on_tab = true,
    sort_by = "name",
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    update_cwd = true,
    view = {
        width = 32,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            }
        }
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
            }
        },
        special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {}
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    filters = {
        dotfiles = true,
        custom = {"^.git$", 'node_modules', ".cache"},
        exclude = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    }
}

-- key maps: reference
	-- { key = "<C-v>",  cb = tree_cb("vsplit") },
  -- { key = "<C-x>",  cb = tree_cb("split") },
  -- { key = "R",      cb = tree_cb("refresh") },
  -- { key = "P",      cb = tree_cb("parent_node") },

  -- { key = "<C-t>",  cb = tree_cb("tabnew") },
  -- { key = "<",      cb = tree_cb("prev_sibling") },
  -- { key = ">",      cb = tree_cb("next_sibling") },
  -- { key = "<BS>",   cb = tree_cb("close_node") },
  -- { key = "<S-CR>", cb = tree_cb("close_node") },
  -- { key = "<Tab>",  cb = tree_cb("preview") },
  -- { key = "K",      cb = tree_cb("first_sibling") },
  -- { key = "J",      cb = tree_cb("last_sibling") },
  -- { key = "I",      cb = tree_cb("toggle_ignored") },
  -- { key = "H",      cb = tree_cb("toggle_dotfiles") },
  -- { key = "a",      cb = tree_cb("create") },
  -- { key = "d",      cb = tree_cb("remove") },
  -- { key = "r",      cb = tree_cb("rename") },
  -- { key = "<C-r>",  cb = tree_cb("full_rename") },
  -- { key = "x",      cb = tree_cb("cut") },
  -- { key = "c",      cb = tree_cb("copy") },
  -- { key = "p",      cb = tree_cb("paste") },
  -- { key = "y",      cb = tree_cb("copy_name") },
  -- { key = "Y",      cb = tree_cb("copy_path") },
  -- { key = "gy",     cb = tree_cb("copy_absolute_path") },
  -- { key = "[c",     cb = tree_cb("prev_git_item") },
  -- { key = "]c",     cb = tree_cb("next_git_item") },
  -- { key = "-",      cb = tree_cb("dir_up") },
  -- { key = "q",      cb = tree_cb("close") },
  -- { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  -- { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
