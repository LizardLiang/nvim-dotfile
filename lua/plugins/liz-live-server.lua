return {
  {
    "LizardLiang/liz-live-server",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    keys = {
      { "<leader>P", "<cmd>LiveServerOpenCurrent<cr>", desc = "Live server (Preview) toggle" },
    },
    opts = {},
  },
}
