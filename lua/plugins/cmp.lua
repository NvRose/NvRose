return function()
	local ok, cmp = pcall(require, "cmp")

	if ok then
		vim.opt.completeopt = "menu,menuone,noinsert"

		local function has_words_before()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")

		cmp.setup({
			window = {
				completion = {
					autocomplete = true,
					keyword_lenght = 2,
					scrolloff = 3,
					scrollbar = false,
					border = "rounded",
				},

				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					border = "rounded",
				},
			},

			matching = {
				disallow_fuzzy_matching = false,
				disallow_partial_matching = false,
				disallow_prefix_unmatching = false,
			},

			experimental = {
				ghost_text = true,
			},

			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({
							behavior = cmp.SelectBehavior.Select,
						})
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({
							behavior = cmp.SelectBehavior.Select,
						})
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<c-space>"] = cmp.mapping.complete(),

				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
				}),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
			}),

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end
end
