local status, venv_selector = pcall(require, "venv-selector")
if not status then
	return
end

venv_selector.setup({
	options = {
		notify_user_on_venv_activation = true,
	},
})

vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Select Python venv" })
vim.keymap.set("n", "<leader>cV", "<cmd>VenvSelectCached<cr>", { desc = "Reselect last Python venv" })
