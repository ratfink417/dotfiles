-- vim key bindings
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")

-- vim relative line numbers
vim.wo.relativenumber = false
vim.wo.number = true

-- vim tab length and shfit width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- disable perl and ruby provider warnings since I'm not using plugins written in those languages
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- load keymappings and plugin manager
require("configs.lazy")
require("configs.keymappings")
require('configs.nvim-dap-bash')
require("mason").setup()
