vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/RRethy/base16-nvim" },
})

-- nvim-tree
require("nvim-tree").setup({
    view = { width = 32 },
    update_focused_file = { enable = true },
    filters = { dotfiles = false },
    git = { enable = true },
})
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- fzf-lua
local fzf = require("fzf-lua")
fzf.setup({ "default" })
vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader>g", fzf.live_grep)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols)

vim.cmd.colorscheme("base16-gruvbox-dark-hard")
