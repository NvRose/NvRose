require("NvRose")({
	-- Auto install packer
	bootstrap = false,

	-- Colorcheme, can be nil
	colorscheme = "duotone",

	-- Hide cmd when not used (+1 line to see more code)
	autohide_cmd = true,

	-- Builtin plugins
	base = {
		["trim"] = {
			enable = true,
			trailing = true,
			last_line = true,
			first_line = true,
		},
		["terminal"] = { enable = true },
		["statusline"] = { enable = true },
		["tabline"] = { enable = true },
		["resize"] = { enable = true },
	},

	-- See plugins options at: https://github.com/wbthomason/packer.nvim
	plugins = {
		-- Caching no lazy loaded modules
		["lewis6991/impatient.nvim"] = {},

		-- Needed by tabline
		["nvim-tree/nvim-web-devicons"] = {},

		-- Matchit and MatchParen better replacement
		["andymass/vim-matchup"] = {
			config = function()
				vim.g.matchup_matchparen_offscreen = { ["method"] = "status_manual" }
			end,
		},

		-- Welcome page (optional)
		["glepnir/dashboard-nvim"] = {
			config = function()
				require("plugins.dashboard")
			end,
		},

		-- Color hex strings etc (optional)
		["norcalli/nvim-colorizer.lua"] = {
			config = function()
				require("colorizer").setup()
			end,
		},

		-- Better colors (optional but highly recommended)
		["nvim-treesitter/nvim-treesitter"] = {
			run = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end,
		},

		-- Optional treesitter plugin
		--[[ ["nvim-treesitter/playground"] = {
			after = "nvim-treesitter",
		}, ]]

		-- Picker (optional)
		["nvim-telescope/telescope.nvim"] = {
			requires = { "nvim-lua/plenary.nvim" },
			tag = "0.1.0",
			event = "BufWinEnter",
			cmd = { "Telescope" },
			config = function()
				require("plugins.telescope")
			end,
		},

		-- Comment mappings like in vsc (ctrl-/) (optional)
		["numToStr/Comment.nvim"] = {
			ft = { "c", "lua" },
			event = "BufWinEnter",
			config = function()
				require("plugins.comment")
			end,
		},

		-- Autocompletion (optional but highly recommended)
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

		-- Autoclose brackets (optional)
		["windwp/nvim-autopairs"] = {
			ft = { "c", "lua" },
			event = "InsertEnter",
			config = function()
				require("nvim-autopairs").setup()
			end,
		},

		-- Autoformat (optional)
		["jose-elias-alvarez/null-ls.nvim"] = {
			ft = { "lua", "c", "html", "javascript", "json", "css" },
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.null-ls")
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
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
			},

			-- on_attach mappings
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

				pyright = {},
				rust_analyzer = {},
				tsserver = {},

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
