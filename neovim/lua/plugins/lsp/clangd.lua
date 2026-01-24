return {
  "neovim/nvim-lspconfig",
  opts = {
		cmd = {
			'clagnd',
			'--clang-tidy',
			'--background-index',
			'--offset-encoding=utf-8'
		},
		root_markers = {'.clangd', 'compile_commands.json', 'compile_flags.txt'},
		filetypes = {'c', 'cpp'},
    servers = {
      clangd = {
        mason = false, -- Skip Mason installation; use system clangd
      },
    },
  },
}
