local signs = { Error = " 🞮", Warn = " ▲", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Load servers (They will be automatically installed after next "Sync plugins" launch)
-- Check installed servers by :LspInstallInfo

-- require('lsp.servers.bash')
require('lsp.servers.css')
-- require('lsp.servers.graphql')
require('lsp.servers.html')
require('lsp.servers.json')
require('lsp.servers.lua')
require('lsp.servers.tsserver')
-- require('lsp.servers.tailwind')
