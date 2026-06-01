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

local function get_recent_files()
	local oldfiles = vim.v.oldfiles or {}
	local items = {}
	local count = 0

	for _, file in ipairs(oldfiles) do
		if count >= 5 then
			break
		end
		if vim.fn.filereadable(file) == 1 then
			count = count + 1
			local name = vim.fn.fnamemodify(file, ":t")
			table.insert(items, dashboard.button(tostring(count), "  " .. name, ":e " .. vim.fn.fnameescape(file) .. "<CR>"))
		end
	end

	if #items == 0 then
		return { { type = "text", val = "  No recent files", opts = { hl = "Comment", position = "center" } } }
	end

	return items
end

local recent_files_section = {
	type = "group",
	val = {
		{ type = "text", val = "─── Recent Files ───", opts = { hl = "AlphaHeader", position = "center" } },
		{ type = "group", val = get_recent_files, opts = { spacing = 0 } },
	},
	opts = { spacing = 1 },
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

alpha.setup({
	layout = {
		{ type = "padding", val = 2 },
		dashboard.section.header,
		{ type = "padding", val = 2 },
		dashboard.section.buttons,
		{ type = "padding", val = 1 },
		recent_files_section,
		{ type = "padding", val = 1 },
		dashboard.section.footer,
	},
	opts = { margin = 5, noautocmd = true },
})
