local db = require("dashboard")

db.header_pad = 25
db.custom_header = {}

db.custom_center = {
	{
		icon = "  ",
		desc = "Find file   ",
		action = [[lua require("telescope.builtin").find_files()]],
	},
	{
		icon = "  ",
		desc = "Edit config ",
		action = [[edit ~/.config/nvim/init.lua]],
	},
	{
		icon = "  ",
		desc = "Search text ",
		action = [[lua require("telescope.builtin").live_grep()]],
	},
	{
		icon = "  ",
		desc = "Recent files",
		action = [[lua require("telescope.builtin").oldfiles()]],
	},
}
db.custom_footer = { " " }
