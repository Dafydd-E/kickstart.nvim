local setup, nvimTree = pcall(require, 'nvim-tree')
if not setup then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle nvim tree view' })

local function change_root_to_global_cwd()
    local api = require 'nvim-tree.api'
    local global_cwd = vim.fn.getcwd()
    print(global_cwd)
    api.tree.change_root(global_cwd)
end

local config = {
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = 'h', action = 'close_node' },
                { key = 'w', action = 'global_cwd', action_cb = change_root_to_global_cwd },
                { key = 'l', action = 'edit' },
            },
        },
    },
}
nvimTree.setup(config)
