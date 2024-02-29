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
}
