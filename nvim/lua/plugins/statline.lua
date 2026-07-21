local function wordcount()
    return
end

return {
    "rebelot/heirline.nvim",
    config = function()
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")

        local colors = {
            white = "#999999",
            grey = "#555555",
            yolk = "#ebdbb2",
            red = "#fb4934",
            orange = "#fb7744",
            green = "#b8bb26",
            blue = "#458588",
        }

        require("heirline").load_colors(colors)

        local ViMode = {
            init = function(self)
                self.mode = vim.fn.mode(1)
            end,
            static = {
                mode_names = {
                    n = "N",
                    i = "I",
                    v = "V",
                    V = "VL",
                    ["\22"] = "VB",
                    c = "C",
                    s = "S",
                    S = "SL",
                    ["\19"] = "SB",
                    r = "R",
                    R = "R",
                    ["\21"] = "VR",
                },
                mode_colors = {
                    n = "green",
                    i = "blue",
                    v = "yolk",
                    V = "yolk",
                    ["\22"] = "yolk",
                    c = "red",
                },
            },
            provider = function(self)
                return "  [" .. (self.mode_names[self.mode] or "") .. "] "
            end,
            hl = function(self)
                local mode = self.mode:sub(1, 1)
                return { fg = (self.mode_colors[mode] or "white"), bold = true }
            end,
        }

        local FileName = {
            init = function(self)
                self.filename =
                    vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
            end,
            provider = function(self)
                return " " .. self.filename
            end,
            hl = { fg = "white" },
        }

        -- 3. File Properties (Readonly / Modified)
        local FileFlags = {
            init = function(self)
                self.readonly = vim.bo.readonly
                self.modified = vim.bo.modified
            end,
            provider = function(self)
                local flags = ""
                if self.readonly then flags = flags .. " ne" end
                if self.modified then flags = flags .. " *" end
                return flags .. "  "
            end,
            hl = { fg = "green" },
        }

        local Locator = {
            provider = function(self)
                return "%P %l:%c " .. tostring(vim.fn.wordcount().words)
            end,
            hl = { fg = "grey" },
        }

        local Align = { provider = "%=" }

        local Diagnostics = {
            condition = conditions.has_diagnostics,

            static = {
                error_icon = "E",
                warn_icon = "W",
                info_icon = "I",
                hint_icon = "h",
            },

            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,

            update = { "DiagnosticChanged", "BufEnter" },

            {
                provider = function(self)
                    -- 0 is just another output, we can decide to print it or not!
                    return self.errors > 0 and (self.error_icon .. self.errors .. " ")
                end,
                hl = { fg = "red" },
            },
            {
                provider = function(self)
                    return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
                end,
                hl = { fg = "orange" },
            },
            {
                provider = function(self)
                    return self.info > 0 and (self.info_icon .. self.info .. " ")
                end,
                hl = { fg = "blue" },
            },
            {
                provider = function(self)
                    return self.hints > 0 and (self.hint_icon .. self.hints)
                end,
                hl = { fg = "green" },
            },
        }

        local FileFormat = {
            provider = function()
                local fmt = vim.bo.fileformat
                return fmt ~= 'unix' and fmt:upper()
            end
        }

        local Git = {
            condition = conditions.is_git_repo,

            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or
                    self.status_dict.changed ~= 0
            end,

            hl = { fg = "orange" },


            { -- git branch name
                provider = function(self)
                    return " " .. self.status_dict.head
                end,
                hl = { fg = "green" }
            },
            -- You could handle delimiters, icons and counts similar to Diagnostics
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = "("
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
                hl = { fg = "green" },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
                hl = { fg = "red" },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
                hl = { fg = "yolk" },
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = ")",
            },
        }

        -- Combine components
        local StatusLine = {
            ViMode,
            FileName,
            FileFlags,
            Locator,
            Align,
            Diagnostics,
            FileFormat,
            Git
        }

        require("heirline").setup {
            statusline = StatusLine
        }
    end
}

-- MODE filename | location progress wordcount | filetype diff diag | branch
