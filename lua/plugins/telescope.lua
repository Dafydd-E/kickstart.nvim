-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope_setup, telescope = pcall(require, 'telescope')
if not telescope_setup then
  return
end

telescope.setup {
  extensions = {
    command_palette = {
      {
        'File',
        { 'entire selection (C-a)', ':call feedkeys("GVgg")' },
        { 'save current file (C-s)', ':w' },
        { 'save all files (C-A-s)', ':wa' },
        { 'quit (C-q)', ':qa' },
        { 'file browser (C-i)', ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { 'search word (A-w)', ":lua require('telescope.builtin').live_grep()", 1 },
        { 'git files (A-f)', ":lua require('telescope.builtin').git_files()", 1 },
        { 'files (C-f)', ":lua require('telescope.builtin').find_files()", 1 },
      },
      {
        'Help',
        { 'tips', ':help tips' },
        { 'cheatsheet', ':help index' },
        { 'tutorial', ':help tutor' },
        { 'summary', ':help summary' },
        { 'quick reference', ':help quickref' },
        { 'search help(F1)', ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {
        'Vim',
        { 'reload vimrc', ':source $MYVIMRC' },
        { 'check health', ':checkhealth' },
        { 'jumps (Alt-j)', ":lua require('telescope.builtin').jumplist()" },
        { 'commands', ":lua require('telescope.builtin').commands()" },
        { 'command history', ":lua require('telescope.builtin').command_history()" },
        { 'registers (A-e)', ":lua require('telescope.builtin').registers()" },
        { 'colorshceme', ":lua require('telescope.builtin').colorscheme()", 1 },
        { 'vim options', ":lua require('telescope.builtin').vim_options()" },
        { 'keymaps', ":lua require('telescope.builtin').keymaps()" },
        { 'buffers', ':Telescope buffers' },
        { 'search history (C-h)', ":lua require('telescope.builtin').search_history()" },
        { 'paste mode', ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { 'spell checker', ':set spell!' },
        { 'relative number', ':set relativenumber!' },
        { 'search highlighting (F12)', ':set hlsearch!' },
      },
    },
  },
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
local fzf_setup, _ = pcall(telescope.load_extension, 'fzf')
if not fzf_setup then
  print 'Telescope fuzzy finder not installed'
end

local command_pallette_setup, _ = pcall(telescope.load_extension, 'command-palette')
if not command_pallette_setup then
  print 'Telescope command palette not installed'
end

local telescope_builtin_setup, telescope_builtin = pcall(require, 'telescope.builtin')
if not telescope_builtin_setup then
  return
end

local telescope_themes_setup, telescope_themes = pcall(require, 'telescope.themes')
if not telescope_themes_setup then
  return
end

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope_builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
