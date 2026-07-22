return {

    -- Comments
    "tpope/vim-commentary",

    -- Git
    "tpope/vim-fugitive",
    "esmuellert/codediff.nvim",
    "lewis6991/gitsigns.nvim",

    -- Surround
    "tpope/vim-surround",

    -- Formatter
    {
        "stevearc/conform.nvim",
        Lazy = true,
    },

    {
        "junegunn/vim-easy-align",
        keys = {
            { "ga", mode = { "x",  "n" }, "<Plug>(EasyAlign)", desc = "Easy align" },
        }
    },

    -- Fuzzy search
    {
        "ibhagwan/fzf-lua",
        dependencies = {{ dir = "/opt/homebrew/opt/fzf" }},
        config = function()
            vim.cmd("command W :w") -- Very annoying
        end,
        keys = {
            { "ff", "<cmd>FzfLua files<cr>", desc = "Fuzzy search files" },
            { "fg", "<cmd>FzfLua grep<cr>", desc = "Grep files" },
        }
    },

    -- Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        keys = {
            { "<space>t", "<cmd>Neotree<cr>", desc = "Open Tree." },
        }
    },
}
