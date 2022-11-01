vim.api.nvim_create_autocmd({
	"BufRead",
	"BufWinEnter",
	"BufNewFile",
}, {
	group = vim.api.nvim_create_augroup("LazyTreesitter", {}),
	callback = function()
		require("packer").loader("nvim-treesitter")

		require("nvim-treesitter.configs").setup({
			auto_install = false,

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
	end,
})
