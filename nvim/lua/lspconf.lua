-- LANGUAGE SERVERS
--
--
--
--
--
--

-- Callbacks
vim.cmd([[

au BufEnter,BufNew *.md,*.tex,*.typ,*.txt   lua vim.lsp.enable("harper_ls")
au FileType cpp,c                           lua vim.lsp.enable("clangd")
au FileType typescript,typescriptreact      lua vim.lsp.enable("ts_ls")
au FileType rust                            lua vim.lsp.enable("rust_analyzer")
au FileType lua                             lua vim.lsp.enable("lua_ls")

]])

-- Clangd
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks='clang-analyzer-*,performance-*",
        "--inlay-hints=true",
    }
})

-- Arduino
local MY_ARDUINO_FQBN = "arduino:avr:uno"

vim.lsp.config("arduino_language_server", {
    cmd = {
        "arduino-language-server",
        "-clangd", "/usr/bin/clangd",
        "-cli", "/usr/local/bin/arduino-cli",
        "-cli-config", "/Users/h/Library/Arduino15/arduino-cli.yaml",
        "-fqbn", MY_ARDUINO_FQBN
    }
})

--
-- OTHER STUFF
--
--
--
--
--
--
--

function on_lsp_attach(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    -- These are supposed to be global bindings but I'll leave them in the
    -- closure anyways.
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    --- inlay hints (enable or disable)
    vim.lsp.inlay_hint.enable(false)

    --- toggle diagnostics
    vim.diagnostic.enable()

    --- autocmd to show diagnostics on CursorHold
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        desc = "✨lsp show diagnostics on CursorHold",
        callback = function()
            local hover_opts = {
                focusable = false,
                close_events = {
                    "BufLeave", "CursorMoved", "InsertEnter", "FocusLost"
                },
                border = "rounded",
                source = "always",
                prefix = " ",
            }
            vim.diagnostic.open_float(nil, hover_opts)
        end,
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = on_lsp_attach
})

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = '!',
        },
    },
})
