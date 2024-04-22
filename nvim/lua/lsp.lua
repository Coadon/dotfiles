-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

local lspconfig = require('lspconfig');


-- LANGUAGE SERVERS
--
--
--
--
--
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'clangd' }

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    }
end

-- Arduino
local MY_ARDUINO_FQBN = "arduino:avr:uno"
lspconfig.arduino_language_server.setup {
    flags = lsp_flags,
    capabilities = capabilities,
    cmd = {
        "arduino-language-server",
        "-clangd", "/usr/bin/clangd",
        "-cli", "/usr/local/bin/arduino-cli",
        "-cli-config", "/Users/h/Library/Arduino15/arduino-cli.yaml",
        "-fqbn", MY_ARDUINO_FQBN
    }
}

--require("clangd_extensions").setup {
--    server = {
--        flags = lsp_flags,
--        capabilities = capabilities,
--        cmd = {
--            "clangd",
--            "--background-index",
--            "--clang-tidy",
--            "--header-insertion-decorators",
--            "--suggest-missing-includes",
--            "--all-scopes-completion",
--            "--pretty",
--            "-j=4",
--            --"--header-insertion=never",
--        },
--    },
--}

-- NVIM-CMP
-- Completion
--
--
--
--
--
local cmp = require('cmp')
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup ({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
       luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
      elseif check_backspace() then
       fallback()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'codeium' },
    { name = 'buffer' }, -- 
    { name = 'path' },
  }),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- luasnip
require("luasnip.loaders.from_snipmate").lazy_load('../snippets/*')

local kind_icons = {
  Text = "",
  Method = "M",
  Function = "ƒ",
  Constructor = "",
  Field = "f",
  Variable = "v",
  Class = "C",
  Interface = "I",
  Module = "",
  Property = "p",
  Unit = "",
  Value = "",
  Enum = "e",
  Keyword = "*",
  Snippet = "",
  Color = "",
  File = "∑",
  Reference = "",
  Folder = "/",
  EnumMember = ".",
  Constant = "#",
  Struct = "S",
  Event = "",
  Operator = "+",
  TypeParameter = ":",
  Codeium = "µ",
}

cmp.setup{
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      return vim_item
    end
  }
}
