-- ~/.config/nvim/init.lua -- Neovim 0.12+, no plugins

local o = vim.o
o.number, o.relativenumber = true, true
o.signcolumn, o.winborder = 'yes', 'rounded'
o.expandtab, o.shiftwidth, o.tabstop = true, 4, 4
o.ignorecase, o.smartcase, o.undofile = true, true, true
o.autocomplete = true
o.complete = 'o,.,w,b'
o.completeopt = 'menuone,noselect,fuzzy,popup,nearest'
o.cursorline = true
vim.opt.shortmess:append('c')

require("plugins")

vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--background-index', '--clang-tidy', '--header-insertion=never' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = { { '.clangd', 'compile_commands.json', 'compile_flags.txt' }, '.git' },
}

vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = {
        { 'go.work', 'go.mod' }, '.git'
    },
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
            semanticTokens = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}

vim.lsp.enable({ 'clangd', 'gopls' })

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = ev.buf,
            callback = function() vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 2000 }) end,
        })
    end,
})
