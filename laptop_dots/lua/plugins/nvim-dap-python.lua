return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- Update the path passed to setup to point to your system or virtual env python binary
		-- if you are working in a new virtualenv make sure to install debugpy with pip and 
		-- come back here to change the path to the python binary to use so that we debug from your new venv
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
	end,
}
