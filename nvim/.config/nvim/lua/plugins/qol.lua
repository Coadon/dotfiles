local function noremap(mode, key, command)
    vim.keymap.set(mode, key, command, {noremap=true,silent=true})
end

local function map(mode, key, command)
    vim.keymap.set(mode, key, command)
end

return {

    "tpope/vim-fugitive",
    "tpope/vim-sensible",
    "tpope/vim-surround",
    "tpope/vim-commentary",

    "haya14busa/is.vim",

    "ntpeters/vim-better-whitespace",
    "itchyny/vim-cursorword",
    -- "luochen1990/rainbow",
    "HiPhish/rainbow-delimiters.nvim",

    "sbdchd/neoformat",
    "sindrets/diffview.nvim",

    {
        "mg979/vim-visual-multi",
    },

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup { scope = { highlight = highlight } }
            vim.g.rainbow_delimiters = { highlight = highlight }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            local Rule = require('nvim-autopairs.rule')
            local pairs = require('nvim-autopairs')
            pairs.setup()
            pairs.add_rule(Rule("//", "", {"c", "cpp"}))
        end
    },

    {
        "junegunn/fzf.vim",
        dependencies = {{ dir = "/opt/homebrew/opt/fzf" }},
        config = function()
            vim.g.fzf_layout = { down="~70%" }
            vim.g.rg_derive_root = "true"
            vim.o.grepprg = "rg --smart-case --hidden --follow"
            noremap("n", "ff", ":Files<cr>")
            noremap("n", "fg", ":Rg<cr>")
            noremap("n", "fl", ":Blines<cr>")
            vim.cmd("command W :w") -- Very annoying
        end
    },

    {
        "junegunn/vim-easy-align",
        config = function()
            map("x", "ga", "<Plug>(EasyAlign)")
            map("n", "ga", "<Plug>(EasyAlign)")
        end
    },

    {
        "github/copilot.vim",
    },

    {
        "smoka7/hop.nvim", -- maintained fork
        keys = {
            { '<leader><leader>f', ':HopChar1AC<cr>'    },
            { '<leader><leader>F', ':HopChar1BC<cr>'    },
            { '<leader><leader>s', ':HopChar1<cr>'      },
            { '<leader><leader>w', ':HopWord<cr>'       },
            { '<leader><leader>l', ':HopLine<cr>'       },
            { '<leader><leader>a', ':HopAnywhere<cr>'   },
        },
        config = function()
            require("hop").setup()
        end
    },
}
