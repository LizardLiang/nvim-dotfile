return {

	"windwp/nvim-autopairs",
	event = "BufRead",
	config = function()
		local status, autopairs = pcall(require, "nvim-autopairs")
		if not status then
			return
		end

		autopairs.setup({ disable_filtype = { "TelescoptPrompt", "vim" } })
	end,
}
