local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local job = require("plenary.job")
local telescope = require("telescope")

-- don't preview binaries
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        ["<C-u>"] = false, -- clear input with C-u
        ["<C-w>"] = action_layout.toggle_preview -- toggle preview
      },
      n = {
        ["<C-w>"] = action_layout.toggle_preview -- toggle preview
      }
    },
    file_ignore_patterns = { -- ignore these files
      "node_modules/.*",
      ".git/.*"
    }
  }
}


-- keybindings reference
-- esc -> exit
-- Ctrl - u -> clear input
-- Ctrl -w -> toggle preview
