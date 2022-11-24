return function(config)
	vim.diagnostic.config(config.diagnostic)
	vim.lsp.set_log_level(config.log_level)

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

	local on_attach = function()
		for _, i in ipairs(config.mappings) do
			vim.keymap.set(i[1], i[2], i[3])
		end
	end

	for k, v in pairs(config.servers) do
		v.capabilities = capabilities
		v.on_attach = on_attach
		lspconfig[k].setup(v)
	end
end
