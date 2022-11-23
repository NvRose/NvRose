require("nvim-treesitter.configs").setup({
	auto_install = true,

	indent = {
		enable = true,
	},

	playground = {
		enable = true,
	},

	matchup = {
		enable = true,
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
