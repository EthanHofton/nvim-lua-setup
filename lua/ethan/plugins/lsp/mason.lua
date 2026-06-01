local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_tool_status, mason_tool = pcall(require, "mason-tool-installer")
if not mason_tool_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"pyright",
		"clangd",
		"ts_ls",
	},
	automatic_enable = true,
})

mason_tool.setup({
	ensure_installed = {
		"black",
		"clang-format",
		"prettier",
	},
})
