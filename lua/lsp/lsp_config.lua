-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
vim.diagnostic.config {
  severity_sort = true,
  float = {
    source = 'if_many',
  },
}

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  require('lsp.formatting').setup(client, bufnr)
  require('lsp.highlighting').setup(client)
  require('lsp.lspsaga').setup()
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  tsserver = {},
  omnisharp = {
    enable_editorconfig_support = true,
    enable_roslyn_analyzers = true,
  },
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_lsp_setup, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_setup then
  return
end

capabilities = cmp_lsp.default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
local mason_setup, mason = pcall(require, 'mason')
if not mason_setup then
  return
end

mason.setup()

-- Ensure the servers above are installed
local mason_lspconfig_setup, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_setup then
  return
end

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
-- local fidget_setup, _ = pcall(require, 'fidget')
-- if not fidget_setup then
--   return
-- end

--fidget.setup()
