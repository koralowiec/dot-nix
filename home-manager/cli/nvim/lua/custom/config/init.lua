-- My custom options

vim.o.relativenumber = true

-- Navigation
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { desc = 'Left' })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { desc = 'Right' })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { desc = 'Up' })
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { desc = 'Down' })

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { desc = 'Toggle Neotree' })

-- Theme
vim.cmd.colorscheme 'catppuccin'

-- Snippets
-- https://github.com/rafamadriz/friendly-snippets/issues/262#issuecomment-1530321659
require("luasnip.loaders.from_vscode").load()
require("luasnip").filetype_extend("all", { "_" })

-- Github Copilot
-- https://github.com/orgs/community/discussions/8105
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set("i", "<C-H>", 'copilot#Accept("<CR>")', { desc = 'GitHub Copilot: accept', silent = true, expr = true })
vim.keymap.set("i", "<C-K>", 'copilot#Previous()', { desc = 'GitHub Copilot: previous', silent = true, expr = true })
vim.keymap.set("i", "<C-J>", 'copilot#Next()', { desc = 'GitHub Copilot: next', silent = true, expr = true })
