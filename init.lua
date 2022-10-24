require('NvRose') {
	bootstrap = false,
	colorscheme = 'catppuccin',

	base = {
		['trim'] = {
			enable = true,
			trailing = true,
			last_line = true,
			first_line = true
		},

		['terminal'] = {
			enable = true,
			config = {}
		}
	},

	plugins = {
		['catppuccin/nvim'] = {
			as = 'catppuccin',
			run = ':CatppuccinCompile',
			config = function()
				require('plugins.catppuccin')
			end
		},

		['nvim-treesitter/nvim-treesitter'] = {
			ft = { 'lua', 'c' },
			run = ':TSUpdate',
			event = 'BufWinEnter',
			config = function()
				require('plugins.treesitter')
			end
		}
	},

	vim = {
		options = require('config.options'),
		mappings = require('config.mappings')
	}
}
