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
        "MeanderingProgrammer/render-markdown.nvim",
        ft = {
            "markdown",
        }
    },

    {
        "carlos-algms/agentic.nvim",
        opts = {
            acp_providers = {
                ["pi-acp"] = {
                    name = "That cool and nice PI ACP",
                    command = "pi-acp",
                },
            },
        },
    },

    -- Common dependencies
    {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
    },
}
