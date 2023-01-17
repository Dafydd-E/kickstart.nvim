local setup, nvimTree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

nvimTree.setup()