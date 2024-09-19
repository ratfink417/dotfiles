local wk = require("which-key")
local dap = require('dap')
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

	-- Debugging
	{ "<leader>b", group = "Debugging" }, -- group
	{ "<leader>bb", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint at current line" },
	{ "<leader>bc", function() require("dap").set_breakpoint(vim.ui.input({prompt='Breakpoint condition: '}, function(input) return input end),nil,nil) end, desc = "Set a breakpoint condition" },
	{ "<leader>bl", function() require("dap").set_breakpoint(nil, nil, vim.ui.input({prompt='Log point message: '}, function(input) return input end)) end , desc = "Set a log point message for this breakpoint" },
	{ "<leader>br", function() require("dap").clear_breakpoints() end, desc = "Clear all breakpoints" },
	{ "<leader>ba",  "<cmd>Telescope dap list_breakpoints<CR>", desc = "Show breakpoint line numbers" },
	{ "<leader>bdc", "<cmd>DapContinue<CR>", desc = "Debugger continue" },
	{ "<leader>bj",  "<cmd>DapStepOver<CR>", desc = "Debugger step over" },
	{ "<leader>bk",  "<cmd>DapStepInto<CR>", desc = "Debugger step into" },
	{ "<leader>bo",  "<cmd>DapStepOut<CR>", desc = "Debugger step out" },
	{ "<leader>bdd", "<cmd>DapDisconnect<CR>", desc = "Disconnect from the current debug adapter" },
	{ "<leader>bdt", "<cmd>DapTerminate<CR>", desc = "Terminate the current dap-ui session" },
	{ "<leader>bdr", "<cmd>lua require'dap.repl.toggle()'<CR>", desc = "Toggle the repl interface" },
	{ "<leader>bdl", "<cmd>lua require'dap'.run_last()<CR>", desc = "Debugger run last" },
	{ "<leader>bdi", function() require("dap.ui.widgets").hover() end, desc = "Toggle hover text from dap" },
	{ "<leader>bd?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end, desc = "Show scopes in a floating window" },
	{ "<leader>bdf", "<cmd>Telescope dap frames<CR>", desc = "Show dap frames in a telescope prompt" },
	{ "<leader>bdh", "<cmd>Telescope dap commands<CR>", desc = "Show dap commands in a telescope prompt" },
	{ "<leader>bde",  function() require("telescope.builtin").diagnostics({ default_text = ":E:" }) end, desc = "Show diagnostics in a telescope prompt" },

	-- format buffer
	{ "<leader>g", group = "Formatting" }, -- group
	{ "<leader>gj", vim.lsp.buf.format, desc = "Format code in buffer"},

	-- code actions
	{ "<leader>c", group = "See available code actions" }, -- group
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "Format code in buffer"}, -- see available code actions, in visual mode will apply to selection
})
