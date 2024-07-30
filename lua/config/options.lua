-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Under curl
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])

vim.filetype.add({
  pattern = { ["*.gyp"] = "gyp" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "gyp", "markdown", "md" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.o.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
else
  vim.o.shell = "user/bin/zsh"
end

if vim.g.vscode then
  vim.opt.isprint = "1-255"
end
