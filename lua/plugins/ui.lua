return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "kanagawa",
      },
    },
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufRead",
    dependencies = { "SmiteshP/nvim-navic" },
    priority = 1200,
    config = function()
      -- local colors = require("solarized-osaka.colors").setup()
      local helpers = require("incline.helpers")
      local navic = require("nvim-navic")
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            guibg = "#44406e",
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { " > ", group = "NavicSeparator" },
                { item.icon, group = "NavicIcons" .. item.type },
                { item.name, group = "NavicText" },
              })
            end
          end
          table.insert(res, " ")
          return res
        end,
      })
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
 __                                     __       __                                        
/\ \       __                          /\ \     /\ \       __                              
\ \ \     /\_\  ____      __     _ __  \_\ \    \ \ \     /\_\     __      ___      __     
 \ \ \  __\/\ \/\_ ,`\  /'__`\  /\`'__\/'_` \    \ \ \  __\/\ \  /'__`\  /' _ `\  /'_ `\   
  \ \ \L\ \\ \ \/_/  /_/\ \L\.\_\ \ \//\ \L\ \  __\ \ \L\ \\ \ \/\ \L\.\_/\ \/\ \/\ \L\ \  
   \ \____/ \ \_\/\____\ \__/.\_\\ \_\\ \___,_\/\_\\ \____/ \ \_\ \__/.\_\ \_\ \_\ \____ \ 
    \/___/   \/_/\/____/\/__/\/_/ \/_/ \/__,_ /\/_/ \/___/   \/_/\/__/\/_/\/_/\/_/\/___L\ \
                                                                                    /\____/
                                                                                    \_/__/ 
      ]]

      logo = string.rep("\n", 4) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
      vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
  -- {
  --   "gelguy/wilder.nvim",
  --   enabled = function()
  --     return not vim.g.vscode
  --   end,
  --   build = ":UpdateRemotePlugins",
  --   event = "VeryLazy",
  --   keys = { ":" },
  --   config = function()
  --     local wilder = require("wilder")
  --     wilder.setup({ modes = { ":", "/", "?" } })
  --
  --     wilder.set_option("pipeline", {
  --       wilder.branch(
  --         wilder.python_file_finder_pipeline({
  --           file_command = function(ctx, arg)
  --             if string.find(arg, ".") ~= nil then
  --               return { "fdfind", "-tf", "-H" }
  --             else
  --               return { "fdfind", "-tf" }
  --             end
  --           end,
  --           dir_command = { "fd", "-td" },
  --           filters = { "cpsm_filter" },
  --         }),
  --         wilder.substitute_pipeline({
  --           pipeline = wilder.python_search_pipeline({
  --             skip_cmdtype_check = 1,
  --             pattern = wilder.python_fuzzy_pattern({
  --               start_at_boundary = 0,
  --             }),
  --           }),
  --         }),
  --         wilder.cmdline_pipeline({
  --           fuzzy = 2,
  --           fuzzy_filter = wilder.lua_fzy_filter(),
  --         }),
  --         {
  --           wilder.check(function(ctx, x)
  --             return x == ""
  --           end),
  --           wilder.history(),
  --         },
  --         wilder.python_search_pipeline({
  --           pattern = wilder.python_fuzzy_pattern({
  --             start_at_boundary = 0,
  --           }),
  --         })
  --       ),
  --     })
  --
  --     local highlighters = {
  --       wilder.pcre2_highlighter(),
  --       wilder.lua_fzy_highlighter(),
  --     }
  --
  --     local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
  --       border = "rounded",
  --       empty_message = wilder.popupmenu_empty_message_with_spinner(),
  --       highlighter = highlighters,
  --       left = {
  --         " ",
  --         wilder.popupmenu_devicons(),
  --         wilder.popupmenu_buffer_flags({
  --           flags = " a + ",
  --           icons = { ["+"] = "", a = "", h = "" },
  --         }),
  --       },
  --       right = {
  --         " ",
  --         wilder.popupmenu_scrollbar(),
  --       },
  --     }))
  --
  --     local wildmenu_renderer = wilder.wildmenu_renderer({
  --       highlighter = highlighters,
  --       separator = " · ",
  --       left = { " ", wilder.wildmenu_spinner(), " " },
  --       right = { " ", wilder.wildmenu_index() },
  --     })
  --
  --     wilder.set_option(
  --       "renderer",
  --       wilder.renderer_mux({
  --         [":"] = popupmenu_renderer,
  --         ["/"] = wildmenu_renderer,
  --         substitute = wildmenu_renderer,
  --       })
  --     )
  --   end,
  -- },
  {
    -- Styling
    "xiyaowong/transparent.nvim",
    -- enabled = false,
    config = function()
      local transparent = require("transparent")
      vim.g.transparent_enable = 1
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
