
require'nvim-treesitter.configs'.setup {
    highlight = { 
        enable = true, -- enable treesitter syntax highlighting
    }, 
    indent = { enable = true }, -- better indentation behavior
    ensure_installed = {
        -- auto-install the Treesitter parser for python and related languages
        "python",
        "toml",
        "rst",
        "ninja",
        -- needed for formatting code-blocks inside markdown via conform.nvim
        "markdown", 
        "markdown_inline", 
        "lua",
        "typescript"
    },
}

--vim.api.nvim_create_autocmd("BufWritePre", {
    --group = vim.api.nvim_create_augroup("Format", { clear = true }),
    --pattern = "*.js,*.jsx,*.ts,*.tsx",
    --callback = function() vim.cmd("Neoformat") end
--})

-- SEMSHI
--vim.g.python3_host_prog = vim.fn.exepath("python")

--vim.g["semshi#error_sign"] = false
--vim.g["semshi#simplify_markup"] = false
--vim.g["semshi#mark_selected_nodes"] = false
--vim.g["semshi#update_delay_factor"] = 0.001

--require("mason").setup()
--require("mason-lspconfig").setup({
    --ensure_installed = { "tsserver" }
--})

--local lspconfig = require('lspconfig')

--lspconfig.tsserver.setup{
    --on_attach = function(client, bufnr)
        --if client.server_capabilities.inlayHintProvider then
            --vim.lsp.buf.inlay_hint(bufnr, false)
        --end
    --end
--}

-- Setting semshiGlobal to altfont essentially disables semshiGlobal
--vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    --callback = function()
        --vim.cmd([[
            --highlight semshiSelf guifg=#4FC1FE guibg=NONE
            --highlight! semshiGlobal gui=altfont
            --highlight! link semshiImported @lsp.type.namespace
            --highlight! link semshiParameter @lsp.type.parameter
            --highlight! link semshiParameterUnused DiagnosticUnnecessary
            --highlight! link semshiBuiltin @function.builtin
            --highlight! link semshiAttribute @field
            --highlight! link semshiUnresolved @lsp.type.unresolvedReference
            --highlight! link semshiFree @comment
        --]])
    --end,
--})

vim.o.background = 'dark'

local c = require('vscode.colors').get_colors()

require('vscode').setup({
    group_overrides = {
        ["@keyword"] = {fg = c.vscBlue, bg = 'NONE'},
        ["@keyword.coroutine"] = {fg = c.vscPink, bg = 'NONE'},
        ["@keyword.return"] = {fg = c.vscPink, bg = 'NONE'},
        ["@tag"] = {fg = c.vscBlueGreen, bg = 'NONE'},
    }
})

require('vscode').load()

require('auto-session').setup()

require('indent_blankline').setup({
    char = '│',
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = false,
})

-- Indent blank line
--require('ibl').setup({
    --char = "",
    --context_char = "|",
    --show_current_context = true,
    --show_current_context = true,
    --scope = {
        ---- Removes annoying thing that underlines current scope
        --enabled = true,
        --show_start = false,
        --show_end = true,
    --},
    --indent = {
        --smart_indent_cap = false,
    --}
--})

require('lualine').setup()
require('gitsigns').setup()

-- Set fold keybinds for UFO
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local builtin = require("statuscol.builtin")
require("statuscol").setup({
    relculright = true,
    segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    },
})

require('ufo').setup()
