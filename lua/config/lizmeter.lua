-- lizmeter.lua
-- Sends file save events to LizMeter via named pipe.
-- Protocol: connect-per-message, JSON payload, then close.
-- Requires Neovim >= 0.9 (vim.uv / libuv built-in).

local function get_pipe_path()
  if vim.fn.has("win32") == 1 then
    return "\\\\.\\pipe\\lizmeter"
  else
    return "/tmp/lizmeter.sock"
  end
end

local function send_activity(project, file)
  local pipe_path = get_pipe_path()
  local payload = vim.fn.json_encode({ project = project, file = file }) .. "\n"

  pcall(function()
    local pipe = vim.uv.new_pipe(false)
    if not pipe then return end

    pipe:connect(pipe_path, function(connect_err)
      if connect_err then
        pipe:close()
        return
      end

      pipe:write(payload, function(_write_err)
        pipe:shutdown(function()
          pipe:close()
        end)
      end)
    end)
  end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("LizMeterActivity", { clear = true }),
  pattern = "*",
  callback = function()
    pcall(function()
      local cwd = vim.fn.getcwd()
      local project = vim.fn.fnamemodify(cwd, ":t")
      local abs_file = vim.fn.expand("%:p")
      local file = vim.fn.fnamemodify(abs_file, ":.")

      if project == "" or file == "" then return end

      -- Skip files outside cwd (path is still absolute)
      local c1, c2 = file:sub(1, 1), file:sub(2, 2)
      if c1 == "/" or c2 == ":" then return end

      send_activity(project, file)
    end)
  end,
  desc = "Send file save events to LizMeter",
})