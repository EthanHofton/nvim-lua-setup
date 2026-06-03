local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- swap & auto-reload
opt.swapfile = false
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	command = "checktime",
})

-- Diagnostics
vim.diagnostic.config({
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	virtual_text = false,
})

local diag_ns = vim.api.nvim_create_namespace("custom_diag_vtext")

local hl_map = {
	[vim.diagnostic.severity.ERROR] = { sign = "DiagnosticSignError", text = "DiagnosticVirtualTextError" },
	[vim.diagnostic.severity.WARN]  = { sign = "DiagnosticSignWarn",  text = "DiagnosticVirtualTextWarn" },
	[vim.diagnostic.severity.HINT]  = { sign = "DiagnosticSignHint",  text = "DiagnosticVirtualTextHint" },
	[vim.diagnostic.severity.INFO]  = { sign = "DiagnosticSignInfo",  text = "DiagnosticVirtualTextInfo" },
}

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function(args)
		local bufnr = args.buf
		vim.api.nvim_buf_clear_namespace(bufnr, diag_ns, 0, -1)
		for _, diag in ipairs(vim.diagnostic.get(bufnr)) do
			local hl = hl_map[diag.severity]
			if hl then
				vim.api.nvim_buf_set_extmark(bufnr, diag_ns, diag.lnum, 0, {
					virt_text = {
						{ "    ● ", hl.sign },
						{ diag.message, hl.text },
					},
					virt_text_pos = "eol",
				})
			end
		end
	end,
})
