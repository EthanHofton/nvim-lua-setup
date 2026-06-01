local conform_status, conform = pcall(require, "conform")
if not conform_status then
	return
end

conform.setup({
	formatters_by_ft = {
		python = { "black" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true })
