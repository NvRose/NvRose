local ok, null_ls = pcall(require, "null-ls")

if ok then
	local group = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.autopep8,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.diagnostics.tidy,
			null_ls.builtins.formatting.prettier,
		},

		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = group,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end
