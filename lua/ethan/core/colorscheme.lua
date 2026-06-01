local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
    print("Colorscheme not found!")
    return
end

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#fc514e" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#e3d18a" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#a1cd5e" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = "#82aaff" })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#9e4e4b" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#9e8c50" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = "#5e8c40" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = "#4e6a9e" })
