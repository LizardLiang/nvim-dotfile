local dap = require('dap')
local keymap = vim.keymap

dap.adapters.cppdbg = {
  command = "C:/Users/shotu/AppData/Local/nvim-data/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe",
  id = 'cppdbg',
  type = 'executable',
  options = { detached = false },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

dap.configurations.c = dap.configurations.cpp

keymap.set({"n", "i", "v"}, "<F5>", "<Cmd>lua require'dap'.continue()<CR>", {noremap = true, silent = true})
keymap.set({"n", "i", "v"}, "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
keymap.set({"n", "i", "v"}, "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", {noremap = true, silent = true})
keymap.set({"n", "i", "v"}, "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true})

-- Colorful dap
local dap_breakpoint_color = {
  breakpoint = {
    ctermbg = 0,
    fg='#993939',
    bg='#31353f'
  },
  logpoint = {
    ctermbg = 0,
    fg='#61afef',
    bg='#31353f'
  },
  stopped = {
    ctermbg = 0,
    fg='#98c379',
    bg='#31353f'
  },
}

local nvim_set_hl = vim .api.nvim_set_hl
nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoint)
nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
  error = {
    text = "",
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  condition = {
    text = 'ﳁ',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  rejected = {
    text = "",
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint',
  },
  logpoint = {
    text = '',
    texthl = 'DapLogPoint',
    linehl = 'DapLogPoint',
    numhl = 'DapLogPoint',
  },
  stopped = {
    text = '',
    texthl = 'DapStopped',
    linehl = 'DapStopped',
    numhl = 'DapStopped',
  },
}

local sign_define = vim.fn.sign_define

sign_define('DapBreakpoint', dap_breakpoint.error)
sign_define('DapBreakpointCondition', dap_breakpoint.condition)
sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
sign_define('DapLogPoint', dap_breakpoint.logpoint)
sign_define('DapStopped', dap_breakpoint.stopped)
