return {
  {
    "LizardLiang/liz-live-server",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    keys = {
      { "<leader>P", "<cmd>LiveServerToggle<cr>", desc = "Live server (Preview) toggle" },
    },
    opts = {},
  },
}
