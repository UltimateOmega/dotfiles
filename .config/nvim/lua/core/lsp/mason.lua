local status_ok, mason = pcall(require, "mason")
if not status_ok then
  require "notify"("Failed to load mason", "error")
  return
end

local servers = {
  "sumneko_lua",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}

mason.setup {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

local mason_lspconfig_status_ok, mason_lspconfig =
  pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  require "notify"("Failed to load mason-lspconfig", "error")
  return
end

mason_lspconfig.setup {
  ensure_installed = servers,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("core.lsp.handlers").on_attach,
    capabilities = require("core.lsp.handlers").capabilities,
  }

  local require_ok, conf_opts = pcall(require, "core.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end