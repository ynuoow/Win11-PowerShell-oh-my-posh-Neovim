-- local lsp_installer = require("nvim-lsp-installer")
require("mason").setup({
    -- 自动安装 Language Servers
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "bashls", "pyright", "html", "cssls", "emmet_ls", "jsonls", "tsserver",
                        "rust_analyzer", "yamlls", "omnisharp","prosemd_lsp"}
})
-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
    sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
    bashls = require("lsp.config.bash"),
    pyright = require("lsp.config.pyright"),
    html = require("lsp.config.html"),
    cssls = require("lsp.config.css"),
    emmet_ls = require("lsp.config.emmet"),
    jsonls = require("lsp.config.json"),
    tsserver = require("lsp.config.ts"),
    rust_analyzer = require("lsp.config.rust"),
    yamlls = require("lsp.config.yamlls"),
    omnisharp = require("lsp.config.omnisharp"),
    prosemd_lsp = require("lsp.config.markdown"),
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
