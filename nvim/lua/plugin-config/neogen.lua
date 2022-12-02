local status, neogen = pcall(require, "neogen")
if not status then
    vim.notify("没有找到 neogen")
    return
end

neogen.setup({
    type = "func",
    "class",
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "ldoc"
            }
        },
        python = {
            template = {
                annotation_convention = "google_docstrings"
            }
        },
        rust = {
            template = {
                annotation_convention = "rustdoc"
            }
        },
        javascript = {
            template = {
                annotation_convention = "jsdoc"
            }
        },
        typescript = {
            template = {
                annotation_convention = "tsdoc"
            }
        },
        typescriptreact = {
            template = {
                annotation_convention = "tsdoc"
            }
        },
        csharp = {
            template = {
                annotation_convention = "xmldoc"
            }
        }
    }
})
local opts = {
    noremap = true,
    silent = true
}
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
