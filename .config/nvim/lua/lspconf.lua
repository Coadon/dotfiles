-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Rounded floats
vim.diagnostic.config({
  -- float = { border = "rounded" },
  virtual_text = true,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
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
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
        }
        vim.diagnostic.open_float(nil, hover_opts)
      end,
    })

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- LANGUAGE SERVERS
--
--
--
--
--
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Clangd
vim.lsp.enable("clangd", {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--clang-tidy-checks='clang-analyzer-*,performance-*",
    "--inlay-hints=true",
  },
})

-- Harper
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "plaintex" },
  callback = function()
    vim.lsp.enable("harper_ls")
  end,
})

-- TS
vim.lsp.enable("ts_ls")

-- Gopls
vim.lsp.enable("gopls")

-- Rust
vim.lsp.enable("rust_analyzer")

-- Arduino
local MY_ARDUINO_FQBN = "arduino:avr:uno"
vim.lsp.enable("arduino_language_server", {
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-clangd", "/usr/bin/clangd",
    "-cli", "/usr/local/bin/arduino-cli",
    "-cli-config", "/Users/h/Library/Arduino15/arduino-cli.yaml",
    "-fqbn", MY_ARDUINO_FQBN
  }
})
