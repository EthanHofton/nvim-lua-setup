-- nvim-treesitter v1: highlighting and indentation are Neovim built-ins.
-- The plugin now only manages parser installation.
local ts_indent_excluded = { c = true, cpp = true }

vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		local ok = pcall(vim.treesitter.start, event.buf)
		if ok and not ts_indent_excluded[vim.bo[event.buf].filetype] then
			vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

ts.install({
	"python", "markdown", "markdown_inline", "vim", "vimdoc",
	"javascript", "typescript", "java", "c", "cpp",
}, { force = false })
