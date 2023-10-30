return {
  "NvChad/nvim-colorizer.lua",
  ft = { "scss", "css", "javascript", "typescript" },
  opt = {
    RRGGBBAA = true,
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    sass = {
      enable = true,
      parsers = { "css" },
    },
  },
  config = function()
    require("colorizer").setup({
      user_default_options = {
        RRGGBBAA = true,
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        sass = {
          enable = true,
          parsers = { "css" },
        }, -- Enable all SASS features: rgb_fn, hsl_fn
      },
    })
  end,
}
