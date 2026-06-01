local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
	return
end

lsp_signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	hint_enable = false,    -- disable inline virtual text hint (floating window is enough)
	hi_parameter = "Search", -- highlight style for the active parameter
})
