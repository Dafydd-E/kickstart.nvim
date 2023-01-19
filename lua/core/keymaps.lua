local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Movement
vim.keymap.set('n', '<C-j>', '<C-d>zz', { desc = 'Move up half a page and centre cursor' })
vim.keymap.set('n', '<C-k>', '<C-u>zz', { desc = 'Move down half a page and center cursor' })

-- Comment
vim.keymap.set('n', '<leader>/', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
vim.keymap.set('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')

-- Close buffers
vim.keymap.set('n', '<S-q>', '<cmd>Bdelete!<CR>')

-- DAP
keymap.set('n', '<C-D><C-B>', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>")
keymap.set('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>")
keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_over()<cr>")
keymap.set('n', '<leader>dO', "<cmd>lua require'dap'.step_out()<cr>")
keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>")
keymap.set('n', '<leader>du', "<cmd>lua require'dapui'.toggle()<cr>")
keymap.set('n', '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>")

-- Lsp
keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>')
