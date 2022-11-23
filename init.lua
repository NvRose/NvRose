require("NvRose")({
	bootstrap = false, -- Comment after installation
	colorscheme = "duotone",
	autohide_cmd = true,
	startup_profile = true,
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
		"nvim-treesitter/playground",
		"lewis6991/impatient.nvim",
		"neovim/nvim-lspconfig",

		["nvim-treesitter/nvim-treesitter"] = {
			run = ":TSUpdateSync",
			config = function()
				require("plugins.treesitter")
			end,
		},

		["andymass/vim-matchup"] = {
			config = function()
				vim.g.matchup_matchparen_offscreen = { ["method"] = "status_manual" }
			end,
		},

		["norcalli/nvim-colorizer.lua"] = {
			config = function()
				require("colorizer").setup()
			end,
		},

		["nvim-telescope/telescope.nvim"] = {
			requires = { "nvim-lua/plenary.nvim" },
			tag = "0.1.0",
			event = "BufWinEnter",
			cmd = { "Telescope" },
			config = function()
				require("plugins.telescope")
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

		["numToStr/Comment.nvim"] = {
			event = "BufWinEnter",
			config = function()
				require("plugins.comment")
			end,
		},

		["windwp/nvim-autopairs"] = {
			event = "InsertEnter",
			config = function()
				require("nvim-autopairs").setup()
			end,
		},
	},

	vim = {
		-- Basic vim options
		options = require("config.options"),
		mappings = require("config.mappings"),

		-- Lsp config
		lsp = {
			enable = true,
			diagnostic_on_hover = true,

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
				{ "n", "gf",
					function()
						vim.lsp.buf.code_action({ apply = true })
					end
				}
			},

			-- See more configurations at: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- Below configs are only example, keep in mind that you shall add filetypes to needed plugins
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--pch-storage=memory",
						"--clang-tidy",
						"--background-index",
						"--header-insertion=iwyu",
						"--malloc-trim",
					},
				},
				cssls = {},
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
