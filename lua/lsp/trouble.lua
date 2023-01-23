local trouble_setup, trouble = pcall(require, 'trouble')
if not trouble_setup then
  print 'trouble not setup'
  return
end

trouble.setup()

vim.keymap.set('n', '<leader>tt', ':TroubleToggle<CR>')
