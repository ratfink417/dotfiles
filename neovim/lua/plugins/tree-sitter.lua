return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ignore_install = {},
			ensure_installed = {"c", "lua", "rust", "python", "ron"},
			modules = {},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
