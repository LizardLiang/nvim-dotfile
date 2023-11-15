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
      timeout = 10000,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            INclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_changedtick(props.buf))
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
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
