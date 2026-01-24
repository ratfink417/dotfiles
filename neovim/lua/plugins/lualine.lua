return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		require('lualine').setup {
		options = {
		theme = 'molokai',
    component_separators = '',
    section_separators = { left = '', right = '' },
  },

	winbar = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%='--[[ add your center components here in place of this comment ]]
    },
    lualine_x = {'lsp_status', 'filetype'},
   	lualine_y = { 'progress' },
   	lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 }
			}
		},

    inactive_winbar = {
    	lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = { 'filename', },
      lualine_x = {},
      lualine_y = {},
    	lualine_z = { 'location' },
    },

  	tabline = {},
  	extensions = {'nvim-tree', 'fugitive'},
		} end,
}
