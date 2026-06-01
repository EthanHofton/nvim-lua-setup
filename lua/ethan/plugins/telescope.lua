local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

telescope.setup({
    defaults = {
        preview = {
            treesitter = false,
        },
        mappings = {
            i = {
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
