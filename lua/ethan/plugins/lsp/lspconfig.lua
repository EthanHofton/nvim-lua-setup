local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- Pass nvim-cmp capabilities to every LSP server
vim.lsp.config("*", {
	capabilities = cmp_nvim_lsp.default_capabilities(),
})

-- LSP keymaps applied whenever any server attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { noremap = true, silent = true, buffer = args.buf }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", require("actions-preview").code_actions, opts)
		vim.keymap.set({ "n", "v" }, "<leader>.", require("actions-preview").code_actions, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	end,
})

-- Python — override pyright settings (cmd/filetypes come from nvim-lspconfig defaults)
vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
})

vim.lsp.enable("pyright")

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--query-driver=/Users/ethanhofton/.espressif/tools/xtensa-esp-elf/*/xtensa-esp-elf/bin/xtensa-esp*-elf-g*",
	},
})
vim.lsp.enable("clangd")

vim.lsp.enable("ts_ls")
