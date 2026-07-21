return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
    },

    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },

    {
        "yetone/avante.nvim",
        opts = {
            provider = "cline-cli",
            acp_providers = {
                ["cline-cli"] = {
                    command = "npx cline",
                    args = { "--acp" },
                },
            }
        }
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {
            "markdown",
            "Avante"
        }
    },

    -- Common dependencies
    {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
    },
}
