-- NVIM-CMP
--
--
local cmp = require('cmp')
local luasnip = require("luasnip")

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
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
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'copilot' },
        { name = 'luasnip' },
        { name = 'path' },
    }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = true,
    },
}

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})

local kinds = {
    Text = "t",
    Method = "M",
    Function = "ƒ",
    Constructor = "*",
    Field = "f",
    Variable = "v",
    Class = "C",
    Interface = "I",
    Module = "M",
    Property = "p",
    Unit = "unit",
    Value = "val",
    Enum = "e",
    Keyword = "\"",
    Snippet = "",
    Color = "color",
    File = "file",
    Reference = "ref",
    Folder = "/",
    EnumMember = ".",
    Constant = "#",
    Struct = "S",
    Event = "E",
    Operator = "+",
    TypeParameter = ":",
    Copilot = "µ",
}

cmp.setup{
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', kinds[vim_item.kind])
            return vim_item
        end
    }
}

-- luasnip
require("luasnip.loaders.from_snipmate").lazy_load('../snippets/*')
