vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- zc and zo close and open fold under the cursor
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

local ok, ufo = pcall(require, 'ufo')
if not ok then
  return
end

-- ufo.setup {
--   provider_selector = function(bufnr, filetype, buftype)
--     return { 'lsp', 'treesitter' } --'indent' }
--   end,
-- }
