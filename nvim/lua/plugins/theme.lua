return {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
        vim.cmd.colorscheme("oxocarbon")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end
    -- "shaunsingh/nord.nvim",
    -- config = function()
    --     vim.g.nord_disable_background = true
    --     vim.g.nord_borders = false
    --     vim.g.nord_italic = false
    --     require("nord").set()
    -- end
}
