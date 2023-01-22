local neotest_setup, neotest = pcall(require, 'neotest')
if not neotest_setup then
  return
end

neotest.setup {
  adapters = {
    require 'neotest-dotnet' {
      dap = { justMyCode = false },
    },
  },
}

local keymap = vim.keymap

keymap.set('n', '<leader>tib', '<Cmd>lua require("neotest").run.run()<CR>')
keymap.set('n', '<leader>tf', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
keymap.set('n', '<leader>ts', '<Cmd>lua require("neotest").run.stop()<CR>')
keymap.set('n', '<leader>dtib', '<Cmd>lua require("neotest").run.run({strategy = "dap"})<CR>')
