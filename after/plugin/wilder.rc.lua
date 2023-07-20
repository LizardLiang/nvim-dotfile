local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(),
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
		pumblend = 20,
	})
)
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = {
			border = "Normal", -- highlight to use for the border
		},
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
	}))
)
wilder.set_option("pipeline", {
	wilder.branch(
		wilder.python_file_finder_pipeline({
			-- to use ripgrep : {'rg', '--files'}
			-- to use fd      : {'fd', '-tf'}
			file_command = { "fd", "-tf" },
			-- to use fd      : {'fd', '-td'}
			dir_command = { "fd", "-td" },
			-- use {'cpsm_filter'} for performance, requires cpsm vim plugin
			-- found at https://github.com/nixprime/cpsm
			filters = { "fuzzy_filter", "difflib_sorter" },
		}),
		wilder.cmdline_pipeline(),
		wilder.python_search_pipeline()
	),
})
