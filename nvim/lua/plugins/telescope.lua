local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,  -- close with esc
        ["<C-u>"] = false,          -- clear input with C-u
      },
    },
    file_ignore_patterns = {  -- ignore these files
        "node_modules/.*",
        ".git/.*"
    }
  }
}
