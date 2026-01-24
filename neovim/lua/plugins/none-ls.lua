return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls") -- Use 'null-ls' internally; this is intentional
    opts.sources = vim.list_extend(opts.sources or {}, {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort,
    })
    return opts
  end,
}
