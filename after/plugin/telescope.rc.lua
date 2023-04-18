local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local trouble = require("trouble.providers.telescope")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-h>"] = "which_key"
      },
    },
  },
  file_ignore_patterns = {
    "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

-- vim.keymap.set('n', ';f',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
-- vim.keymap.set('n', ';r', function()
--   builtin.live_grep()
-- end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
-- vim.keymap.set('n', ';t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', ';e', function()
--   builtin.diagnostics()
-- end)
vim.keymap.set("n", "<leader>fh", function()
  builtin.help_tags()
end)
vim.keymap.set('n', "<leader>fd", function(...)
  builtin.diagnostics()
  -- trouble.open_with_trouble(...)
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
vim.keymap.set("n", "<leader>fo", function()
  builtin.oldfiles()
end)
vim.keymap.set("n", "<leader>fs", function()
  builtin.lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>fb", function()
  builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "<leader>ft", function()
  builtin.lsp_type_definitions()
end)
vim.keymap.set("n", "<leader>lg", function()
  builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fgs", function()
  builtin.git_status()
end)
vim.keymap.set("n", "<leader>fgc", function()
  builtin.git_commits()
end)
vim.keymap.set("n", "<leader>st", function()
  vim.cmd("TodoTelescope")
end)
