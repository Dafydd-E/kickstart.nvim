local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local legendary_setup, legendary = pcall(require, 'legendary')
if not legendary_setup then
  return
end

legendary.setup { include_builtin = true, auto_register_which_key = true }
keymap('n', '<C-p>', "<cmd>lua require('legendary').find()<CR>", default_opts)
