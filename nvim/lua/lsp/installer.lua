local lsp_installer = require("nvim-lsp-installer")

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if server.name == "bash" then
      opts.settings = require('lsp.servers.bash').settings
    end

    if server.name == "cssls" then
      opts.settings = require('lsp.servers.css').settings
    end

    if server.name == "eslint" then
        opts.on_attach = function (client, bufnr)
            -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
            -- the resolved capabilities of the eslint server ourselves!
            client.resolved_capabilities.document_formatting = true
            on_attach(client, bufnr)
        end
        opts.settings = require('lsp.servers.eslint').settings
    end

    if server.name == "html" then
      opts.capabilities = require('lsp.servers.html').capabilities
      opts.settings = require('lsp.servers.html').settings
    end

    if server.name == "jsonls" then
      opts.settings = require('lsp.servers.json').settings
    end

    if server.name == "sumneko_lua" then
      opts.settings = require('lsp.servers.lua').settings
    end


    -- (How to) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    --     opts.on_attach = function(client, bufnr) ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
