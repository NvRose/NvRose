require("NvRose")({
	-- Fresh install (comment/remove after installation)
	bootstrap = false,

	-- Colorcheme, can be nil
	colorscheme = "duotone",

	-- Hide cmd when not used (+1 line to see more code)
	autohide_cmd = true,

	-- :LuaCacheProfile
	startup_profile = false,

	snippets = true,

	-- Builtin plugins
	base = {
		["trim"] = { enable = true --[[, ...options ]] },
		["terminal"] = { enable = true --[[, ...options ]] },
		["statusline"] = { enable = true --[[, ...options ]] },
		["tabline"] = { enable = true --[[, ...options ]] },
		["resize"] = { enable = true --[[, ...options ]] },
	},

	-- See plugins options at: https://github.com/wbthomason/packer.nvim
	plugins = {
		-- Tabline icons (optional)
		["nvim-tree/nvim-web-devicons"] = {},

		["nvim-treesitter/playground"] = {},

		-- Matchit and MatchParen better replacement
		["andymass/vim-matchup"] = {
			config = function()
				vim.g.matchup_matchparen_offscreen = { ["method"] = "status_manual" }
			end,
		},

		-- Color hex strings etc (optional)
		["norcalli/nvim-colorizer.lua"] = {
			config = function()
				require("colorizer").setup()
			end,
		},

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

				cssls = {},

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
