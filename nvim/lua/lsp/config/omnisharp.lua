-- local util = require('lspconfig').util
local util = require('mason-lspconfig').util

local opts = {
    use_mono = true,
    -- dap = require("dap.nvim-dap.net"),
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = {
        debounce_text_changes = 150
    },
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        -- client.server_capabilities.document_formatting = false
        -- client.server_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
    end
}
return {
    on_setup = function(server)

        server.setup(opts)

    end
}
