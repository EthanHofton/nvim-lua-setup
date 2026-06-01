local status, actions_preview = pcall(require, "actions-preview")
if not status then
	return
end

actions_preview.setup({
	highlight_command = {},
	backend = { "telescope" },
	telescope = {
		sorting_strategy = "ascending",
		layout_strategy = "cursor",
		layout_config = {
			width = 60,
			height = 15,
		},
	},
})
