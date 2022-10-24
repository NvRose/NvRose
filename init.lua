require("NvRose")({
	bootstrap = false,
	colorscheme = "catppuccin",

	base = {
		["trim"] = {
			enable = true,
			trailing = true,
			last_line = true,
			first_line = true,
		},

		["terminal"] = {
			enable = true,
			config = {},
		},

		["statusline"] = {
			enable = true,
		},

		["tabline"] = {
			enable = true,
		},

		["resize"] = {
			enable = true,
		},
	},

	plugins = {
		["catppuccin/nvim"] = {
			as = "catppuccin",
			run = ":CatppuccinCompile",
			config = function()
				require("plugins.catppuccin")
			end,
		},

		["nvim-treesitter/nvim-treesitter"] = {
			ft = { "lua", "c" },
			run = ":TSUpdate",
			event = "BufWinEnter",
			config = function()
				require("plugins.treesitter")
			end,
		},

		["nvim-telescope/telescope.nvim"] = {
			requires = { "nvim-lua/plenary.nvim" },
			tag = "0.1.0",
			event = "BufWinEnter",
			config = function()
				require("plugins.telescope")
			end,
		},

		["numToStr/Comment.nvim"] = {
			ft = { "c", "lua" },
			event = "BufWinEnter",
			config = function()
				require("plugins.comment")
			end,
		},

		["hrsh7th/nvim-cmp"] = {
			requires = {
				{ "L3MON4D3/LuaSnip", run = "make install_jsregexp" },
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-buffer",
				"onsails/lspkind.nvim",
				"hrsh7th/cmp-path",
			},
			config = function()
				require("plugins.cmp")
			end,
		},

		["windwp/nvim-autopairs"] = {
			event = "BufWinEnter",
			config = function()
				require("nvim-autopairs").setup()
			end,
		},

		["jose-elias-alvarez/null-ls.nvim"] = {
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.null-ls")
			end,
		},
	},

	vim = {
		options = require("config.options"),
		mappings = require("config.mappings"),

		lsp = {
			enable = true,
			diagnostic_on_hover = true,
			filetypes = { "c" },

			icons = {
				["Error"] = "",
				["Warn"] = "",
				["Info"] = "",
				["Hint"] = "",
			},

			diagnostic = {
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
			},

			mappings = {
				{ "n", "]d", vim.diagnostic.goto_next },
				{ "n", "[d", vim.diagnostic.goto_prev },
				{ "n", "gd", vim.lsp.buf.definition },
				{
					"n",
					"gf",
					function()
						vim.lsp.buf.code_action({ apply = true })
					end,
				},
			},

			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--malloc-trim",
						"--pch-storage=memory",
						"--clang-tidy",
					},
				},

				pyright = {},

				sumneko_lua = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},

							runtime = {
								version = "LuaJIT",
							},

							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
							},

							telemetry = {
								enable = false,
							},
						},
					},
				},
			},
		},
	},
})
