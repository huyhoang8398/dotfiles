local slow_format_filetypes = {}
local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        bash = { "shfmt" }
    },
    format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        local function on_format(err)
            if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
        end

        return { timeout_ms = 200, lsp_format = "fallback" }, on_format
    end,

    format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
        end
        return { lsp_format = "fallback" }
    end,

    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
        conform.format({
            timeout_ms = 5000,
            lsp_format = "fallback",
        })
    end)
})
