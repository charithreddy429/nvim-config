return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",

		opts = { ensure_installed = { "pyright" }, automatic_installation = false },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			-- Tell clangd that blink.cmp handles autocompletion
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local clangd_opts = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				capabilities = capabilities,
			}

			if vim.lsp.config then
				vim.lsp.config("clangd", clangd_opts)
				vim.lsp.enable("clangd")
			else
				require("lspconfig").clangd.setup(clangd_opts)
			end

			-- LSP Keymaps
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

			-- Keymap: Press <leader>cc to compile and run current C file
			vim.keymap.set("n", "<leader>cc", function()
				vim.cmd("w")
				local file = vim.fn.fnameescape(vim.fn.expand("%:p"))
				local out = vim.fn.fnameescape(vim.fn.expand("%:p:r"))
				local ft = vim.bo.filetype
				local ext = vim.fn.expand("%:e")

				local cmd_map = {
					c = string.format("gcc %s -o %s && %s", file, out, out),
					cpp = string.format("g++ -std=c++20 %s -o %s && %s", file, out, out),
					python = string.format("python3 %s", file),
					sh = string.format("bash %s", file),
					go = string.format("go run %s", file),
					rust = string.format("cargo run || (rustc %s -o %s && %s)", file, out, out),
				}

				local cmd = cmd_map[ft] or cmd_map[ext]

				if cmd then
					vim.cmd("split | terminal " .. cmd)
				else
					vim.notify("No execution rule configured for: " .. (ft ~= "" and ft or ext), vim.log.levels.WARN)
				end
			end, { desc = "Compile and Run Current File" })
		end,
	},
}
