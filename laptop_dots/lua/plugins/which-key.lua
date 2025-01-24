return {
  "folke/which-key.nvim",
  event = "VeryLazy",
	dependencies = { 'echasnovski/mini.nvim' },
  opts = {
  preset = "modern"
  },
  keys = {
    {
      "<leader>?",
      function()
				local wk = require('which-key')
				wk.add({
					"<leader>nn",
					"<cmd>NvimTreeToggl<cr>"
				})
        wk.show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
