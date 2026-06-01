local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                                     ",
}
dashboard.section.header.opts = { hl = "AlphaHeader", position = "center" }

dashboard.section.buttons.val = {
	dashboard.button("n", "󰈔  New File", ":ene <BAR> startinsert<CR>"),
	dashboard.button("f", "󰍉  Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "󱋢  Recent Files", ":Telescope oldfiles<CR>"),
	dashboard.button("g", "󰊄  Find Word", ":Telescope live_grep<CR>"),
	dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
}

local function get_cowsay()
	local fortune = vim.fn.system("fortune -s 2>/dev/null | cowsay 2>/dev/null")
	if vim.v.shell_error ~= 0 or fortune == "" then
		return { "  Stay curious." }
	end
	local lines = {}
	for line in fortune:gmatch("[^\n]+") do
		table.insert(lines, "  " .. line)
	end
	return lines
end

dashboard.section.footer.val = get_cowsay()
dashboard.section.footer.opts = { hl = "AlphaFooter", position = "center" }

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#65D1FF", bold = true })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#3EFFDC", italic = true })
	end,
})
vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#65D1FF", bold = true })
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#3EFFDC", italic = true })

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
