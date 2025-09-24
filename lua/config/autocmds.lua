-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_user_command("Code", ":!code %<CR>", { desc = "Open file with VsCode" })

vim.api.nvim_create_user_command("Exp", function()
  local current_file = vim.fn.expand("%:p")
  if current_file == "" then
    vim.notify("No file in current buffer", vim.log.levels.WARN)
    return
  end

  if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    -- Get directory and normalize path for Windows
    local dir_path = vim.fn.fnamemodify(current_file, ":p:h")
    dir_path = dir_path:gsub("/", "\\")

    -- Open explorer at the directory
    local cmd = string.format('explorer "%s"', dir_path)
    vim.fn.system(cmd)
  else
    vim.notify("Explorer command is only available on Windows", vim.log.levels.INFO)
  end
end, { desc = "Open Windows Explorer at current file location" })
