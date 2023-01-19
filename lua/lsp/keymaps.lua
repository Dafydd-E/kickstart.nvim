local keymap = vim.keymap
keymap.set('n', '<leader>cf', function()
  vim.lsp.buf.format()
end, { desc = 'test' })

keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
keymap.set('n', 'L', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
keymap.set('n', '<C-L>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

-- Lesser used LSP functionality
keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
