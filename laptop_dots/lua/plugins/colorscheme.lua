return {
"navarasu/onedark.nvim",
priority = 1000, -- load the colorscheme before other plugins
config = function()
  vim.cmd([[colorscheme onedark]]) -- run the command that sets this as the colorscheme
end,
}
