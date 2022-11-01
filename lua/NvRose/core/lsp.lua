return function(config)
	vim.diagnostic.config(config.diagnostic)

	for k, v in pairs(config.icons) do
		local hl = "DiagnosticSign" .. k
		vim.fn.sign_define(hl, { text = v, numhl = hl, texthl = hl })
	end

	local lsp_ok, lspconfig = pcall(require, "lspconfig")
	local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

	if not lsp_ok or not cmp_ok then
		return nil
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	for k, v in pairs(config.servers) do
		v.capabilities = capabilities
		v.on_attach = on_attach
		lspconfig[k].setup(v)
	end

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = {
					"BufLeave",
					"CursorMoved",
					"InsertEnter",
					"FocusLost",
				},
				border = "rounded",
				scope = "cursor",
			})
		end,
	})
end
