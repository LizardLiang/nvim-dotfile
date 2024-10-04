-- stylua: ignore
if true then return {} end

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    keys = {
      { "<leader>fr", false },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "[F]ind [F]iles",
      },
      {
        "<leader>fo",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "[F]ind [O]ld files",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the last telescope picker",
      },
      {
        "<leader>fs",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_status()
        end,
        desc = "[F]ind Git [S]tatus",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      local actions = require("telescope.actions")

      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
        path_display = { "smart" },
      })
      opts.pickers = {
        disgnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = { preview_cutoff = 9999 },
        },
      }

      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
              ["<leader>w"] = "which_key",
            },
          },
          path_display = { "smart" },
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
                ["<C-u>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    action.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  action.move_selection_next(prompt_bufnr)
                end,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
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
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enable = true,
    -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    build = "make",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    enable = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}
