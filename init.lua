require "NvRose" {
	colorscheme = "duotone",
	autohide_cmd = true,
	startup_profile = false,
	snippets = true,

	base = { -- Builtin plugins
		["trim"] = { enable = true },
		["terminal"] = { enable = true },
		["statusline"] = { enable = true },
		["tabline"] = { enable = true },
		["resize"] = { enable = true }
	},

	-- See plugins options at: https://github.com/wbthomason/packer.nvim
	plugins = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/impatient.nvim",
		"neovim/nvim-lspconfig",
		"nathom/filetype.nvim",

		["nvim-treesitter/nvim-treesitter"] = {
			run = ":TSUpdateSync",
			config = require("plugins.treesitter")
		},

		["andymass/vim-matchup"] = {
			event = "BufWinEnter",
			config = require("plugins.matchup")
		},

		["norcalli/nvim-colorizer.lua"] = {
			event = "BufWinEnter",
			config = require("plugins.colorizer")
		},

		["nvim-telescope/telescope.nvim"] = {
			tag = "0.1.0",
			requires = { "nvim-lua/plenary.nvim" },
			event = "BufWinEnter",
			config = require("plugins.telescope")
		},

		["L3MON4D3/LuaSnip"] = {
			run = "make install_jsregexp",
		},

		["hrsh7th/nvim-cmp"] = {
			event = "InsertEnter",
			config = require("plugins.cmp")
		},

		["saadparwaiz1/cmp_luasnip"] = {
			after = "nvim-cmp"
		},

		["hrsh7th/cmp-nvim-lsp"] = {
			after = "nvim-cmp"
		},

		["hrsh7th/cmp-cmdline"] = {
			after = "nvim-cmp"
		},

		["hrsh7th/cmp-buffer"] = {
			after = "nvim-cmp"
		},

		["onsails/lspkind.nvim"] = {
			after = "nvim-cmp"
		},

		["hrsh7th/cmp-path"] = {
			after = "nvim-cmp"
		},

		["numToStr/Comment.nvim"] = {
			event = "BufWinEnter",
			config = require("plugins.comment")
		},

		["windwp/nvim-autopairs"] = {
			event = "InsertEnter",
			config = require("plugins.autopairs")
		},
	},

	vim = {
		-- Basic vim options
		options = require("config.options"),
		mappings = require("config.mappings"),

		-- Lsp config
		lsp = {
			enable = true,
			log_level = vim.log.levels.OFF,

			icons = {
				["Error"] = "",
				["Warn"] = "",
				["Info"] = "",
				["Hint"] = "",
			},

			diagnostic = {
				virtual_text = {
					prefix = "●"
				},
				signs = false,
				underline = true,
				update_in_insert = false,
			},

			-- on_attach mappings
			mappings = {
				{ "n", "]d", vim.diagnostic.goto_next },
				{ "n", "[d", vim.diagnostic.goto_prev },
				{ "n", "gd", vim.lsp.buf.definition },
				{ "n", "K", vim.lsp.buf.hover },
				{ "n", "<a-cr>",
					function()
						vim.lsp.buf.code_action({ apply = true })
					end
				}
			},

			-- See more configurations at: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- Below configs are only example.
			servers = {
				clangd = {},
				pylsp = {},
				cssls = {},
				sumneko_lua = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							runtime = { version = "LuaJIT" },
							telemetry = { enable = false },
						},
					},
				},
			},
		},
	}
}
