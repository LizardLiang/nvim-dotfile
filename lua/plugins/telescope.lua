return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fr", false },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "[F]ind [O]ld files",
    },
    {
      "<leader>fl",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "[F]ind [L]ast result",
    },
    {
      "<leader><leader>",
      false,
    },
  },
  config = function()
    local telescope = require("telescope")

    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local trouble = require("trouble.providers.telescope")

    local function telescope_buffer_dir()
      return vim.fn.expand("%:p:h")
    end

    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
            ["<leader>w"] = "which_key",
          },
        },
      },
      file_ignore_patterns = {
        "./node_modules/*",
        "node_modules",
        "^node_modules/*",
        "node_modules/*",
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function()
                vim.cmd("normal vbd")
              end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
          },
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
    local keymap = vim.keymap

    keymap.set("n", ";sf", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end, { desc = "[F]ile [B]rowser" })
  end,
}
