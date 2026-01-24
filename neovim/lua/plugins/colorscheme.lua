return
{
  "polirritmico/monokai-nightasty.nvim",
  lazy = false,
  priority = 1000,
	--@module "monokai-nightasty"
	--@type monokai.UserConfig
	opts = {
		dark_style_background = "#000000", -- default | dark | transparent #RRGGBB
		markdown_headers = true,
		-- hl_styles = { commonts = { italic = false } },
		terminal_colors = function (colors) return { fg = colors.fg_dark } end,
	},
	config = function(_, opts)
		vim.opt.cursorline = true, -- Highlight line at cursor position
		vim.o.background == "dark", -- Defaut to dark theme
		require("monokai-nightasty").load(opts)
	end,
}
