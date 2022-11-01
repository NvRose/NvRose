local ok, telescope = pcall(require, "telescope")

if ok then
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			set_env = { COLORTERM = "truecolor" },
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",

			file_ignore_patterns = {
				".git/",
				"%.o",
				"packer_compiled.lua",
			},

			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},

		pickers = {
			find_files = {
				theme = "dropdown",
				prompt_title = "",
				preview_title = false,
			},
			live_grep = {
				theme = "dropdown",
				prompt_title = "",
				preview_title = false,
			},
		},
	})
end
