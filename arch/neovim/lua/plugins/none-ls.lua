return {
	"nvimtools/none-ls.nvim",
	dependencies = {"nvimtools/none-ls-extras.nvim"},
	config = function()
		local null_ls = require("null-ls")
		-- install any new linters or formatters you want via mason and add the package name to this list of sources
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.eslint_d"),
			},
		})
		vim.keymap.set("n", "<leader>gj", vim.lsp.buf.format, {})
	end,
}
