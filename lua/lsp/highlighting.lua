local M = {}

M.highlight = true

function M.toggle()
  M.highlight = not M.highlight
end

function M.highlight(client)
  if M.highlight then
    if client.server_capabilities.document_highlight then
      local present, illuminate = pcall(require, 'illuminate')
      if present then
        print 'attached illuminate'
        illuminate.on_attach(client)
      else
        print 'couldnt attach illuminate'
        vim.api.nvim_exec(
          [[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
          false
        )
      end
    end
  end
end

function M.setup(client)
  M.highlight(client)
end

local setup, illuminate = pcall(require, 'illuminate')
if setup then
  illuminate.configure {
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
    mode_denylist = {
      's',
      'S',
      'CTRL-S',
      'v',
      'V',
      'CTRL-V',
      'vs',
      'Vs',
    },
    under_cursor = true,
  }
end

return M
