local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = "" }
    )
  end

  local config = {
    virtual_text = true, -- enable inline text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
  local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not status_cmp_ok then
    vim.notify("Failed to load cmp-nvim-lsp", "error")
    return
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities = cmp_nvim_lsp.default_capabilities()

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
end

return M