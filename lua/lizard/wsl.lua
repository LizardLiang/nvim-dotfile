vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["*"] = "win32yank.exe -i --crlf",
		["+"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["*"] = "win32yank.exe -o --crlf",
		["+"] = "win32yank.exe -o --crlf",
	},
	cache_enabled = 0,
}
