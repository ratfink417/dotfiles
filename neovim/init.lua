-- vim key bindings
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")

-- vim relative line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- vim tab length and shfit width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- disable perl and ruby provider warnings since I'm not using plugins written in those languages
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- load keymappings and plugin manager
require("config.lazy")
require("config.options")
require("config.keymappings")

-- load gdb dap
require('plugins.dap.c_rust')

-- use global clipboard
vim.opt.clipboard:append('unnamedplus')

-- set colorscheme options
vim.cmd 'colorscheme monokai-nightasty'
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg="#000000"})

-- no more driving me insane by kicking me back to split screens while zoomed into a vim session
vim.g.tmux_navigator_disable_when_zoomed = 1

-- settings reccommended for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


