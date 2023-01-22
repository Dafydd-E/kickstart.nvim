local jabs_setup, jabs = pcall(require, 'jabs')
if not jabs_setup then
  return
end

jabs.setup()

vim.keymap.set('n', '<leader>bo', ':JABSOpen<CR>')
