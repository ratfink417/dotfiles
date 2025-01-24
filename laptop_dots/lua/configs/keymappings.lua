local wk = require("which-key")
wk.add({
	-- Nvim Tree
	{ "<leader>n", group = "Nvim Tree" }, -- group
	{
		"<leader>nn",
		"<cmd>NvimTreeToggle<cr>",
		desc = "Toggle file tree",
		mode = "n",
	},

	-- Telescope
	{ "<leader>f", group = "Telescope" }, -- group
	{
		"<leader>ff",
		"<cmd>Telescope find_files<cr>",
		desc = "Find files by name",
		mode = "n",
	},
	{
		"<leader>fg",
		"<cmd>Telescope live_grep<cr>",
		desc = "Search files for text",
		mode = "n",
	},
	{
		"<leader>fb",
		"<cmd>Telescope buffers<cr>",
		desc = "Find buffers",
		mode = "n",
	},
	{
		"<leader>fh",
		"<cmd>Telescope help_tags<cr>",
		desc = "Help",
		mode = "n",
	},

	-- Trouble
	{ "<leader>x", group = "Menu" }, -- group
	{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
	{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
	{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
	{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
	{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },

	-- DAP UI
	  { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
})
